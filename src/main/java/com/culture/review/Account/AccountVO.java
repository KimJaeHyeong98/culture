package com.culture.review.Account;

import lombok.Data;
import java.util.Date; 
@Data
public class AccountVO {
    private int u_user_pk;
    private String u_user_id;
    private String u_password;
    private String u_user_name;
    private Date u_created_at;
}
