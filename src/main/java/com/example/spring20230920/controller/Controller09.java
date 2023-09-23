package com.example.spring20230920.controller;

import com.example.spring20230920.domain.MyDto7;
import com.example.spring20230920.domain.MyDto8;
import com.example.spring20230920.domain.MyDto9;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;
import java.util.Scanner;

@Controller
@RequestMapping("main9")
public class Controller09 {

    @RequestMapping("sub1")
    public void method1(Model model){
        model.addAttribute("attr1","jay");
        model.addAttribute("attr2",300);
        model.addAttribute("attr3",true);
        model.addAttribute("attr4",3.14);

        // 모델속성이 배열일 경우
        model.addAttribute("attr5", new String[]{"lee","kim"});
        String[] myArr1 = {"korea","seoul","jeju"};
        model.addAttribute("yourArr6",myArr1);
    }

    @RequestMapping("sub2")
    public void method2(Model model){
        model.addAttribute("myName",new String[]{"park","jay"});
        model.addAttribute("yourEmail", List.of("namic123@naver.com","namic123@naver.com","namic@naver.com"));
        model.addAttribute("herAddress",List.of("서울","인천"));
    }

    @RequestMapping("sub3")
    public void method3(Model model){
        model.addAttribute("names",List.of("두식","봉석","희수"));
        model.addAttribute("list1",List.of("a","b"));
        model.addAttribute("MapList1",List.of("a",1,"b",2,"c",3));
        model.addAttribute("cities",new String[]{"인천"});
    }

    @RequestMapping("sub4")
    public void method4(Model model){
        model.addAttribute("myMap",Map.of("son",7,"lee",19,"park",28));
        model.addAttribute("cityMap",Map.of("seoul","서울","busan","부산"));
        model.addAttribute("color",Map.of("black","검정","red","빨강","blue","파랑"));
        var map3 = Map.of(
                "name","두식",
                    "my name", "봉석",
                "your-name","희수"
        );
        model.addAttribute("attr3", map3);
    }

    @RequestMapping("sub5")
    public void method5(Model model){
        var map1 = Map.of("phone1","iphone","phone2","galaxy");
        var map2 = Map.of("korea","seoul","us","ny");
        var map3 = Map.of("1st","hamburger","2nd","pizza");

        model.addAttribute("phones",map1);
        model.addAttribute("caps",map2);
        model.addAttribute("foods",map3);
    }

    @RequestMapping("sub6")
    public void method6(Model model){
    model.addAttribute("attr1", new Object());
    model.addAttribute("attr2", new Scanner(System.in));
    model.addAttribute("attr3", new MyDto7());
    }

    @RequestMapping("sub7")
    public void method7(Model model){
        MyDto8 o1 = new MyDto8();
        o1.setFood("pizza");
        o1.setComputer("intel");
        o1.setBirthDate("2020-01-01");

        model.addAttribute("person1", o1);
    }
    @RequestMapping("sub8")
    public void method8(Model model){
        MyDto9 o1 = new MyDto9();
        o1.setId("namic123");
        o1.setFirstName("park");
        o1.setLastName("jaysung");
        o1.setClassName("MyDto9");
        o1.setPhoneNumber("01083246149");
        model.addAttribute("student",o1);
    }
}
