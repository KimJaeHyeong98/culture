package com.culture.review.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.culture.review.vo.GameVO;
import com.culture.review.vo.ReviewVO;

@Mapper
public interface GameMapper {

    @Select("""
        SELECT *
        FROM (
            SELECT ROWNUM AS rnum, data.*
            FROM (
                SELECT
                    g.g_game_id,
                    g.g_title,
                    TO_CHAR(g.g_release_date, 'YYYY-MM-DD') AS release_date,
                    g.g_director,
                    g.g_poster_path,
                    LISTAGG(c.c_category_name, ', ') 
                        WITHIN GROUP (ORDER BY c.c_category_name) AS category_list
                FROM g_game g
                JOIN g_game_category gc ON g.g_game_id = gc.g_game_id
                JOIN c_category c ON gc.c_category_id = c.c_category_id
                GROUP BY
                    g.g_game_id, g.g_title, g.g_release_date, g.g_director, g.g_poster_path
                ORDER BY g.g_game_id DESC
            ) data
            WHERE ROWNUM <= #{end}
        )
        WHERE rnum > #{start}
    """)
    List<GameVO> selectGameListByPage(Map<String, Integer> param);

    @Select("SELECT COUNT(*) FROM g_game")
    int getGameCount();

    @Select("""
        SELECT
            r.r_review_id,
            r.r_content_type,
            r.r_content_id,
            g.g_title,
            r.r_content,
            r.r_recommend_yn,
            TO_CHAR(r.r_review_date, 'YYYY-MM-DD') AS review_date
        FROM r_review r
                JOIN g_game g ON r.r_content_type = 'GAME' AND r.r_content_id = g.g_game_id and g.G_GAME_ID = #{gameId}
        ORDER BY r.r_content_id
            """)
    List<ReviewVO> selectReviewsByGameId(String gameId);


    @Select("""
        SELECT
            r.r_review_id,
            r.r_content_type,
            r.r_content_id,
            g.g_title,
            r.r_content,
            r.r_recommend_yn,
            TO_CHAR(r.r_review_date, 'YYYY-MM-DD') AS review_date
        FROM r_review r
        JOIN g_game g ON r.r_content_type = 'GAME' AND r.r_content_id = g.g_game_id
        ORDER BY r.r_content_id
    """)
    List<ReviewVO> selectAllGameReviews();

    

}