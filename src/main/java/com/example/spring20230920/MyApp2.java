package com.example.spring20230920;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class MyApp2 {
    public static void main(String[] args) {
    ApplicationContext context = SpringApplication.run(MyApp2.class, args);// 이 메서드가 반환해주는 객체가 application context

        Object bean1 = context.getBean("myInstance2");
        System.out.println(bean1 instanceof  MyClass2);
        MyClass2 o1 = (MyClass2) bean1;
        o1.method2();


        Object bean3 = context.getBean("myBean3");
        System.out.println(bean3 instanceof MyClass3);
        MyClass3 o3 = (MyClass3) bean3;

        System.out.println(System.identityHashCode(context.getBean("myBean3")));
        System.out.println(System.identityHashCode(context.getBean("myBean3")));
        System.out.println(System.identityHashCode(context.getBean("myBean3")));

        System.out.println(System.identityHashCode(context.getBean("myInstance2")));
        System.out.println(System.identityHashCode(context.getBean("myInstance2")));
        System.out.println(System.identityHashCode(context.getBean("myInstance2")));

        MyClass2 bean22 = context.getBean("myInstance2", MyClass2.class);// 자동으로 형변환해줌
        MyClass3 bean33 = context.getBean("myBean3", MyClass3.class);// 자동으로 형변환해줌

        System.out.println(System.identityHashCode(bean22));
        System.out.println(System.identityHashCode(bean33));
    }
}
// @SpringBootApplication은 패키지와 하위 패키지를 탐색하여 Component가 있는 클래스의 인스턴스를 자동으로 만들어줌
@Component("myInstance2")   // 스프링 빈으로 등록해주는 에너테이션, 빈에 이름을 부여할 수 있음
class MyClass2{
    public void method2(){
        System.out.println("MyClass2.method2");
    }
}
@Component("myBean3")
class MyClass3{}
