package com.example.spring20230920.dao;

import com.example.spring20230920.domain.MyDto33Employee;
import com.example.spring20230920.domain.MyDto34Customer;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MyDao10 {
@Select("""
    SELECT CustomerName FROM w3schools.customers
    WHERE CustomerID =5;
""")
    String customerName5();

    @Select("""
                SELECT CustomerID id,
                    CustomerName name,
                    ContactName,
                    Address,
                    city,
                     PostalCode,
                     Country
                FROM w3schools.customers
                WHERE CustomerID =5;
            """)
    MyDto34Customer getCustomer();

    @Select("""
                SELECT CustomerID id,
                    CustomerName name,
                    ContactName,
                    Address,
                    city,
                     PostalCode,
                     Country
                FROM w3schools.customers
                WHERE CustomerID = #{id};
            """)
    MyDto34Customer getCustomerById(Integer id);
    @Select("""
    SELECT lastName, firstName, BirthDate
    FROM w3schools.employees
    WHERE EmployeeID = #{id}
""")
    MyDto33Employee getEmployee(Integer id);
}