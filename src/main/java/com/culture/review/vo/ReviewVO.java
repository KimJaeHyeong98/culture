package com.culture.review.vo;

import lombok.Data;

@Data
public class ReviewVO {
    private int r_review_id;     // 리뷰 ID
    private String r_content_id; // 게임 ID
    private String r_content;    // 리뷰 내용
    private String r_recommend_yn; // 추천 여부
    private String review_date;  // 작성 날짜 (TO_CHAR 처리된 문자열)
    private String writer;       // 작성자 ID
    private String starMark;     // 평점 (⭐ 등급으로 표기)
}
