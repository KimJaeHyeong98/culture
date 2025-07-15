package com.culture.review.register;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.review.vo.ReviewVO;

@Service
public class RegisterService {

    @Autowired
    private RegisterMapper registerMapper;

    public void addregister(MovieVO movieVO) {
        if (registerMapper.insertRegister(movieVO) == 1) {
            System.out.println("add register success");
        }

    }

    public void addAnime(AnimeVO animeVO) {
        if (registerMapper.insertAnime(animeVO) == 1) {
            System.out.println("add anime success");
        }
    }

     public void addGame(GameVO gameVO) {
        if (registerMapper.insertGame(gameVO) == 1) {
            System.out.println("add game success");
        }
    }

     public List<MovieVO> getMoviesWithoutCategory() {
        List<MovieVO> movies = registerMapper.getMoviesWithoutCategory();
        System.out.println("영화 개수: " + movies.size());
        return movies;
    }
   

    public void assignCategories(int movieId, List<Integer> categoryIds) {
    for (Integer categoryId : categoryIds) {
        registerMapper.insertMovieCategory(movieId, categoryId);
    }
}

}