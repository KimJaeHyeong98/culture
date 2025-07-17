package com.culture.review.latestReview;

import lombok.Data;

@Data
public class SearchResultVO {
    private String title; 
    private String releaseDate; // 개봉일 (yyyy-MM-dd 포맷)
    private String categoryList; // 카테고리 이름들 (쉼표로 구분)
}
