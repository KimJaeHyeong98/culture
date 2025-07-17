package com.culture.review.latestReview;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LatestReviewC {

    @Autowired
    private LatestReviewService latestReviewService;

    // 전체 리뷰 조회
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

    // 리뷰 insert page
    @GetMapping("/add-review")
    public String reviewAdd(HttpSession session, Model model, RedirectAttributes redirectAttributes) {

        if (session.getAttribute("loginUser") != null) {
            model.addAttribute("content", "../account/good.jsp"); // 로그인한 사용자용
        } else {
            redirectAttributes.addFlashAttribute("nologin", true);
            return "redirect:/latestReview-all";
        }
        return "reviews/latestReviewadd";
    }

    @GetMapping("/searchMovie")
    @ResponseBody
    public List<SearchResultVO> searchMovie(@RequestParam("keyword") String keyword) {
            System.out.println("🎬 사용자가 검색한 영화 키워드: " + keyword);
        return latestReviewService.searchByKeyword(keyword);
    }

 @GetMapping("/searchAnime")
    @ResponseBody
    public List<SearchResultVO> searchAnime(@RequestParam("keyword") String keyword) {
            System.out.println("🎬 사용자가 검색한 영화 키워드: " + keyword);
        return latestReviewService.searchByAnime(keyword);
    }

@GetMapping("/searchGame")
    @ResponseBody
    public List<SearchResultVO> searchGame(@RequestParam("keyword") String keyword) {
            System.out.println("🎬 사용자가 검색한 영화 키워드: " + keyword);
        return latestReviewService.searchByGame(keyword);
    }

    

}
