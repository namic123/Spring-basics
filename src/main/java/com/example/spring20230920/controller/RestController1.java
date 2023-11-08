package com.example.spring20230920.controller;

import com.example.spring20230920.dao.MyDao10;
import com.example.spring20230920.dao.MyDao9;
import com.example.spring20230920.domain.MyDto33Employee;
import com.example.spring20230920.domain.MyDto34Customer;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
@RequestMapping("api/main1")
public class RestController1 {
    private final MyDao10 dao;
    @GetMapping("sub1")
    @ResponseBody
    public String method1(){

        return "customer name!!";
    }

    // http://localhost:8080/api/main1/sub2
    // get 요청시
    // 5번 고객의 customerName 응답
    @GetMapping("sub2")
    @ResponseBody
    public String method2(){
       String name = dao.customerName5();
        return name;
    }
    @GetMapping("sub3")
    @ResponseBody
        public MyDto34Customer method3(){
        return dao.getCustomer();
    }
    @GetMapping("sub4")
    @ResponseBody
    public ResponseEntity<MyDto34Customer> method4(MyDto34Customer dto){
        MyDto34Customer customer= dao.getCustomerById(dto.getId());
        if(customer == null) return ResponseEntity.notFound().build();
        return ResponseEntity.ok(customer);
    }
    @GetMapping("sub5")
    @ResponseBody
    public ResponseEntity<MyDto33Employee> method5(MyDto33Employee dto){
        MyDto33Employee employee = dao.getEmployee(dto.getId());
        if(employee == null) return ResponseEntity.notFound().build();
        return ResponseEntity.ok(employee);
    }

}
