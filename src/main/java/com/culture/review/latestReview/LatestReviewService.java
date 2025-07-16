package com.culture.review.latestReview;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class LatestReviewService {

    @Autowired
    private LatestReviewMapper latestReviewMapper;

     public List<LatestReviewVO> getAllReview() {
        List<LatestReviewVO> reviews = latestReviewMapper.selectAllReview();
        System.out.println(reviews);
        return reviews;
    }
}
