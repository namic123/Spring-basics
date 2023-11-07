package com.example.spring20230920.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MyDao10 {
@Select("""
    SELECT CustomerName FROM w3schools.customers
    WHERE CustomerID =5;
""")
    String customerName5();

}
