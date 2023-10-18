package com.example.spring20230920.controller;

import com.example.spring20230920.dao.MyDao3;
import com.example.spring20230920.domain.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Controller //
@RequiredArgsConstructor    // 생성자 의존성 주입
@RequestMapping("main29")
public class Controller29 {
    private final MyDao3 dao3;
    @GetMapping("sub1")
    public void method1(){
        String name = dao3.select1();
        System.out.println("name = " + name);
    }

    @GetMapping("sub2")
    public void method2(){
        Double price = dao3.select2();
        System.out.println("price = " + price);
    }

    @GetMapping("sub3")
    public void method3(){
        // 1번 직원의 LastName
        String lastName = dao3.select3();
        System.out.println("lastName = " + lastName);
    }
    @GetMapping("sub4")
    public void method4(){
        // 2번 지원의 birthdae
        LocalDate birthDate = dao3.select4();
        System.out.println("birthDate = " + birthDate);
    }
    @GetMapping("sub5")
    public void method5(){
        List<String> countries = dao3.select5();
        countries.forEach(System.out::println);

    }
@GetMapping("sub6")
    public void method6(){
        //직원들의 생일 조회
    List<LocalDate> birthDate = dao3.select6();
    birthDate.forEach(System.out::println);
}
    @GetMapping("sub7")
    public void method7(){
        // 상품 가격들 조회
        List<Double> price = dao3.select7();
        price.forEach(System.out::println);
    }    
    @GetMapping("sub8")
    public void method8(){
        List<Map<String, Object>> row = dao3.select8();
        row.forEach(System.out::println);
        System.out.println("row = " + row);
    }
    @GetMapping("sub9")
    public void method9(){
        // 1번 상품명, 가격 ,카테고리명
        Map<String, Object> row1 = dao3.select9();
        row1.entrySet().forEach(System.out::println);
    }
    
    @GetMapping("sub10")    // java bean으로 controller와 dao 연결
    public void method10(){
        MyDto19 dto = dao3.select10();
        System.out.println("dto = " + dto);
    }
    @GetMapping("sub11")    // java bean으로 controller와 dao 연결
    public void method11(){
        MyDto20 dto = dao3.select11();
        System.out.println("dto = " + dto);
    }
    @GetMapping("sub12")
    public void method12(){
        MyDto21 dto = dao3.select12();
        System.out.println("dto = " + dto);
    }
    @GetMapping("sub13")
    public void method13(){
        List<Map<String, Object>> rows= dao3.select13();
        for(Map<String, Object> row: rows){
            System.out.println("row = " + row);
        }
    }
    @GetMapping("sub14")
    public void method14(){
        // 1996년 7월 4일에 주문된 상품명, 상품의수량, 상품의 가격
        // orders, orderDetails, products
        List<Map<String, Object>> rows= dao3.select14();
                for(Map<String, Object> row: rows){
            System.out.println("row = " + row);
        }
    }
    @GetMapping("sub15")
    public void method15(){
        // 1996년 7월 4일에 주문된 상품명, 상품의수량, 상품의 가격
        // orders, orderDetails, products
        List<MyDto22> rows= dao3.select15();
        for(MyDto22 row: rows){
            System.out.println("row = " + row);
        }
    }
    @GetMapping("sub16")
    public void method16(){
        // 1번 카테고리 상품들이 주문된 날짜, 상품명, 카테고리명, 수량, 가격
        // category, orderDate, products, orders
        List<MyDto23> rows= dao3.select16();
        for(MyDto23 row: rows){
            System.out.println("row = " + row);
        }
    }
    @GetMapping("sub17")
    public void method17() {
        String s = dao3.select17();
        System.out.println("s = " + s);
    }

    @GetMapping("sub18")
    public void method18() {
        Integer s = dao3.select18();
        System.out.println("s = " + s);
    }
    @GetMapping("sub19")
    public void method19(){
        MyDto24 dto = dao3.select19();
        System.out.println("dto = " + dto);
    }
    @GetMapping("sub20")
    public void method20(){
        List<MyDto24> dto = dao3.select20();
        dto.forEach(System.out::println);
    }
}
