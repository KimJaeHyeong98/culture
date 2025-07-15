package com.culture.review.register;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.culture.review.Account.AccountVO;

import jakarta.servlet.http.HttpSession;

@Controller
public class NewRegister {

    @Autowired
    private RegisterService registerService;

    @GetMapping("account/register")
public String registerAdd(HttpSession session, Model model) {
    Object loginUserObj = session.getAttribute("loginUser");

    // 로그인 안 했으면 로그인 페이지로 리다이렉트
    if (loginUserObj == null) {
        return "redirect:/login";
    }

    // 로그인한 유저 정보에서 PK 가져오기
    AccountVO loginUser = (AccountVO) loginUserObj;
    if (loginUser.getU_user_pk() != 1) {
        // 관리자가 아니면 메인 화면 등으로 리다이렉트
        return "redirect:/account/main";
    }

    // 관리자라면 JSP 페이지 구성
    model.addAttribute("content", "good.jsp");
    return "account/registerMain";
}
   

    @PostMapping("account/registerAdd")
    public String registerAdd(
            RegisterVO registerVO, HttpSession session, Model model,RedirectAttributes redirectAttributes,
            @RequestParam("file") MultipartFile file) {
        if (!file.isEmpty()) {
            System.out.println(">>> 파일 있음: " + file.getOriginalFilename());

            String uploadDir = "C:/KJH/upload/posters";
            String originalFilename = file.getOriginalFilename();
            String newFileName = UUID.randomUUID().toString() + "_" + originalFilename;

            File dest = new File(uploadDir, newFileName);
            try {
                file.transferTo(dest);
                // 👇 여기가 핵심!
                String path = "/images/posters/" + newFileName;
                System.out.println(">>> 저장될 포스터 경로: " + path);
                registerVO.setM_poster_path(path);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println(">>> 파일이 비어있음");
            registerVO.setM_poster_path("");
        }

        System.out.println(">>> VO 확인: " + registerVO);
       redirectAttributes.addFlashAttribute("registerSuccess", true);

        registerService.addregister(registerVO);

        if (session.getAttribute("loginUser") != null) {
            model.addAttribute("content", "good.jsp"); // 로그인한 사용자용
        } else {
            model.addAttribute("content", "acountMain.jsp"); // 비로그인 사용자용
        }
       return "redirect:/account/register";
    }

}
