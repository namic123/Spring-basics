package com.example.spring20230920.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@Controller
@RequestMapping("main18")
public class Controller18 {
    // get / main18/ sub1
    @GetMapping("sub1")
    public void method1(Model model) throws Exception {
        String url = "";
        String username = "";
        String password = "";

        String sql = """
                        SELECT customerName
                        FROM customers
                        WHERE customerID =1
                """;

        // JDBC api에서 데이터베이스와의 연결을 수립하기 위한 메서드
        Connection connection = DriverManager.getConnection(url, username, password);
        // SQL 쿼리를 실행하고 DB로부터 결과를 받아오는 데 사용된다.
        Statement statement = connection.createStatement();
        // Statement 객체를 사용하여 SQL 쿼리를 실행하고 결과를 받아오는 역할을 함.
        ResultSet resultSet = statement.executeQuery(sql);

        try (connection; statement) {
            try (resultSet) {
                resultSet.next();   // 다음 행의 데이터를 읽어옴
                String name = resultSet.getString(1);
                model.addAttribute("customerName", name);

            }
        }


    }
}
