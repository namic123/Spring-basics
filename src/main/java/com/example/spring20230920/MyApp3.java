package com.example.spring20230920;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class MyApp3 {
    public static void main(String[] args) {
        ApplicationContext context = SpringApplication.run(MyApp3.class, args);
        MyClass4 bean = context.getBean("mybean4", MyClass4.class);
        MyClass5 bean1 =context.getBean("myClass5", MyClass5.class);
        System.out.println("bean1 = " + bean1);
        System.out.println("bean = " + bean);

        Object bean2 = context.getBean("controller02");
        System.out.println("bean2 = " + bean2);

        Object bean3 = context.getBean("myApp3");
        System.out.println("bean3 = " + bean3);
    }
}

@Component("mybean4")   // Spring bean의 이름을 명시하지 않으면 클래스이름 -> lowerCamelCase형식의 이름으로 빈이 등록됨
class MyClass4{ // myClass5 <- 명시하지 않았을 경우, 빈에 등록될 이름

}
@Component
class MyClass5{

}

// Component
// 특별한 종류의 component @Repository @Aspect
// @Repository 안에 component가 포함
// @Controller도 API에서 보면 component를 포함하고 있음
// 즉, Controller도 context에서 자동으로 포함되고 있었던 것.
// 심지어 @SpringBootApplication에도 component를 포함하고 있으므로 스프링 컨테이너의 빈으로 등록됨
