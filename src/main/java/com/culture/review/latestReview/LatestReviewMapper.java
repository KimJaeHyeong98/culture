package com.culture.review.latestReview;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface LatestReviewMapper {

    // 전체조회
    @Select("""
              SELECT
                r.r_review_id    AS rReviewId,
                u.u_user_name    AS uUserName,
                r.r_content_type AS rContentType,
                r.r_content_id   AS rContentId,
                m.m_title        AS contentTitle,
                r.r_content      AS rContent,
                r.r_recommend_yn AS rRecommendYn,
                TO_CHAR(r.r_review_date, 'YYYY-MM-DD') AS reviewDate
              FROM r_review r
              JOIN u_user_account u ON r.u_user_pk = u.u_user_pk
              JOIN m_movie m ON r.r_content_type = 'MOVIE' AND r.r_content_id = m.m_movie_id

              UNION ALL

              SELECT
                r.r_review_id    AS rReviewId,
                u.u_user_name    AS uUserName,
                r.r_content_type AS rContentType,
                r.r_content_id   AS rContentId,
                a.an_title       AS contentTitle,
                r.r_content      AS rContent,
                r.r_recommend_yn AS rRecommendYn,
                TO_CHAR(r.r_review_date, 'YYYY-MM-DD') AS reviewDate
              FROM r_review r
              JOIN u_user_account u ON r.u_user_pk = u.u_user_pk
              JOIN an_anime a ON r.r_content_type = 'ANIME' AND r.r_content_id = a.an_anime_id

              UNION ALL

              SELECT
                r.r_review_id    AS rReviewId,
                u.u_user_name    AS uUserName,
                r.r_content_type AS rContentType,
                r.r_content_id   AS rContentId,
                g.g_title        AS contentTitle,
                r.r_content      AS rContent,
                r.r_recommend_yn AS rRecommendYn,
                TO_CHAR(r.r_review_date, 'YYYY-MM-DD') AS reviewDate
              FROM r_review r
              JOIN u_user_account u ON r.u_user_pk = u.u_user_pk
              JOIN g_game g ON r.r_content_type = 'GAME' AND r.r_content_id = g.g_game_id

              ORDER BY rReviewId
            """)

    @Results({
            @Result(property = "reviewId", column = "rReviewId"),
            @Result(property = "userName", column = "uUserName"),
            @Result(property = "contentType", column = "rContentType"),
            @Result(property = "contentId", column = "rContentId"),
            @Result(property = "contentTitle", column = "contentTitle"),
            @Result(property = "content", column = "rContent"),
            @Result(property = "recommendYn", column = "rRecommendYn"),
            @Result(property = "reviewDate", column = "reviewDate")
    })
    List<LatestReviewVO> selectAllReview();
}
