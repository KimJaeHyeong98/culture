package com.culture.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.culture.review.vo.UserVO;

@Controller
public class JoinController {

    @GetMapping("/join-sy")
    public String showJoinPage(Model model) {
        model.addAttribute("userVO", new UserVO());
        return "join-sy";
    }

    @PostMapping("/join-sy")
    public String joinSubmit(@Valid @ModelAttribute UserVO userVO,
            BindingResult bindingResult,
            Model model) {
        if (bindingResult.hasErrors()) {
            return "join-sy";
        }

        model.addAttribute("msg", userVO.getName() + "님 회원가입 성공!");
        return "joinSuccess-sy";
    }

}
