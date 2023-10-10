package com.example.spring20230920.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.sql.DataSource;
import javax.swing.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("main22")
public class Controller22 {
    @Autowired
    private DataSource dataSource;
    @GetMapping("sub1")
    public void method1(Integer page) throws SQLException {
        String sql = """
                SELECT customerId id, 
                       customerName name
                FROM customers
                ORDER BY id
                LIMIT ?, ?
                """;
        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
//        preparedStatement.setInt(1, 0); // 1페이지
//        preparedStatement.setInt(2, 10); // 10개
//        preparedStatement.setInt(1, 10); // 2페이지
//        preparedStatement.setInt(2, 10); // 10개
        preparedStatement.setInt(1, (page-1)*10); // 2페이지
        preparedStatement.setInt(2, 10); // 10개

        ResultSet resultSet = preparedStatement.executeQuery();
        try(connection; preparedStatement; resultSet){
            System.out.println("고객 목록");
            while (resultSet.next()){
                String id = resultSet.getString(1);
                String name = resultSet.getString(2);
                System.out.println("id = " + id + " :  name =" +name );

            }
        }

    }
    @GetMapping("sub2")
    public void method2(@RequestParam(value = "p", defaultValue = "1") Integer page,
                        Model model) throws SQLException {
        String sql = """
                SELECT supplierId id,
                       supplierName name
                FROM suppliers
                ORDER BY id
                LIMIT ?, ?
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);

        statement.setInt(1, (page - 1) * 7);
        statement.setInt(2, 7);

        ResultSet resultSet = statement.executeQuery();

        List<Map<String, Object>> list = new ArrayList<>();
        try (connection; statement; resultSet) {
//            System.out.println(page + "페이지 공급자 목록");
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");

                list.add(Map.of("id", id, "name", name));
//                System.out.println(id + " : " + name);
            }
        }

        String sql1 = """
                SELECT COUNT(*)
                FROM suppliers
                """;
        Connection connection1 = dataSource.getConnection();
        Statement statement1 = connection1.createStatement();
        ResultSet resultSet1 = statement1.executeQuery(sql1);
        try (connection1; statement1; resultSet1){
            int countAll = resultSet1.getInt(1);
            int lastPageNumber = ((countAll -1) / 7)+1;
            model.addAttribute("lastPageNumber", lastPageNumber);
        }

        // 마지막 페이지 번호
        model.addAttribute("supplierList", list);
    }
    // /main22/sub3?p=2
    // 2페이지 고객목록을 jsp에 테이블 형식 (id, name)출력
    // page 번호로 링크 생성
    // 1페이지에 5개씩
    @GetMapping("sub3")
    public void method3(@RequestParam(value = "p", defaultValue = "1") Integer page,
                        Model model) throws SQLException {
        String sql = """
                SELECT customerId id,
                       customerName name
                FROM customers
                ORDER BY id
                LIMIT ?, 5
                """;

        String sql1 = """
                SELECT COUNT(*) FROM customers
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, (page - 1) * 5);
        ResultSet resultSet = statement.executeQuery();

        Statement statement1 = connection.createStatement();
        ResultSet resultSet1 = statement1.executeQuery(sql1);

        int lastPageNumber = 1;
        try (connection; statement; statement1; resultSet; resultSet1) {
            if (resultSet1.next()) {
                int countAll = resultSet1.getInt(1);
                lastPageNumber = (countAll - 1) / 5 + 1;

                model.addAttribute("lastPageNumber", lastPageNumber);
            }

            List<Map<String, Object>> list = new ArrayList<>();

            while (resultSet.next()) {
                Integer id = resultSet.getInt("id");
                String name = resultSet.getString("name");

                list.add(Map.of("id", id, "name", name));
            }
            model.addAttribute("customerList", list);
        }

        model.addAttribute("currentPage", page);

        int leftPageNumber = (page - 1) / 5 * 5 + 1;
        int rightPageNumber = leftPageNumber + 4;
        int prevPageNumber = leftPageNumber - 5;
        int nextPageNumber = rightPageNumber + 1;

        rightPageNumber = Math.min(rightPageNumber, lastPageNumber);

        model.addAttribute("prevPageNumber", prevPageNumber);
        model.addAttribute("nextPageNumber", nextPageNumber);
        model.addAttribute("leftPageNumber", leftPageNumber);
        model.addAttribute("rightPageNumber", rightPageNumber);

    }

//    @GetMapping("sub3")
//    public void method3(@RequestParam(value= "p", defaultValue= "1") Integer page, Model model) throws SQLException {
//        String sql = """
//                SELECT customerId id, customerName name
//                FROM customers
//                ORDER BY id
//                LIMIT ?, ?
//                """;
//        Connection connection = dataSource.getConnection();
//        PreparedStatement statement = connection.prepareStatement(sql);
//        statement.setInt(1, (page - 1) * 10);
//        statement.setInt(2, 10);
//        ResultSet resultSet = statement.executeQuery();
//        List<Map<String, Object>> list = new ArrayList<>();
//        Map<String, Object> map;
//        try (connection; statement; resultSet){
//            while (resultSet.next()){
//                map = new HashMap<>();
//                String id = resultSet.getString(1);
//                String name = resultSet.getString(2);
//                map.put("id",id);
//                map.put("name",name);
//                list.add(map);
//            }
//
//        }
//        String sql1 = """
//                SELECT COUNT(*)
//                FROM customers
//                """;
//        Connection connection1 = dataSource.getConnection();
//        Statement statement1 = connection1.createStatement();
//        ResultSet resultSet1 = statement1.executeQuery(sql1);
//        try (connection1; statement1; resultSet1){
//            if(resultSet1.next()){
//            int countAll = resultSet1.getInt(1);
//            int lastPageNumber = ((countAll -1)/10)+1;
//                int prev = 0; int next = 0;
//            if(page < 6){prev = 1; next = 5;} else if (page >= 6) {
//                prev = 6; next = lastPageNumber;
//            }
//        int currentPage= page;
//
//                model.addAttribute("lastPageNumber", lastPageNumber);
//            model.addAttribute("prev", prev);
//            model.addAttribute("next", next);
//            model.addAttribute("currentPage",currentPage);
//            }
//        }
//        model.addAttribute("customerList", list);
//    }
}
