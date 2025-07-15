package com.culture.review.register;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface RegisterMapper {

    @Insert("""
                INSERT INTO m_movie (
                    m_movie_id,
                    m_title,
                    m_release_date,
                    m_director,
                    m_poster_path
                ) VALUES (
                    m_movie_seq.NEXTVAL,
                    #{m_title},
                    #{m_release_date, jdbcType=DATE},
                    #{m_director},
                    #{m_poster_path, jdbcType=VARCHAR}
                )
            """)
    int insertRegister(MovieVO movieVO);

    @Insert("""
                INSERT INTO an_anime (
                    an_anime_id,
                    an_title,
                    an_release_date,
                    an_director,
                    an_poster_path
                ) VALUES (
                    an_anime_seq.NEXTVAL,
                    #{an_title},
                    #{an_release_date, jdbcType=DATE},
                    #{an_director},
                    #{an_poster_path, jdbcType=VARCHAR}
                )
            """)
    int insertAnime(AnimeVO animeVO);

    @Insert("""
                INSERT INTO g_game (
                    g_game_id,
                    g_title,
                    g_release_date,
                    g_director,
                    g_poster_path
                ) VALUES (
                    g_game_seq.NEXTVAL,
                    #{g_title},
                    #{g_release_date, jdbcType=DATE},
                    #{g_director},
                    #{g_poster_path, jdbcType=VARCHAR}
                )
            """)
    int insertGame(GameVO gameVO);

    @Select("SELECT * FROM m_movie m " +
            "WHERE NOT EXISTS (" +
            "  SELECT 1 FROM m_movie_category mc " +
            "  WHERE mc.m_movie_id = m.m_movie_id" +
            ")")
    List<MovieVO> getMoviesWithoutCategory();



    @Insert("INSERT INTO m_movie_category (m_movie_id, c_category_id) VALUES (#{movieId}, #{categoryId})")
void insertMovieCategory(@Param("movieId") int movieId, @Param("categoryId") int categoryId);

}
