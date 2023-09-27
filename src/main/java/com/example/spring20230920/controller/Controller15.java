package com.example.spring20230920.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("main15")
public class Controller15 {
    @GetMapping("sub1")
    public void method1() {

    }

    @GetMapping("sub2")
    public void method2(HttpServletRequest request, HttpSession session) {
        System.out.println();
        System.out.println("request.getRemoteHost() = " + request.getRemoteHost());
        System.out.println("session.getId() = " + session.getId());
        System.out.println();
    }

    @GetMapping("sub3")
    public void method3(
            @RequestParam(value = "name", defaultValue = "") String name,
            HttpSession session,
            HttpServletRequest request
    ) {
        // 리퀘스트 파라미터가 비어 있지 않다면, session attribute를 세팅
        if (!name.isBlank()) {
            session.setAttribute("username", name);
        }
        Object username = session.getAttribute("username");
        if (username != null) {
            System.out.println("request.getReote = " + request.getRemoteHost());
            System.out.println("username = " + username);
        }
    }

    @GetMapping("sub4")
    public void method4() {


    }

    @PostMapping("sub5")
    public void method5(
            String name,
            HttpSession session) {
        session.setAttribute("username", name);

    }

    @GetMapping("sub6")
    public void method6() {


    }
    @GetMapping("sub7")
    public void method7() {

    }
    @PostMapping("sub8")
    public void method8(String foods, HttpSession session) {
        session.setAttribute("foods",foods);
        System.out.println("foods = " + foods);
    }
    @PostMapping("sub9")
    public void method9(HttpSession session) {

    }
    @GetMapping("sub10")
    public void method10(Model model, HttpSession session) {
        model.addAttribute("modelAttr1", "탕후루");
        session.setAttribute("sessionAttr1", "마라탕");

        model.addAttribute("attr1", "돈까스");
        session.setAttribute("attr1", "햄버거");

        System.out.println("model = " + model.getClass());
        System.out.println("session = " + session);
    }
    @GetMapping("sub11")
    public void method11(Model model, HttpSession session) {
        model.addAttribute("items", List.of("두식", "봉석"));
        session.setAttribute("items", List.of("피자","햄버거","돈까스"));
    }

}
