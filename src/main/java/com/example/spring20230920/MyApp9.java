package com.example.spring20230920;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class MyApp9 {
    public static void main(String[] args) {
        ApplicationContext context = SpringApplication.run(MyApp9.class, args);
        MyClass15 myClass15 = context.getBean("myClass15", MyClass15.class);
        MyClass16 myClass16 = context.getBean("myClass16", MyClass16.class);
        System.out.println("myClass15 = " + myClass15);
        System.out.println("myClass16 = " + myClass16);
    }
}

@Component
class MyClass16{

}
@Component
@RequiredArgsConstructor    // final 필드를 아규먼트로 받는 생성자를 만들어주는 lombok 어노테이션
class MyClass15{
    private final MyClass16 field;

    public MyClass16 getField() {
        return field;
    }
}