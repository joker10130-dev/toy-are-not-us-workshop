package com.groupfour.productapi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
public class ProductController {

    @GetMapping("/api/v1/products")
    public ProductResponse getProductsByAgeAndGender(@RequestParam Optional<String> age, @RequestParam Optional<String> gender) {

        return new ProductResponse(1, "name", gender.orElse("default_gender"), age.orElse("default_age"), 500, true, "group4");
    }
}
