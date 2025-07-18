package com.culture.review.register;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

import java.sql.Date;

@Data
public class MovieVO {
    private int m_movie_id;
    private String m_title;
    private Date m_release_date;
    private String m_director;
    private String m_poster_path;
}
