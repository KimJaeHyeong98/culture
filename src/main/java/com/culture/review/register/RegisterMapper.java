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

    @Select("""
        SELECT * FROM an_anime a
        WHERE NOT EXISTS (
        SELECT 1 FROM an_anime_category ac
        WHERE ac.an_anime_id = a.an_anime_id
        )
    """)
    List<AnimeVO> getAnimesWithoutCategory();

    @Insert("INSERT INTO an_anime_category (an_anime_id, c_category_id) VALUES (#{animeId}, #{categoryId})")
    void insertAnimeCategory(@Param("animeId") int animeId, @Param("categoryId") int categoryId);

    @Select("""
        SELECT * FROM g_game g
        WHERE NOT EXISTS (
        SELECT 1 FROM g_game_category gc
        WHERE gc.g_game_id = g.g_game_id
        )
    """)
    List<GameVO> getGamesWithoutCategory();

    @Insert("INSERT INTO g_game_category (g_game_id, c_category_id) VALUES (#{gameId}, #{categoryId})")
    void insertGameCategory(@Param("gameId") int gameId, @Param("categoryId") int categoryId);

    // 출연진 없는 영화 불러오기
    @Select("""
        SELECT * FROM m_movie m
        WHERE NOT EXISTS (
        SELECT 1 FROM m_movie_actor mc
        WHERE mc.m_movie_id = m.m_movie_id
        )
    """)
    List<MovieVO> getMoviesWithoutCast();

    @Insert("INSERT INTO m_movie_cast (m_movie_id, a_actor_id) VALUES (#{movieId}, #{actorId})")
    void insertMovieCast(@Param("movieId") int movieId, @Param("actorId") int actorId);

    // 출연진 불러오기
    @Select("SELECT A_ACTOR_ID AS id, A_ACTOR_NAME AS name FROM A_ACTOR")
    List<CastCategoryVO> selectCastCategories();
}

