package com.culture.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.culture.review.service.SampleService;

@Controller
public class SampleC {

    @Autowired
    private SampleService sampleService;

    @GetMapping("/home")
    public String cccHome(Model model) {
        // model.addAttribute("tests", sampleService.getAllReview());
        return "sample";
    }

    // @GetMapping("/gamelist")
    // public String cccgamelist(Model model) {
    //     // model.addAttribute("tests", sampleService.getAllReview());
    //     return "gamelist";
    // }

}
