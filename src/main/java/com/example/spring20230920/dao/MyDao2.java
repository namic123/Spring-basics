package com.example.spring20230920.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper //
public interface MyDao2 {
    @Select("""
    SELECT LastName From employees
    WHERE EmployeeID = #{id}    -- 마이 바티스가 물음표로 만들어줌
    """)
    String select(Integer id);
}
