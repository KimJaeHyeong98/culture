package com.culture.review.Account;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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

}
