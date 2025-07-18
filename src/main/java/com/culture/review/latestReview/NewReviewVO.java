package com.culture.review.latestReview;

import lombok.Data;

@Data
public class NewReviewVO {
    private int contentId;
    private String contentType;
    private String reviewText;
    private String reviewRating;
    private String reviewRecommend;
    private int userPk;
}
