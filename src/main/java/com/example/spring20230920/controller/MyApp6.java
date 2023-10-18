package com.example.spring20230920.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class MyApp6 {
    public static void main(String[] args) {
        // inversion of controll (IoC) - 제어의 역전
        // 프로그래머가 아닌 외부에 의해서 프로그램이 제어되는 것을 IoC라고함
        // 따라서, spring을 IoC컨테이너라고 부름
        ApplicationContext context = SpringApplication.run(MyApp6.class, args);
        MyClass9 myClass9 = context.getBean("myClass9", MyClass9.class);
        myClass9.method9();

        System.out.println("myClass9.getField1() = " + myClass9.getField1());
        Object myClass10 = context.getBean("myClass10");
        System.out.println("myClass10 = " + myClass10);
    }
}

@Component  // myClass9 - lowerCamelCase
class MyClass9{
    MyClass10 field1;   // dependency
    public void method9(){
        field1.method10();
    }

    public MyClass9() {
    }
    @Autowired // 의존성 주입
    public void setField1(MyClass10 field1) {
        this.field1 = field1;
    }

    public MyClass10 getField1() {
        return field1;
    }
}

@Component // myClass10
class MyClass10{
    public void method10(){
        System.out.println("MyClass10.method10");
    }
}