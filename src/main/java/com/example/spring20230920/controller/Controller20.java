package com.example.spring20230920.controller;

import com.example.spring20230920.domain.MyDto15;
import com.example.spring20230920.domain.MyDtoPrac;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("main20")
public class Controller20 {
    @Autowired
    private DataSource dataSource;

    @GetMapping("sub1")
    public void method1() {
    }

    @GetMapping("sub2")
    public String method2(String id, Model model) throws SQLException {
        String sql = """
                SELECT CustomerID, CustomerName, Address, Country
                FROM customers
                WHERE CustomerID = ?
                    """;
        sql += id;
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, id);
        ResultSet resultSet = statement.executeQuery(sql);

        List<MyDto15> list = new ArrayList<>();
        try (connection; statement; resultSet) {
            while (resultSet.next()) {
                MyDto15 dto = new MyDto15();
                dto.setId(resultSet.getInt(1));
                dto.setName(resultSet.getString(2));
                dto.setAddress(resultSet.getString(3));
                dto.setCountry(resultSet.getString(4));
                list.add(dto);
            }
            model.addAttribute("customerList", list);
        }

        return "/main19/sub6";
    }

    @GetMapping("sub3")
    public void method3() throws SQLException {
        String sql = """
                SELECT customerId, customerName, country
                FROM customers
                WHERE customerId = ?
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        // excute 하기 전에 '?'에 들어갈 값을 할당해주어야 한다.
        preparedStatement.setString(1, "3");  // SQL의 물음표를 채우는 메서드, 첫 번째 파라미터에는 쿼리 인덱스, 두 번째 파라미터에는 할당할 값.
//        statement.setInt(1, 3);
        ResultSet resultSet = preparedStatement.executeQuery();

        try (connection; preparedStatement; resultSet) {
            while (resultSet.next()) {
                System.out.println();
                System.out.println("고객 정보");
                System.out.println("id = " + resultSet.getString(1));
                System.out.println("name = " + resultSet.getString(2));
            }
        }
    }

    // /main20/sub4?pid=5
    @GetMapping("sub4")
    public void method4(String pid) throws SQLException {
        String sql = """
                SELECT productId, productName
                FROM products
                WHERE productId = ?
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, pid);
        ResultSet resultSet = preparedStatement.executeQuery();

        try (connection; preparedStatement; resultSet){
            while(resultSet.next()){
                System.out.println();
                System.out.println("상품 정보");
                System.out.println("상품번호 = "+ resultSet.getInt(1));
                System.out.println("상품번호 = "+ resultSet.getString(2));
            }
        }

        // /main20/sub5?country=spain
    }    @GetMapping("sub5")
    public void method5(String country) throws SQLException {
        String sql = """
                SELECT CustomerName, Country
                FROM customers
                WHERE country = ?
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1,country);
        ResultSet resultSet = statement.executeQuery();
try (connection;statement;resultSet){

    while (resultSet.next()){
        System.out.println();
        System.out.println("고객 정보");
        System.out.println("고객 이름: "+ resultSet.getString(1));
        System.out.println("나라: "+resultSet.getString(2));

    }
}
    }
    @GetMapping("sub6")
    public void method6(String c1, String c2) throws SQLException {
        String sql = """
                SELECT CustomerName, country
                FROM customers
                WHERE country = ? OR country = ?
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, c1);
    preparedStatement.setString(2, c2);
        ResultSet resultSet = preparedStatement.executeQuery();

        try (connection; preparedStatement; resultSet){
            while (resultSet.next()){
                System.out.println();
                System.out.println("고객명: "+ resultSet.getString(1));
                System.out.println("국적: "+ resultSet.getString(2));
            }
        }
    }
    @GetMapping("sub7")
    public void method7(){}
    @GetMapping(value = "sub8")
    public void method8(Integer min,  Integer max) throws SQLException {
        String sql = """
                SELECT ProductName, Price
                FROM products
                WHERE Price >= ? AND Price <= ?
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, min);
        preparedStatement.setInt(2, max);
        ResultSet resultSet = preparedStatement.executeQuery();

        try (connection; preparedStatement; resultSet){
            while (resultSet.next()){
                System.out.println();
                System.out.println("상품명: "+ resultSet.getString(1));
                System.out.println("가격: "+ resultSet.getInt(2));
            }
        }
    }
    @GetMapping( "sub9")
    public void method9(@RequestParam("country") List<String> countryList) throws SQLException {
        String questionMarks = "";
        for (int i = 0; i < countryList.size(); i++) {
            questionMarks += "?";
            if(i < countryList.size()-1){
                questionMarks +=", ";
            }
        }
        String sql = """
                SELECT *
                FROM customers
                WHERE Country IN("""
                +
                questionMarks
                +
                ")";

        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        for (int i = 0; i < countryList.size(); i++) {
            statement.setString(i+1, countryList.get(i));
        }
        ResultSet resultSet = statement.executeQuery();
        try(connection; statement;resultSet){
            while (resultSet.next()){
                String name = resultSet.getString(2);
                String country = resultSet.getString(7);
                System.out.println(name + " : " + country);
            }
        }
    }

    @GetMapping("sub10")
    public void method10(Model model)throws SQLException{
        String sql = """
                SELECT DISTINCT country
                FROM suppliers
                """;
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        List<String> list = new ArrayList<>();
        try(connection;statement;resultSet){
            while (resultSet.next()){
                list.add(resultSet.getString(1));
            }
        }
        model.addAttribute("countryList", list);
    }
    @GetMapping("sub11")
    public void method11(Model model, @RequestParam("country") List<String> countryList)throws Exception {
        String questionMarks = "";
        for (int i = 0; i < countryList.size(); i++) {
            questionMarks += "?";
            if (i < countryList.size() - 1) {
                questionMarks += ", ";
            }
        }
        String sql = """
                SELECT Country, SupplierID, SupplierName, Phone
                FROM suppliers
                WHERE Country IN("""
                +
                questionMarks
                +
                """

                        )
                        """;


        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        for (int i = 0; i < countryList.size(); i++) {
            statement.setString(i+1, countryList.get(i));
        }
        ResultSet resultSet = statement.executeQuery();

        List<MyDtoPrac> list = new ArrayList<>();
        try (connection; statement; resultSet) {
            while (resultSet.next()) {
                MyDtoPrac dtoPrac = new MyDtoPrac();
                dtoPrac.setCountry(resultSet.getString(1));
                dtoPrac.setId(resultSet.getString(2));
                dtoPrac.setName(resultSet.getString(3));
                dtoPrac.setPhone(resultSet.getString(4));
                list.add(dtoPrac);
            }
        }
        model.addAttribute("suppliers", list);
    }

}
