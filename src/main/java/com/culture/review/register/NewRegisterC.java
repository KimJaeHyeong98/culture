package com.culture.review.register;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.culture.review.Account.AccountVO;

import jakarta.servlet.http.HttpSession;

@Controller
public class NewRegisterC {

    @Autowired
    private RegisterService registerService;

    @GetMapping("register/register")
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
        model.addAttribute("content", "../account/good.jsp");
        return "register/registerMain";
    }

    @PostMapping("register/registerMovieAdd")
    public String registerMovieAdd(
            MovieVO movieVO, HttpSession session, Model model, RedirectAttributes redirectAttributes,
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
                movieVO.setM_poster_path(path);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println(">>> 파일이 비어있음");
            movieVO.setM_poster_path("");
        }

        System.out.println(">>> VO 확인: " + movieVO);
        redirectAttributes.addFlashAttribute("registerSuccess", true);

        registerService.addregister(movieVO);

        if (session.getAttribute("loginUser") != null) {
            model.addAttribute("content", "../account/good.jsp"); // 로그인한 사용자용
        } else {
            model.addAttribute("content", "../account/acountMain.jsp"); // 비로그인 사용자용
        }
        return "redirect:/register/register";
    }

    @PostMapping("register/registerAddAnime")
    public String registerAddAnime(
            AnimeVO animeVO, HttpSession session, Model model, RedirectAttributes redirectAttributes,
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
                animeVO.setAn_poster_path(path);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println(">>> 파일이 비어있음");
            animeVO.setAn_poster_path("");
        }

        System.out.println(">>> VO 확인: " + animeVO);
        redirectAttributes.addFlashAttribute("animeSuccess", true);

        registerService.addAnime(animeVO);

        if (session.getAttribute("loginUser") != null) {
            model.addAttribute("content", "../account/good.jsp"); // 로그인한 사용자용
        } else {
            model.addAttribute("content", "../account/acountMain.jsp"); // 비로그인 사용자용
        }
        return "redirect:/register/register";
    }

    @PostMapping("register/registerAddGame")
    public String registerAddGame(
            GameVO gameVO, HttpSession session, Model model, RedirectAttributes redirectAttributes,
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
                gameVO.setG_poster_path(path);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println(">>> 파일이 비어있음");
            gameVO.setG_poster_path("");
        }

        System.out.println(">>> VO 확인: " + gameVO);
        redirectAttributes.addFlashAttribute("gameSuccess", true);

        registerService.addGame(gameVO);

        if (session.getAttribute("loginUser") != null) {
            model.addAttribute("content", "../account/good.jsp"); // 로그인한 사용자용
        } else {
            model.addAttribute("content", "../account/acountMain.jsp"); // 비로그인 사용자용
        }
        return "redirect:/register/register";
    }

    @GetMapping("register/cocAdd")
    public String cocAdd(HttpSession session, Model model) {
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
        model.addAttribute("content", "../account/good.jsp");
        return "register/registerCategory";
    }

    @GetMapping("/categoryless-movies")
    @ResponseBody
    public List<MovieVO> getMoviesWithoutCategory() {
        return registerService.getMoviesWithoutCategory();
    }

    @GetMapping("/categoryless-animes")
    @ResponseBody
    public List<AnimeVO> getCategorylessAnimes() {
        return registerService.getAnimesWithoutCategory();
    }

    @GetMapping("/categoryless-games")
    @ResponseBody
    public List<GameVO> getCategorylessGames() {
        return registerService.getGamesWithoutCategory();
    }

    // 출연진 없는 영화 불러오기
    @GetMapping("/castless-movies")
    @ResponseBody
    public List<MovieVO> getMoviesWithoutCast() {
        return registerService.getMoviesWithoutCast();
    }


    @PostMapping("/register/assign-categories")
    @ResponseBody
    public String assignCategories(@RequestBody Map<String, Object> payload) {
        List<?> categoryIdObjects = (List<?>) payload.get("categoryIds");
        List<Integer> categoryIds = categoryIdObjects.stream()
            .map(id -> Integer.parseInt(id.toString()))
            .toList();

        if (payload.containsKey("movieId")) {
            int movieId = Integer.parseInt(payload.get("movieId").toString());
            registerService.assignMovieCategories(movieId, categoryIds);
        } else if (payload.containsKey("animeId")) {
            int animeId = Integer.parseInt(payload.get("animeId").toString());
            registerService.assignAnimeCategories(animeId, categoryIds);
        } else if (payload.containsKey("gameId")) { 
            int gameId = Integer.parseInt(payload.get("gameId").toString());
            registerService.assignGameCategories(gameId, categoryIds);
        }

        return "ok";
    }

    @GetMapping("/cast-categories")
    @ResponseBody
    public List<CastCategoryVO> getCastCategories() {
        return registerService.getCastCategories();
    }


}
