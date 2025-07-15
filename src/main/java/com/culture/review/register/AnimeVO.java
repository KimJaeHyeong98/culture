package com.culture.review.register;

import java.sql.Date;

import lombok.Data;

@Data
public class AnimeVO {
    private int an_anime_id;
    private String an_title;
    private Date an_release_date;
    private String an_director;
    private String an_poster_path;
}
