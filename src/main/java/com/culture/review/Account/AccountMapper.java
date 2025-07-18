package com.culture.review.Account;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.culture.review.latestReview.LatestReviewVO;

@Mapper
public interface AccountMapper {

  @Select("""
          SELECT *
          FROM u_user_account
          WHERE u_user_id = #{u_user_id}
            AND u_password = #{u_password}
      """)
  AccountVO login(AccountVO acountVO);

  @Insert("insert into u_user_account values(u_user_account_seq.nextval, #{u_user_id}, #{u_password},#{u_user_name}, sysdate)")
  int insertMembership(AccountVO acountVO);

  @Select("SELECT COUNT(*) FROM u_user_account WHERE u_user_id = #{u_user_id}")
  int countUserId(String u_user_id);

  @Select("""
          SELECT
              *
          FROM u_user_account
          WHERE u_user_pk = #{pk}
      """)
  AccountVO selectAccountByPk(@Param("pk") int pk);

  @Update("""
          UPDATE u_user_account
          SET u_user_name = #{u_user_name},
              u_password = #{u_password}
          WHERE u_user_pk = #{u_user_pk}
      """)
  int updateAccount(AccountVO vo);

  @Delete("""
          DELETE FROM u_user_account
          WHERE u_user_pk = #{pk}
      """)
  int deleteByPk(@Param("pk") int pk);

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
      WHERE r.u_user_pk = #{userPk}

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
      WHERE r.u_user_pk = #{userPk}

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
      WHERE r.u_user_pk = #{userPk}

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
  List<MyReviewVO> selectReviewsByUser(@Param("userPk") Integer userPk);

  @Update("""
          UPDATE r_review
          SET r_content = #{content}, r_recommend_yn = #{recommendYn}
          WHERE r_review_id = #{reviewId}
      """)
  void updateReviewAndRecommend(@Param("reviewId") Integer reviewId,
      @Param("content") String content,
      @Param("recommendYn") String recommendYn);

  @Delete("""
          DELETE FROM r_review
          WHERE r_review_id = #{reviewId}
      """)
  void deleteReviewById(@Param("reviewId") Integer reviewId);
}
