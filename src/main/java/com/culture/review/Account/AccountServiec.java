package com.culture.review.Account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;

@Service
public class AccountServiec {

    @Autowired
    private AccountMapper acountMapper;

    public String loginDo(AccountVO acountVO, HttpSession session, Model model) {
        AccountVO loginUser = acountMapper.login(acountVO);

        if (loginUser != null) {
            session.setAttribute("loginUser", loginUser);
            return "Account/good.jsp"; // 로그인 성공 시 보여줄 내부 JSP
        } else {
            model.addAttribute("loginFail", true);
            return "Account/login.jsp"; // 로그인 실패 시 다시 로그인 화면
        }
    }

    public void addMembership(AccountVO acountVO, Model model) {
        if (acountMapper.insertMembership(acountVO) == 1) {
            System.out.println("add Membership success");
            model.addAttribute("addMembership", true);
        }

    }


      public boolean isUserIdAvailable(String u_user_id) {
        return acountMapper.countUserId(u_user_id) == 0;
    }
}
