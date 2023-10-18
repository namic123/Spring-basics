package com.example.spring20230920.controller;

import lombok.Data;

import java.time.LocalDate;

@Data
public class MyDto23 {
    private LocalDate orderDate;
    private String pName;
    private String cName;
    private Integer quantity;
    private Double price;
}
