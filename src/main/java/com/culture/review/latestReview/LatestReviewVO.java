package com.culture.review.latestReview;

import lombok.Data;
import java.util.Date;

@Data
public class LatestReviewVO {
    private int rReviewId; // r_review_id
    private String uUserName; // u_user_name ← 추가
    private String rContentType; // r_content_type
    private int rContentId; // r_content_id
    private String contentTitle; // content_title
    private String rContent; // r_content
    private String rRecommendYn; // r_recommend_yn
    private String reviewDate; // review_date
}

