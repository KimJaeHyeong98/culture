package com.culture.review.latestReview;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LatestReviewService {

    @Autowired
    private LatestReviewMapper latestReviewMapper;

    // 전체 리뷰 조회
    public List<LatestReviewVO> getAllReview() {
        List<LatestReviewVO> reviews = latestReviewMapper.selectAllReview();
        System.out.println(reviews);
        return reviews;
    }

    // 비동기 영화 조회
    public List<SearchResultVO> searchByKeyword(String keyword) {
        try {
            List<SearchResultVO> result = latestReviewMapper.searchMoviesByKeyword(keyword);
            System.out.println("조회 결과 수: " + result.size());
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            throw e; // 혹은 null 반환 등 필요에 따라 처리
        }
    }

    // 비동기 애니메이션 조회
    public List<SearchResultVO> searchByAnime(String keyword) {
        try {
            List<SearchResultVO> result = latestReviewMapper.searchAnime(keyword);
            System.out.println("조회 결과 수: " + result.size());
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            throw e; // 혹은 null 반환 등 필요에 따라 처리
        }
    }

    // 비동기 게임 조회
    public List<SearchResultVO> searchByGame(String keyword) {
        try {
            List<SearchResultVO> result = latestReviewMapper.searchGame(keyword);
            System.out.println("조회 결과 수: " + result.size());
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            throw e; // 혹은 null 반환 등 필요에 따라 처리
        }
    }

    public void submitReviewAndRating(NewReviewVO newReviewVO) {
        // 먼저 리뷰 insert
        latestReviewMapper.insertReview(newReviewVO);

        // 그 다음 평점 insert
        latestReviewMapper.insertRating(newReviewVO);
    }
}
