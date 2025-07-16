package com.culture.review.Account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;

@Service
public class AccountService {

    @Autowired
    private AccountMapper accountMapper;

    // 로그인 체크처리
    public boolean isLoggedIn(HttpSession session) {
        return session != null && session.getAttribute("loginUser") != null;
    }

    public String loginDo(AccountVO acountVO, HttpSession session, Model model) {
        AccountVO loginUser = accountMapper.login(acountVO);

        if (loginUser != null) {
            session.setAttribute("loginUser", loginUser);
            return "account/good.jsp"; // 로그인 성공 시 보여줄 내부 JSP
        } else {
            model.addAttribute("loginFail", true);
            return "account/login.jsp"; // 로그인 실패 시 다시 로그인 화면
        }
    }

    public void addMembership(AccountVO acountVO, Model model) {
        if (accountMapper.insertMembership(acountVO) == 1) {
            System.out.println("add Membership success");
            model.addAttribute("addMembership", true);
        }

    }

    public boolean isUserIdAvailable(String u_user_id) {
        return accountMapper.countUserId(u_user_id) == 0;
    }

    // 회원 정보 select
    public AccountVO getAccountByPk(int pk) {
        return accountMapper.selectAccountByPk(pk);
    }

    // 회원 정보 update
    public int updateAccount(AccountVO vo) {
        return accountMapper.updateAccount(vo);
    }

    // 회원 정보 delect
    public int deleteAccountByPk(int pk) {
        return accountMapper.deleteByPk(pk);
    }

}
