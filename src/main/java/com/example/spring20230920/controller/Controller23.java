package com.example.spring20230920.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("main23")
public class Controller23 {
    @Autowired
    private DataSource dataSource;

    // LIKE 와일드카드 사용 및 리퀘스트 파라미터로 받아 사용하는 예제
    @GetMapping("sub1")
    public void method1(String keyword) throws SQLException {
        String sql = """
                SELECT * FROM products
                WHERE productName LIKE ?        
                """;
        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, "%"+keyword+"%");    // 리퀘스트 파라미터로 받은 문자열을 특정 검색 조건으로 지정
        ResultSet resultSet = preparedStatement.executeQuery();

        System.out.println();
        System.out.println("ch가 포함된 상품명들");
        try (connection; preparedStatement; resultSet){
            while (resultSet.next()){
                String name = resultSet.getString("productName");
                System.out.println("name = " + name);
            }
        }
    }

    // 예제 ) /main23/sub2?k=ch
    // erd라는 텍스트가 중간에 있는 고객명 조회
    @GetMapping("sub2")
    public void method2(Model model, @RequestParam(value = "k", defaultValue = "") String k) throws SQLException {
        String sql = """
                SELECT * FROM customers
                WHERE customerName LIKE ?
                """;
        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1,"%"+k+"%");
        ResultSet resultSet = preparedStatement.executeQuery();
        List<String> list = new ArrayList<>();
        try (connection;preparedStatement;resultSet){
            while (resultSet.next()){
                String name = resultSet.getString("customerName");
                System.out.println("name = " + name);
                list.add(name);
            }
        }
        model.addAttribute("keyword", k);
        model.addAttribute("customerList", list);
    }

    // /main23/sub3?st=name1
    @GetMapping("sub3")
    public void method3(@RequestParam(value = "st", defaultValue = "name1") String searchType,
                        @RequestParam(value = "k", defaultValue = "") String keyword,
                        Model model) throws SQLException {
        String sql = """
                SELECT * FROM customers
                WHERE
                """;

        if (searchType.equals("name1")) {
            sql += "customerName LIKE ?";
        } else if (searchType.equals("name2")) {
            sql += "contactName LIKE ?";
        }

        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, "%" + keyword + "%");

        ResultSet resultSet = statement.executeQuery();

        List<Map<String, Object>> list = new ArrayList<>();
        try (connection; statement; resultSet) {
            while (resultSet.next()) {
                String customerName = resultSet.getString("customerName");
                String contactName = resultSet.getString("contactName");

                list.add(Map.of("customerName", customerName, "contactName", contactName));
            }
            model.addAttribute("searchType", searchType);
            model.addAttribute("keyword", keyword);
            model.addAttribute("customers", list);
        }

    }
    @GetMapping("sub4")
    public void main4(@RequestParam(value = "t", defaultValue = "lname") String t,
                      @RequestParam(value = "k", defaultValue = "") String keyword, Model model) throws SQLException {
        String sql = """
                SELECT * FROM employees
                WHERE 
                """;
        if(t.equals("lname")){
            sql += "lastName LIKE ?";
        } else if (t.equals("fname")) {
            sql += "firstName LIKE ?";
        }else if(t.equals("notes")){
            sql += "notes LIKE ?";
        }
        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, "%"+keyword+"%");
        ResultSet resultSet = preparedStatement.executeQuery();
        List<Map<String, Object>> list = new ArrayList<>();
        try(connection;preparedStatement;resultSet){
            while (resultSet.next()){
                String firstName = resultSet.getString("firstName");
                String lastName = resultSet.getString("lastName");
                String notes = resultSet.getString("notes");

                list.add(Map.of("firstName",firstName,"lastName",lastName,"notes",notes));
            }
            model.addAttribute("k", keyword);
            model.addAttribute("employeeList", list);
        }
    }
}
