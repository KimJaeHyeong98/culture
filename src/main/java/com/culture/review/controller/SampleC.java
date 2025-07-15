package com.culture.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.culture.review.service.SampleService;

import jakarta.servlet.http.HttpSession;

@Controller
public class SampleC {

    @Autowired
    private SampleService sampleService;

    @GetMapping("/home")
    public String cccHome(HttpSession session, Model model) {

        if (session.getAttribute("loginUser") != null) {
            return "redirect:/goodpage"; // 이미 로그인된 경우 다른 페이지로 이동
        }   

        model.addAttribute("content", "account/acountMain.jsp");
        return "sample";
    }

    // @GetMapping("/latestReview")
    // public String cccLatestReview(Model model) {
    //     model.addAttribute("content", "account/acountMain.jsp");
    //     return "latestReview";
    // }

    // @GetMapping("/gamelist")
    // public String cccgamelist(Model model) {
    // // model.addAttribute("tests", sampleService.getAllReview());
    // return "gamelist";
    // }

}
