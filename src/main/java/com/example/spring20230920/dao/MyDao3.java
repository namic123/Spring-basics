package com.example.spring20230920.dao;

import com.example.spring20230920.controller.MyDto23;
import com.example.spring20230920.domain.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Mapper
public interface MyDao3 {

    @Select("""
    SELECT customerName FROM customers
    WHERE CustomerID = 1
""")
    String select1();

    @Select("""
    SELECT price FROM products
    WHERE ProductID =1
    """)
    Double select2();

    @Select("""
    SELECT lastName FROM employees
    WHERE employeeID = 1
""")
    String select3();

    @Select("""
    SELECT birthDate FROM employees
    WHERE employeeID = 2
    """)
    LocalDate select4();

    @Select("""
    SELECT DISTINCT Country FROM customers
    ORDER BY 1
    """)
    List<String> select5();

    @Select("""
    SELECT birthDate FROM employees
    ORDER BY 1
    """)
    List<LocalDate> select6();

    @Select("""
    SELECT price FROM products
    ORDER BY 1;
""")
    List<Double> select7();

    @Select("""
    SELECT CustomerID, CustomerName, Address
    FROM customers
""")
    List<Map<String, Object>> select8();

    @Select("""
    SELECT p.productName, p.Price, p.CategoryID
    FROM products p JOIN categories c ON p.CategoryID = c.CategoryID
    WHERE p.ProductID =1
""")

    Map<String, Object> select9();

    @Select("""
    SELECT employeeID, lastName, firstName
    FROM employees
    WHERE EmployeeID = 1
""")
    MyDto19 select10();

    @Select("""
            SELECT ProductName name, price, CategoryName category
            FROM products p JOIN categories c ON p.CategoryID = c.CategoryID
            WHERE ProductID = 1
            """)
    MyDto20 select11();


    @Select("""
    SELECT CustomerID id, CustomerName name, Country country
    FROM customers
    WHERE CustomerID = 2
""")
    MyDto21 select12();

    @Select("""
    SELECT ProductId id, ProductName name, price
    FROM products
    WHERE categoryID =2
    ORDER BY price
""")
    List<Map<String, Object>> select13();

    @Select("""
    SELECT orderDate,productName, Quantity, price
    FROM products p JOIN OrderDetails od ON p.productId = od.productId
    JOIN orders o ON o.OrderID = od.OrderID
    WHERE o.orderDate = '1996-07-04'
""")
    List<Map<String, Object>> select14();

    @Select("""
    SELECT productName name, Quantity, price
    FROM products p JOIN OrderDetails od ON p.productId = od.productId
    JOIN orders o ON o.OrderID = od.OrderID
    WHERE o.orderDate = '1996-07-04'
""")
    List<MyDto22> select15();

    @Select("""
    SELECT OrderDate, productName pName, categoryName cName, quantity, price
    FROM categories c JOIN products p ON c.categoryID = p.categoryID
    JOIN orderdetails od ON od.productID = p.productID 
    JOIN orders o ON od.OrderID = o.OrderID
    WHERE c.categoryID = 2
    ORDER BY orderDate AND productName
""")
    List<MyDto23> select16();

    @Select("""
        SELECT CustomerName 
        FROM customers
        WHERE CustomerID = 100
        """)
    String select17();

    @Select("""
        SELECT CustomerID
        FROM customers
        WHERE CustomerID = 100
        """)
    Integer select18();

    @Select("""
    SELECT CustomerID id, CustomerName name, Country 
    FROM w3schools.customers
    WHERE CustomerID = 1
    """)
    MyDto24 select19();

    @Select("""
    SELECT CustomerID id, CustomerName name, Country 
    FROM w3schools.customers
    WHERE CustomerID > 1
    """)
    List<MyDto24> select20();
}
