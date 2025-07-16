package com.culture.review.latestReview;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.culture.review.vo.ReviewVO;

@Mapper
public interface LatestReviewMapper {

    // 전체조회
    @Select("""
                    SELECT
                r.r_review_id,
                u.u_user_name,
                r.r_content_type,
                r.r_content_id,
                m.m_title        AS content_title,
                r.r_content,
                r.r_recommend_yn,
                TO_CHAR(r.r_review_date, 'YYYY-MM-DD') AS review_date
            FROM r_review r
            JOIN u_user_account u
              ON r.u_user_pk = u.u_user_pk
            JOIN m_movie m
              ON r.r_content_type = 'MOVIE'
              AND r.r_content_id   = m.m_movie_id

            UNION ALL

            SELECT
                r.r_review_id,
                u.u_user_name,
                r.r_content_type,
                r.r_content_id,
                a.an_title       AS content_title,
                r.r_content,
                r.r_recommend_yn,
                TO_CHAR(r.r_review_date, 'YYYY-MM-DD') AS review_date
            FROM r_review r
            JOIN u_user_account u
              ON r.u_user_pk = u.u_user_pk
            JOIN an_anime a
              ON r.r_content_type = 'ANIME'
              AND r.r_content_id   = a.an_anime_id

            UNION ALL

            SELECT
                r.r_review_id,
                u.u_user_name,
                r.r_content_type,
                r.r_content_id,
                g.g_title        AS content_title,
                r.r_content,
                r.r_recommend_yn,
                TO_CHAR(r.r_review_date, 'YYYY-MM-DD') AS review_date
            FROM r_review r
            JOIN u_user_account u
              ON r.u_user_pk = u.u_user_pk
            JOIN g_game g
              ON r.r_content_type = 'GAME'
              AND r.r_content_id   = g.g_game_id

            ORDER BY
                r_review_id
                """)
    List<LatestReviewVO> selectAllReview();

}
