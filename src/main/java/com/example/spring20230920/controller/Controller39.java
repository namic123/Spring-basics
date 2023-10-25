package com.example.spring20230920.controller;

import com.example.spring20230920.dao.MyDao8;
import com.example.spring20230920.domain.MyDto33Employee;
import com.example.spring20230920.domain.MyDto45;
import com.example.spring20230920.service.MyService2;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("main39")
public class Controller39 {

    private final MyDao8 dao;

    private final MyService2 service;

    @GetMapping("sub0")
    public void method0() {

    }

    @GetMapping("sub1")
    @ResponseBody // ResponseEntity 이면 생략 가능
    public ResponseEntity method1() {
        // ResponseEntity
        // : 응답코드, 응답본문 작성 가능한 객체

        return ResponseEntity.status(400).build();
    }

    @GetMapping("sub2")
    @ResponseBody
    public ResponseEntity method2() {
        return ResponseEntity.badRequest().build();
//        return ResponseEntity.internalServerError().build();
    }

    @GetMapping("sub3")
    public ResponseEntity method3() {
        return ResponseEntity.internalServerError().build();
    }

    @GetMapping("sub4")
    public ResponseEntity<MyDto45> method4(Integer id) {  // MyDto45 객체의 프로퍼티를 응답 메세지로 반환
        MyDto45 data = dao.selectProductById2(id); // 리퀘스트 파라미터로 받은 id로 database 작업 처리

//        return ResponseEntity.status(200).body(data);
//        return ResponseEntity.ok().body(data);
//        return ResponseEntity.ok(data);
        if (data == null) {// 요청에서 전달된 data가 없거나 전달하지 않은 경우 404코드 발생
            return ResponseEntity.notFound().build();
        } else { // data가 전달되고 존재하는 경우, data(MyDto45의 프로퍼티)를 응답 메세지에 포함.
            return ResponseEntity.ok(data);
        }
    }

    @GetMapping("sub5")
    public ResponseEntity method5() {
        if (Math.random() > 0.5) {
            return ResponseEntity.ok().build(); // 2xx
        } else {
            return ResponseEntity.internalServerError().build(); // 5xx
        }
    }

    @PostMapping("sub6")
    public ResponseEntity method6(@RequestBody MyDto33Employee dto) {
        if (service.validate(dto)) {    // dto의 속성의 값이 모두 할당된 경우를 체크하는 조건
            int rows = service.add(dto);    // return dao.insertEmployee(dto);, dao에 dto를 할당
            if (rows == 1) {    // 정상적으로 할당된 경우 1
                return ResponseEntity.ok().build(); // 성공(200)응답 메세지를 빌드
            } else {
                return ResponseEntity.internalServerError().build(); // 500 실패 응답 메세지 빌드
            }
        } else {
            return ResponseEntity.badRequest().build(); // dto의 속성 모두가 할당되지 않으면 400번 응답 빌드
        }
    }


}
