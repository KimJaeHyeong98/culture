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

@Controller
public class GameController {

    @Autowired
    private GameService gameService;

    @GetMapping("/gamelist")
    public String showGameList(@RequestParam(defaultValue = "1") int page, Model model) {
    int pageSize = 9;

    List<GameVO> games = gameService.getGameListByPage(page, pageSize);
    int totalCount = gameService.getTotalGameCount();
    int totalPage = (int) Math.ceil((double) totalCount / pageSize);

    model.addAttribute("games", games);
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPage", totalPage);
    System.out.println(totalPage);

    return "gamelist"; // JSP 페이지명
}
}
