package com.example.spring20230920.dao;

import com.example.spring20230920.domain.MyDto33Employee;
import com.example.spring20230920.domain.MyDto45;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.Map;

@Mapper
public interface MyDao8 {

    @Select("""
    SELECT *
    FROM w3schools.products
    WHERE ProductID = #{id}
""")
    Map<String, Object> selectProductById(Integer id);

    @Select("""
    SELECT EmployeeID id, 
            FirstName,
            LastName,
            BirthDate,
            photo,
            Notes
    FROM w3schools.employees
    WHERE EmployeeID = #{id}
""")
    MyDto33Employee selectByEmployeeId(Integer id);

    @Select("""
    SELECT ProductID id, Price, CategoryName category, unit
    FROM w3schools.products p JOIN w3schools.categories c
    ON p.CategoryID = c.CategoryID
    WHERE ProductID = #{id}
""")
    MyDto45 selectProductById2(Integer id);
}
