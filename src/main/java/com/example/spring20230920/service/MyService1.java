package com.example.spring20230920.service;

import com.example.spring20230920.dao.MyDao6;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class MyService1 {
    private final MyDao6 dao;
    // 다른 빈에서 컨트롤 해야함. 프록시를 거쳐야 트랜잭션이 관리되기 때문에.
    @Transactional(rollbackFor = Exception.class)  // 롤백해줌
    public void tx1(){
        dao.update1();
        // 중간에 exception이 났다면?
//        int c= 1/0;     // runtimeException , roll back.
        // exception이 발생하지 않으면, COMMIT됨.
        dao.update2();

    }
}
