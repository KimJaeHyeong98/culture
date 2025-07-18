package com.culture.review.Account;

import lombok.Data;

@Data
public class MyReviewVO {
    private Integer reviewId;
    private String userName;
    private String contentType;
    private Integer contentId;
    private String contentTitle;
    private String content;
    private String recommendYn;
    private String reviewDate;
}
