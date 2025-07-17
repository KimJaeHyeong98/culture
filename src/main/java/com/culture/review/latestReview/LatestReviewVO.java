package com.culture.review.latestReview;

import lombok.Data;
import java.util.Date;

@Data
public class LatestReviewVO {

    private int reviewId; 
    private String userName; 
    private String contentType; 
    private int contentId; 
    private String contentTitle;
    private String content; 
    private String recommendYn; 
    private String reviewDate;

}
