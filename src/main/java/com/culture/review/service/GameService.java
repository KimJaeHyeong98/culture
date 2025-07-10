package com.culture.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.review.mapper.GameMapper;
import com.culture.review.vo.GameVO;

@Service
public class GameService {

    @Autowired
    private GameMapper gameMapper;

    public List<GameVO> getGameListByPage(int page, int pageSize) {
        int start = (page - 1) * pageSize;
        int end = page * pageSize;

        Map<String, Integer> param = new HashMap<>();
        param.put("start", start);
        param.put("end", end);

        return gameMapper.selectGameListByPage(param);
    }

    public int getTotalGameCount() {
        return gameMapper.getGameCount();
    }
}
