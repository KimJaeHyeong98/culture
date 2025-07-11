package com.culture.review.Account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AccountContorller {
    
     @Autowired
    private AccountServiec acountServiec;

    @GetMapping("login")
    public String acountLogin(Model model) {
        model.addAttribute("content", "Account/login.jsp");
        return "sample";
    }

    @GetMapping("account")
    public String acount(Model model) {
        model.addAttribute("content", "Account/acount.jsp");
        return "sample";
    }

    //로그인
    @PostMapping("/logindo")
    public String loginDo(AccountVO acountVO, HttpSession session, Model model) {

        System.out.println("try login");
        String loginpage = acountServiec.loginDo(acountVO, session, model);

        model.addAttribute("content", loginpage);
        return "sample";
    }

    //로그아웃
    @GetMapping("/logoutdo")
    public String logout(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        session.setAttribute("loginUser", null);
        System.out.println("login Out");
        model.addAttribute("content", "Account/login.jsp");
        return "sample";
    }


    //회원가입
    @PostMapping("/joinMembership")
    public String joinMembership(AccountVO acountVO, Model model) {
        System.out.println("joinMembership -----");
        System.out.println(acountVO);
        acountServiec.addMembership(acountVO, model);
        model.addAttribute("content", "Account/acountMain.jsp");
        return "sample";
    }

    //아이디 중복 체크 
    @PostMapping("account/checkUserId")
    public ResponseEntity<String> checkUserId(@RequestParam("u_user_id") String u_user_id) {
           System.out.println("입력받은 아이디: " + u_user_id); 
        boolean isAvailable = acountServiec.isUserIdAvailable(u_user_id);
           System.out.println("사용 가능 여부: " + isAvailable);
        return ResponseEntity.ok(isAvailable ? "AVAILABLE" : "DUPLICATE");
    }
}
