package com.culture.review.Account;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

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
}
