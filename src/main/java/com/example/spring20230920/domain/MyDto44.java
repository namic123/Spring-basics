package com.example.spring20230920.domain;

import lombok.Data;

import java.util.Map;
import java.util.List;

@Data
public class MyDto44 {
    private String name;
    private List<String> email;
    private Map<String, Object> home;
    private Double price;
    private Double weight;
    private boolean married;

}
