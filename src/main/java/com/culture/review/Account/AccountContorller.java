package com.culture.review.Account;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class AccountContorller {

    @Autowired
    private AccountService accountService;

    @GetMapping("login")
    public String acountLogin(Model model) {
        model.addAttribute("content", "account/login.jsp");
        return "sample";
    }

    @GetMapping("account")
    public String acount(Model model) {
        model.addAttribute("content", "account/acount.jsp");
        return "sample";
    }

    @PostMapping("/logindo")
    public String loginDo(AccountVO acountVO, HttpSession session, Model model) {
        String loginpage = accountService.loginDo(acountVO, session, model);

        if ("Account/good.jsp".equals(loginpage)) {
            // 로그인 성공 시 리다이렉트
            return "redirect:/goodpage";
        } else {
            // 로그인 실패 시 로그인 페이지로
            model.addAttribute("content", loginpage);
            return "sample";
        }
    }

    @GetMapping("/goodpage")
    public String goodPage(HttpServletResponse response, HttpSession session, Model model) {
        if (!accountService.isLoggedIn(session)) {
            return "redirect:/login";
        }

        // 캐시 무효화 헤더 설정
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        model.addAttribute("loginUser", session.getAttribute("loginUser"));
        model.addAttribute("content", "account/good.jsp");
        return "sample";
    }

    // 로그아웃
    @GetMapping("/logoutdo")
    public String logout(HttpServletRequest request, HttpServletResponse response, Model model) {
        HttpSession session = request.getSession(false); // 세션이 없으면 null 반환
        if (session != null) {
            session.invalidate(); // 세션 완전 삭제
        }

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        System.out.println("logout complete");

        System.out.println("logout complete");
        model.addAttribute("content", "account/login.jsp");
        return "sample";
    }

    // 회원가입
    @PostMapping("/joinMembership")
    public String joinMembership(AccountVO acountVO, Model model) {
        System.out.println("joinMembership -----");
        System.out.println(acountVO);
        accountService.addMembership(acountVO, model);
        model.addAttribute("content", "account/acountMain.jsp");
        return "sample";
    }

    // 아이디 중복 체크
    @PostMapping("account/checkUserId")
    public ResponseEntity<String> checkUserId(@RequestParam("u_user_id") String u_user_id) {
        System.out.println("입력받은 아이디: " + u_user_id);
        boolean isAvailable = accountService.isUserIdAvailable(u_user_id);
        System.out.println("사용 가능 여부: " + isAvailable);
        return ResponseEntity.ok(isAvailable ? "AVAILABLE" : "DUPLICATE");
    }

    // 마이페이지 컨트롤러
    @PostMapping("/myPageInfo")
    public String showMyPage(HttpSession session, Model model) {
        AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }

        int pk = loginUser.getU_user_pk();
        AccountVO account = accountService.getAccountByPk(pk);
        System.out.println(account);
        model.addAttribute("userInfo", account);
        model.addAttribute("content", "good.jsp");
        return "account/accountInfo";
    }

    // 비동기 회원정보 수정
    @PostMapping("/updateAccount")
    @ResponseBody
    public String updateAccount(@RequestBody AccountVO accountVO, HttpSession session, Model model) {
        AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");

        if (loginUser == null) {
            model.addAttribute("content", "account/acountMain.jsp");
            return "sample";
        }

        accountVO.setU_user_pk(loginUser.getU_user_pk()); // 세션에서 pk 설정
        int updatedCount = accountService.updateAccount(accountVO); // Service 호출

        if (updatedCount > 0) {
            // 세션도 최신 상태로 갱신
            AccountVO refreshed = accountService.getAccountByPk(loginUser.getU_user_pk());
            session.setAttribute("loginUser", refreshed);
            return "success";
        } else {
            return "fail";
        }
    }

    // 비동기 회원 정보 삭제
    @PostMapping("/deleteAccount")
    @ResponseBody
    public String deleteAccount(HttpSession session, Model model) {
        AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");

        if (loginUser == null) {
            model.addAttribute("content", "account/acountMain.jsp");
            return "sample";
        }

        int deleted = accountService.deleteAccountByPk(loginUser.getU_user_pk());
        if (deleted > 0) {
            session.invalidate(); // 세션 초기화
            return "success";
        } else {
            return "fail";
        }
    }

    @PostMapping("/myReview")
    public String getMyReview(HttpSession session, Model model, AccountVO accountVO) {
        AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/login"; // 로그인 안 돼 있으면 로그인 페이지로
        }
        Integer userPk = loginUser.getU_user_pk();
        System.out.println(userPk);

        // 리뷰 목록 조회
        List<MyReviewVO> myReviews = accountService.getMyReview(userPk);

        model.addAttribute("myReview", myReviews);
        model.addAttribute("content", "../account/good.jsp");

        return "account/myReviewPage";
    }

    // 나의 리뷰 업데이트
    @PostMapping("/updateReview")
    @ResponseBody
    public String updateReview(@RequestBody Map<String, Object> data) {
        Integer reviewId = null;
        try {
            reviewId = ((Number) data.get("reviewId")).intValue();
        } catch (Exception e) {
            e.printStackTrace();
            return "FAIL";
        }

        String content = (String) data.get("content");
        String recommendYn = (String) data.get("recommendYn");

        accountService.updateReviewAndRecommend(reviewId, content, recommendYn);
        return "OK";
    }

   
}
