package com.example.spring20230920.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("main33")
public class Controller33 {
    @GetMapping("sub1")
    public void method1() {

    }

    @PostMapping("sub2")
    public void method2(String name, Integer age, MultipartFile myfile) throws IOException {
        System.out.println("name = " + name);
        System.out.println("age = " + age);

        if (myfile != null) {
            String fileName = myfile.getOriginalFilename();
            System.out.println("fileName = " + fileName);

            String path = "C:\\Temp\\upload_" + fileName;
            InputStream inputStream = myfile.getInputStream();
            FileOutputStream outputStream = new FileOutputStream(path);

            BufferedInputStream bis = new BufferedInputStream(inputStream);
            BufferedOutputStream bos = new BufferedOutputStream(outputStream);

            try (bis; bos; inputStream; outputStream) {
                byte[] data = new byte[1024];
                int len = 0;

                while ((len = bis.read(data)) != -1) {
                    bos.write(data, 0, len);
                }
                bos.flush();
            }
        }
    }

    @GetMapping("sub3")
    public void method3() {
    }

    @PostMapping("sub4")
    public void method4(MultipartFile upload) throws IOException {
        // 업로드한 파일을 C:\\Temp\\ 폴더내에 저장하기
        if (upload != null) {
            String uploadName = upload.getOriginalFilename();
            String path = "C:\\Temp\\" + uploadName;
            InputStream inputStream = upload.getInputStream();
            FileOutputStream outputStream = new FileOutputStream(path);

            BufferedInputStream bis = new BufferedInputStream(inputStream);
            BufferedOutputStream bos = new BufferedOutputStream(outputStream);
            try (bis; bos; inputStream; outputStream) {
                byte[] data = new byte[1024];
                int len = 0;

                while ((len = bis.read(data)) != -1) {

                    bos.write(data, 0, len);
                }
                bos.flush();
            }
        }
    }

    @GetMapping("sub5")
    public void method5() {

    }

    @PostMapping("sub6")
    public void method6(MultipartFile[] files) throws IOException { // 여러 개의 파일을 받으려면 배열로 받는다.
        System.out.println("files = " + files.length);  // 선택 안해도 1임, 따라서 아래처럼 파일의 바이트 크기를 보고 파일이 첨부됐는지 여부 확인
        System.out.println("업로드 파일 크기들.");
        for (MultipartFile file : files) {
            System.out.println("file.getSize() = " + file.getSize());       // 파일의 바이트 크기
            if (file.getSize() > 0) {
                String path = "C:\\Temp\\";
                BufferedInputStream bis = new BufferedInputStream(file.getInputStream());
                BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(path + file.getOriginalFilename()));

                try (bos; bis) {

                    int len = 0;
                    byte[] data = new byte[2048];

                    while ((len = bis.read(data)) != -1) {
                        bos.write(data, 0, len);
                    }
                    bos.flush();
                }
            }
        }
    }

    @GetMapping("sub7")
    public void method7() {
    }

    @PostMapping("sub8")
    public void method8(@RequestParam("files") MultipartFile[] files) throws IOException {
        System.out.println("files.length = " + files.length);
        for (MultipartFile file : files) {
            if (file.getSize() > 0) { // 파일을 올렸을 경우에만 실행
                String path = "C:\\Temp\\upload";
                File mkFile = new File(path);
                if (!mkFile.exists()) {
                    mkFile.mkdirs();
                }
                BufferedInputStream bis = new BufferedInputStream(file.getInputStream());
                BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(path +"\\"+file.getOriginalFilename()));
                try (bis; bos) {
                    int len = 0;
                    byte[] data = new byte[2048];
                    while ((len = bis.read(data)) != -1) {
                        bos.write(data, 0, len);
                    }
                    bos.flush();
                }
            }
        }
    }
}


