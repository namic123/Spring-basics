package com.example.spring20230920.controller;

import com.example.spring20230920.domain.MyDto17Supplier;
import com.example.spring20230920.domain.MyDto18Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.sql.Timestamp;
import javax.sql.DataSource;
import java.sql.*;


@Controller
@RequestMapping("main24")
public class Controller24 {
    @Autowired
    private DataSource dataSource;
@GetMapping("sub1")
    public void method1() throws SQLException {
    String sql = """
            INSERT INTO products( productname, supplierid, categoryid, unit, price)
            VALUE (?, ?, ?, ?, ?);
            """;
    Connection connection = dataSource.getConnection();
    PreparedStatement preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1,"돈까스");
    preparedStatement.setInt(2,3);
    preparedStatement.setInt(3,4);
    preparedStatement.setString(4,"한 장");
    preparedStatement.setDouble(5,500.00);

    int count = preparedStatement.executeUpdate();  // insert, update or delete (DML)
    ResultSet resultSet = preparedStatement.executeQuery();
    try(connection;preparedStatement;resultSet){
        if(count== 1){
            System.out.println("잘 등록됨!");
        }else{
            System.out.println("뭔가 잘못됨");
        }
    }
}
//    @GetMapping("sub2")
//    public void method2(
//            @RequestParam(value = "supName",defaultValue = "") String supName,
//            @RequestParam(value = "conName", defaultValue = "") String conName,
//            @RequestParam(value ="address",defaultValue = "") String address,
//            @RequestParam(value ="city",defaultValue = "") String city,
//            @RequestParam(value ="pc",defaultValue = "") String pc,
//            @RequestParam(value ="country",defaultValue = "") String country,
//            @RequestParam(value ="phone",defaultValue = "") String phone,
//            Model model
//    ) throws SQLException {
//        String sql = """
//            INSERT INTO suppliers(suppliername, contactname, address, city, postalcode, country, phone)
//            VALUE (?, ?, ?, ?, ?, ?, ?)
//            """;
//
//        String sql1 = """
//                SELECT * FROM suppliers ORDER BY supplierId DESC;
//                """;
//
//        Connection connection = dataSource.getConnection();
//        PreparedStatement preparedStatement = connection.prepareStatement(sql);
//       try(preparedStatement;){
//
//           preparedStatement.setString(1, supName);
//           preparedStatement.setString(2, conName);
//           preparedStatement.setString(3, address);
//           preparedStatement.setString(4, city);
//           preparedStatement.setString(5, pc);
//           preparedStatement.setString(6, country);
//           preparedStatement.setString(7, phone);
//           int count = preparedStatement.executeUpdate();
//       }
//        Statement statement = connection.createStatement();
//        ResultSet resultSet = statement.executeQuery(sql1);
//        List<Map<String, Object>> list = new ArrayList<>();
//        try(connection;statement){
//            while (resultSet.next()){
//                String id = resultSet.getString(1);
//                String name = resultSet.getString(2);
//                String con =resultSet.getString(3);
//                String addr= resultSet.getString(4);
//                String cit =resultSet.getString(5);
//                String pcode = resultSet.getString(6);
//                String contry = resultSet.getString(7);
//                String ph = resultSet.getString(8);
//                list.add(Map.of("id",id,
//                        "name",name,
//                        "con", con,
//                        "addr", addr,
//                        "cit", cit,
//                        "pcode", pcode,
//                        "contry", contry,
//                        "ph", ph
//                ));
//            }
//            model.addAttribute("supList",list);
//        }
//}
@PostMapping("sub2")
public void method2(MyDto17Supplier supplier) throws SQLException {
    String sql = """
                INSERT INTO suppliers
                (SupplierName, ContactName, Address, City, PostalCode, Country, Phone)
                VALUE (?, ?, ?, ?, ?, ?, ?)
                """;
    Connection connection = dataSource.getConnection();
    PreparedStatement statement = connection.prepareStatement(sql);

    try (connection; statement;) {
        statement.setString(1, supplier.getSupplierName());
        statement.setString(2, supplier.getContactName());
        statement.setString(3, supplier.getAddress());
        statement.setString(4, supplier.getCity());
        statement.setString(5, supplier.getPostalCode());
        statement.setString(6, supplier.getCountry());
        statement.setString(7, supplier.getPhone());

        int count = statement.executeUpdate();

        if (count == 1) {
            System.out.println("잘 입력됨");
        } else {
            System.out.println("뭔가 잘 못됨@@");
        }

    }

}

    @GetMapping("sub3")
    public void method3() {

    }

    @GetMapping("sub4")
    public void method4() {

    }

    @PostMapping("sub4")
    public void method5(MyDto18Employee employee) throws SQLException {
        String sql = """
                INSERT INTO employees (LastName, FirstName, BirthDate, Photo, Notes)
                VALUE (?, ?, ?, ?, ?)
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);

        try (connection; statement) {
            statement.setString(1, employee.getLastName());
            statement.setString(2, employee.getFirstName());
//            statement.setTimestamp(3, Timestamp.valueOf(employee.getBirthDate().atStartOfDay()));
            statement.setString(4, employee.getPhoto());
            statement.setString(5, employee.getNotes());

            int count = statement.executeUpdate();

            if (count == 1) {
                System.out.println("잘 입력됨!!");
            } else {
                System.out.println("뭔가 잘 못됨@@@@");
            }
        }
    }
}