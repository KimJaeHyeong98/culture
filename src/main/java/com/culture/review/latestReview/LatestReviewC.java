package com.culture.review.latestReview;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class LatestReviewC {

    @Autowired
    private LatestReviewService latestReviewService;

    @GetMapping("/latestReview-all")
    public String reviewAll(HttpSession session, Model model) {

        model.addAttribute("reviews", latestReviewService.getAllReview());

        if (session.getAttribute("loginUser") != null) {
            model.addAttribute("content", "account/good.jsp"); // 로그인한 사용자용
        } else {
            model.addAttribute("content", "account/acountMain.jsp"); // 비로그인 사용자용
        }

        return "latestReview";
    }
}
