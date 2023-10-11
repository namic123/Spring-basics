package com.example.spring20230920.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.sql.DataSource;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Controller
@RequestMapping("main26")
public class Controller26 {
    @Autowired
    DataSource dataSource;

    @GetMapping("sub1")
    public void method1() throws SQLException {
        String sql = """
                INSERT INTO mydb1.my_table12
                (int_col, dec_col, str_col, date_col, date_time_col)
                VALUE(?, ?, ?, ?, ?)
                """;
        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        try (connection; preparedStatement){
            preparedStatement.setInt(1, 298432);
            preparedStatement.setDouble(2, 3.14);
            preparedStatement.setString(3, "블라블라");
            preparedStatement.setTimestamp(4, Timestamp.valueOf(LocalDate.now().atStartOfDay()));
            preparedStatement.setTimestamp(5,Timestamp.valueOf(LocalDateTime.now()));

            preparedStatement.executeUpdate();
        }

    }
    @GetMapping("sub2")
    public void method2() throws SQLException {
        String sql = """
                SELECT * FROM mydb1.my_table12
                LIMIT 1;
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        try(connection; preparedStatement){
            if(resultSet.next()){
                int intCol = resultSet.getInt("int_col");
                double decCol = resultSet.getDouble("dec_col");
                String strCol = resultSet.getString("str_col");
                LocalDate dateCol = resultSet.getTimestamp("date_col").toLocalDateTime().toLocalDate();
                LocalDateTime dateTimeCol = resultSet.getTimestamp("date_col").toLocalDateTime().toLocalDate().atStartOfDay();

                System.out.println("intCol = " + intCol);
                System.out.println("decCol = " + decCol);
                System.out.println("strCol = " + strCol);
                System.out.println("dateCol = " + dateCol);
                System.out.println("dateTimeCol = " + dateTimeCol);
            }
        }
    }
}
