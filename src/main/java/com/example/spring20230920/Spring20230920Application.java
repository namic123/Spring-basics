package com.example.spring20230920;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
public class Spring20230920Application {
    // 프로그램이 시작하는 쿨래스
    public static void main(String[] args) {
        SpringApplication.run(Spring20230920Application.class, args);   // 프로그램을 실행시키는 메서드
    }

}
