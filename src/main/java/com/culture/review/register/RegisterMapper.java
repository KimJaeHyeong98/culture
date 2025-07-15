package com.culture.review.register;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

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
int insertRegister(RegisterVO registerVO);
}
