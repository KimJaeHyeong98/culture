package com.culture.review.vo;

import java.util.List;

import com.culture.review.Account.AccountVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class GameVO {
    private String g_game_id;
    private String g_title;
    private String g_release_date;
    private String g_poster_path;
    private String g_director;
    private String category_list;
    private List<ReviewVO> reviews;
    private AccountVO accountVO; 
}

