package com.example.spring20230920.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("main25")
public class Controller25 {
    @Autowired
    DataSource dataSource;

    @GetMapping("sub1")
    public void method1(@RequestParam(value = "id", required = false) Integer customerId) throws SQLException {
        if (customerId == null) {
            System.out.println("삭제할 id를 넣어주세요");
            return;
        }
        String sql = """
                DELETE FROM customers
                WHERE customerId = ?
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        try (connection; preparedStatement) {
            preparedStatement.setInt(1, customerId);
            int rows = preparedStatement.executeUpdate();

            if (rows == 1) {
                System.out.println(rows + "개 레코드 잘 지워짐");
            } else {
                System.out.println("지워지지 않음");
            }

        }
    }

    @GetMapping("sub2")
    public void method2()  {

    }
    @PostMapping("sub2")
    public void method3(@RequestParam(value = "pid", required = false) Integer id) throws SQLException {
        if(id == null){
            System.out.println("삭제할 번호를 입력하세요");
            return;
        }
        String sql = """
                DELETE FROM products
                WHERE productId = ?
                """;
        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);
        try(connection;preparedStatement){
            int executeDel = preparedStatement.executeUpdate();
            if(executeDel >= 1){
                System.out.println("잘 지워짐");
            }else{
                System.out.println("안 지워짐.");
            }
        }

    }
    @GetMapping("sub4")
    public void method4() throws SQLException {
        String sql = """
                UPDATE shippers
                SET shipperName = ?,
                    phone = ?
                WHERE shipperId = ?
                """;
        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        try (preparedStatement; connection){
            preparedStatement.setString(1, "이강인");
            preparedStatement.setString(2, "01011112222");
            preparedStatement.setInt(3, 1);
            int excuteUpdate = preparedStatement.executeUpdate();

            if(excuteUpdate == 1){
                System.out.println("업데이트됨!");
            }else {
                System.out.println("업데이트 실패");
            }
        }
    }

    @GetMapping("sub5")
    public void method5(@RequestParam("id") Integer shipperId, Model model) throws SQLException {
        String sql = """
                SELECT * FROM shippers
                WHERE shipperId = ?
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);

        try (connection; statement) {
            statement.setInt(1, shipperId);

            ResultSet resultSet = statement.executeQuery();

            try (resultSet) {
                if (resultSet.next()) {
                    model.addAttribute("shipper", Map.of("shipperId", resultSet.getInt("shipperId"),
                            "shipperName", resultSet.getString("shipperName"),
                            "phone", resultSet.getString("phone")));
                }

            }

        }

    }

    @PostMapping("sub5")
    public String method6(
            @RequestParam("id") Integer shipperId,
            @RequestParam("name") String shipperName,
            @RequestParam("phone") String phone,
            RedirectAttributes rttr
    ) throws SQLException {
        String sql = """
                UPDATE shippers
                SET shipperName = ?,
                    phone = ?
                WHERE
                    shipperId = ?
                """;
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        try (connection; statement) {
            statement.setString(1, shipperName);
            statement.setString(2, phone);
            statement.setInt(3, shipperId);

            int rows = statement.executeUpdate();

            if (rows == 1) {
                System.out.println("잘 변경됨");
            } else {
                System.out.println("문제 생김");
            }

        }

        rttr.addAttribute("id", shipperId);
        return "redirect:/main25/sub5";
    }
    @GetMapping("sub7")
    public void method7(@RequestParam(value = "id", required = false) Integer employeeId, Model model) throws SQLException {
        if (employeeId == null) {
            return;
        }
        String sql = """
                SELECT * FROM employees
                WHERE employeeId = ?
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);

        try (connection; statement) {
            statement.setInt(1, employeeId);

            ResultSet resultSet = statement.executeQuery();

            try (resultSet) {
                if (resultSet.next()) {
                    String lastName = resultSet.getString("lastName");
                    String firstName = resultSet.getString("firstName");
                    LocalDate birthDate = resultSet.getTimestamp("birthDate").toLocalDateTime().toLocalDate();
                    String photo = resultSet.getString("photo");
                    String notes = resultSet.getString("notes");

                    model.addAttribute("employee", Map.of("lastName", lastName,
                            "firstName", firstName,
                            "birthDate", birthDate,
                            "photo", photo,
                            "notes", notes,
                            "employeeId", employeeId));

                }
            }
        }

    }
    @PostMapping("sub7")
    public String method8(
            @RequestParam("id") Integer employeeId,
            @RequestParam("lastName") String lastName,
            @RequestParam("firstName") String firstName,
            @RequestParam("birthDate") LocalDate birthDate,
            @RequestParam("photo") String photo,
            @RequestParam("notes") String notes,
            RedirectAttributes rttr
    ) throws SQLException {
        String sql = """
                UPDATE employees
                SET lastName = ?,
                 firstName = ?,
                 birthDate = ?,
                 photo = ?,
                 notes = ?
                WHERE employeeId = ?
                """;
        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        try(connection;preparedStatement){
            preparedStatement.setString(1,lastName);
            preparedStatement.setString(2,firstName);
            preparedStatement.setString(3, String.valueOf(birthDate));
            preparedStatement.setString(4,photo);
            preparedStatement.setString(5,notes);
            preparedStatement.setInt(6, employeeId);
            int count = preparedStatement.executeUpdate();

            if(count >= 1){
                System.out.println("데이터 잘들어감");
            }else {
                System.out.println("뭔가 잘못됨.");

            }
        }
        rttr.addAttribute("id", employeeId);
        return "redirect:/main25/sub7";
    }
    @GetMapping("sub9")
    public String method9(RedirectAttributes rttr){
        // Controller의 request handler 메소드의 리턴이
        // void(또는 null 리턴)이면 view의 이름으로 해석

        //String이면 view의 이름으로 해석
        // 'redirect:' 접두어가 붙으면
        // 응답코드가 302이고 location 응답헤더의 값이 접두어 이후의 값으로 세팅

        // 쿼리 스트링에 request parameter로 붙음
        rttr.addAttribute("abc", "def");
        rttr.addAttribute("address", "incheon");

        // 모델에 붙임(session에 임시적으로 거침)
        rttr.addFlashAttribute("email","namic123@naver.com");
        return "redirect:/main25/sub10";
    }

    @GetMapping("sub10")
    public void method10(Model model) {
        Object email = model.getAttribute("email");
        System.out.println("email = " + email);
    }
}
