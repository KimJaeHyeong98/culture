package com.culture.review.latestReview;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.culture.review.Account.AccountVO;

import jakarta.servlet.http.HttpSession;

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
        System.out.println(" 사용자가 검색한 영화 키워드: " + keyword);
        return latestReviewService.searchByKeyword(keyword);
    }

    @GetMapping("/searchAnime")
    @ResponseBody
    public List<SearchResultVO> searchAnime(@RequestParam("keyword") String keyword) {
        System.out.println(" 사용자가 검색한 애니매이션 키워드: " + keyword);
        return latestReviewService.searchByAnime(keyword);
    }

    @GetMapping("/searchGame")
    @ResponseBody
    public List<SearchResultVO> searchGame(@RequestParam("keyword") String keyword) {
        System.out.println(" 사용자가 검색한 게임 키워드: " + keyword);
        return latestReviewService.searchByGame(keyword);
    }

    @PostMapping("/submitReview")
    public ResponseEntity<Map<String, Object>> submitReview(@RequestBody NewReviewVO newReviewVO, HttpSession session,
            AccountVO accountVO) {
        Map<String, Object> result = new HashMap<>();

        // 세션에서 로그인 사용자 ID 가져오기
        AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            result.put("success", false);
            result.put("message", "로그인이 필요합니다.");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(result);
        }
        Integer userPk = loginUser.getU_user_pk();
        newReviewVO.setUserPk(userPk);

        try {
            latestReviewService.submitReviewAndRating(newReviewVO);
            result.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("message", e.getMessage());
        }

        return ResponseEntity.ok(result);
    }


}
