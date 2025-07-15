package com.culture.review.register;

import java.sql.Date;

import lombok.Data;

@Data
public class GameVO {
    private int g_game_id;
    private String g_title;
    private Date g_release_date;
    private String g_director;
    private String g_poster_path;
}
