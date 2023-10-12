package com.example.spring20230920.controller;

import com.example.spring20230920.domain.MyDto15;
import com.example.spring20230920.domain.MyDto16;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("main19")
public class Controller19 {

    private DataSource dataSource;

    @Autowired
    public Controller19(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @GetMapping("sub1")
    public String method1(Model model)throws Exception {
        String sql = """
                SELECT CustomerName
                FROM customers
                WHERE CustomerID = 3
                """;

        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        try(connection; statement; resultSet){
            resultSet.next();
            String name = resultSet.getString(1);
            model.addAttribute("customerName",name);
        }
        return "main19/sub1.jsp";
    }

   @GetMapping("sub2")
        public void method2()throws Exception{
        String sql = """
                SELECT *
                FROM shippers
                """;

        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
       ResultSet resultSet = statement.executeQuery(sql);

       try (connection; statement; resultSet){
           boolean next1 = resultSet.next();
           resultSet.getString(1);  // "1"
           resultSet.getString(2);  // "Speepy Express"
           resultSet.getString(3);  // "(503) 555-9831"

           boolean next2 = resultSet.next();
           resultSet.getString(1);  // "2"
           resultSet.getString(2);  // "United Package"
           resultSet.getString(3);  // "(503) 555-3199"

           boolean next3 = resultSet.next();
           resultSet.getString(1);  // "3"
           resultSet.getString(2);  // "Federal Shipping"
           resultSet.getString(3);  //  "(503) 555-9931"

           boolean next4 = resultSet.next();

           System.out.println("next1 = " + next1);
           System.out.println("next2 = " + next2);
           System.out.println("next3 = " + next3);
           System.out.println("next4 = " + next4);
       }
   }

    @GetMapping("sub3")
    public void method3(Model model) throws SQLException {
        List<Map<String, String>> list = new ArrayList<>();

        String sql = """
                SELECT *
                FROM shippers
                """;

    Connection connection = dataSource.getConnection();
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery(sql);

    try (connection; statement; resultSet){
        while (resultSet.next()){
            Map<String, String> map = new HashMap<>();
            map.put("id", resultSet.getString(1));
            map.put("name", resultSet.getString(2));
            map.put("phone", resultSet.getString(3));

            list.add(map);
        }
    }
        model.addAttribute("shippers", list);
    }

    @GetMapping("sub4")
    public void method4(Model model) throws Exception{
        String sql = """
            SELECT CustomerID, CustomerName, City, Country
            FROM customers
                """;

        List<Map<String,String>> list = new ArrayList<>();

        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        try(connection;statement;resultSet){
            while(resultSet.next()){
                Map<String, String> map = new HashMap<>();
                map.put("id", resultSet.getString(1));
                map.put("name", resultSet.getString(2));
                map.put("city", resultSet.getString(3));
                map.put("country", resultSet.getString(4));
                list.add(map);
            }
        }
        model.addAttribute("customers", list);
    }

    @GetMapping("sub5")
    public void method5(Model model) throws SQLException{

        String sql = """
                SELECT ProductID, ProductName, Unit, Price
                FROM products
                """;

        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        List<Map<String, Object>> list = new ArrayList<>();

        try (connection; statement; resultSet){
            while(resultSet.next()) {
                Map<String, Object> map = new HashMap<>();
                map.put("pid", resultSet.getObject(1));
                map.put("productName", resultSet.getObject(2));
                map.put("unit", resultSet.getObject(3));
                map.put("price", resultSet.getObject(4));

                list.add(map);
            }
        }
model.addAttribute("productList",list);
    }

    @GetMapping("sub6")
    public void method6(Model model)throws SQLException{
        String sql = """
            SELECT CustomerID, CustomerName, Address, Country
            FROM customers
                """;

        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        List<MyDto15> list = new ArrayList<>();
        try (connection; statement;resultSet){
            while (resultSet.next()){
                 MyDto15 dto = new MyDto15();
                 dto.setId(resultSet.getInt(1));
                dto.setName(resultSet.getString(2));
                dto.setAddress(resultSet.getString(3));
                dto.setCountry(resultSet.getString(4));

                list.add(dto);
            }
        }
        model.addAttribute("customerList", list);
    }
    @GetMapping("sub7")
    public void method7(Model model)throws SQLException{
        String sql = """                
                SELECT ProductID, ProductName, Unit, Price
                FROM products
                """;

        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        List<MyDto16> list = new ArrayList<>();
        try (connection; statement;resultSet){
            while (resultSet.next()){
                MyDto16 dto = new MyDto16();
                dto.setId(resultSet.getInt(1));
                dto.setName(resultSet.getString(2));
                dto.setUnit(resultSet.getString(3));
                dto.setPrice(resultSet.getString(4));
                list.add(dto);
            }
        }
        model.addAttribute("customerList", list);
    }
}