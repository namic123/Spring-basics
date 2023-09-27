package com.example.spring20230920.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("main14")
public class Controller14 {
    @GetMapping({"sub1","sub3"})
    public void method1(){


    }
//    @RequestMapping(value = "sub2", method = RequestMethod.GET)
    @GetMapping("sub2")
    public void method2(String id, String password){
        System.out.println("Controller14.method2");
        System.out.println("id = " + id);
        System.out.println("pws = " + password);
    }
//    @RequestMapping(value = "sub2", method = RequestMethod.POST)
    @PostMapping("sub2")
    public void method3(String id, String password){
        System.out.println("Controller14.method3");
        System.out.println("id = " + id);
        System.out.println("pws = " + password);
    }
//    @RequestMapping(value = "sub4", method = RequestMethod.POST)
    @PostMapping("sub4")
    public void method4(String title, String content){
        System.out.println("title = " + title);
        System.out.println("content = " + content);
    }
    
    @GetMapping("sub5")
    public void method5(){}
    @PostMapping("sub6")
    public void method6(String username, String password){
        System.out.println("username = " + username);
        System.out.println("password = " + password);
    }
}
