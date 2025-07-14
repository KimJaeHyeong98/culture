package com.culture.review.Account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class AccountContorller {

    @Autowired
    private AccountService acountServiec;

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
        String loginpage = acountServiec.loginDo(acountVO, session, model);

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
        if (!acountServiec.isLoggedIn(session)) {
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
        acountServiec.addMembership(acountVO, model);
        model.addAttribute("content", "account/acountMain.jsp");
        return "sample";
    }

    // 아이디 중복 체크
    @PostMapping("account/checkUserId")
    public ResponseEntity<String> checkUserId(@RequestParam("u_user_id") String u_user_id) {
        System.out.println("입력받은 아이디: " + u_user_id);
        boolean isAvailable = acountServiec.isUserIdAvailable(u_user_id);
        System.out.println("사용 가능 여부: " + isAvailable);
        return ResponseEntity.ok(isAvailable ? "AVAILABLE" : "DUPLICATE");
    }

    // 신작 등록 폼 
    @PostMapping("account/register")
    public String registerAdd(Model model) {

        
         model.addAttribute("content", "acountMain.jsp");
        return "account/registerMain";
    }



    // 마이페이지 컨트롤러
    @GetMapping("/mypage")
    public String mypage(HttpSession session, Model model) {
        AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");

        if (loginUser == null) {
            // 로그인 안 된 경우 로그인 페이지로 리다이렉트
            model.addAttribute("content", "account/login.jsp");
            return "sample";
        }

        // 로그인된 사용자일 경우 처리
        model.addAttribute("user", loginUser);
        model.addAttribute("content", "account/mypage.jsp");
        return "sample";
    }
}
