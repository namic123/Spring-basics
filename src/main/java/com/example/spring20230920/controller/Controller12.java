package com.example.spring20230920.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("main12")
public class Controller12 {
    @RequestMapping("sub1")
    public void method1(){

    }
    @RequestMapping("sub2")
    public void method2() {

    }
    @RequestMapping("asub2/bsub2/csub2/dsub2/esub2")
    public void method321() {

    }
    @RequestMapping("sub3")
    public void method3() {

    }
    @RequestMapping("sub4")
    public void method4(
            @RequestParam("name") String name,
            @RequestParam("age") String age,
            Model model
    ) {
        System.out.println("Controller12.method4");
        System.out.println(name+"과 "+age+"를 저장함");

        model.addAttribute("message", name+"과 "+age+"를 저장함.");
    }
    @RequestMapping("sub5")
    public void method5() {

    }
    @RequestMapping("sub6")
    public void method6() {

    }

    }
