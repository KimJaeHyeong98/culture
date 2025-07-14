package com.culture.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.culture.review.service.GameService;
import com.culture.review.vo.GameVO;
import com.culture.review.vo.ReviewVO;

@Controller
public class GameController {

    @Autowired
    private GameService gameService;

    @GetMapping("/gamelist")
    public String showGameList(@RequestParam(name = "page", defaultValue = "1") int page, Model model) {
    int pageSize = 9;

    List<GameVO> games = gameService.getGameListByPage(page, pageSize);
    int totalCount = gameService.getTotalGameCount();
    int totalPage = (int) Math.ceil((double) totalCount / pageSize);

    // Map<String, List<ReviewVO>> reviewsMap = new HashMap<>();
    for (GameVO game : games) {
        game.setReviews(gameService.getReviewsByGameId(game.getG_game_id()));
        // List<ReviewVO> reviews = gameService.getReviewsByGameId(game.getG_game_id());
        // reviewsMap.put(game.getG_game_id(), reviews);
    }

    model.addAttribute("games", games);
    model.addAttribute("currentPage", page);
    // model.addAttribute("reviewsMap", reviewsMap);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("content", "account/acountMain.jsp");
    System.out.println(totalPage);

    return "gamelist"; // JSP 페이지명
}
}
