package com.culture.review.register;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
@Transactional
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
   
    public void assignMovieCategories(int movieId, List<Integer> categoryIds) {
        for (Integer categoryId : categoryIds) {
            registerMapper.insertMovieCategory(movieId, categoryId);
        }
    }


    public List<AnimeVO> getAnimesWithoutCategory() {
        List<AnimeVO> animes = registerMapper.getAnimesWithoutCategory();
        System.out.println("애니메이션 개수: " + animes.size());
        return animes;
    }

    public void assignAnimeCategories(int animeId, List<Integer> categoryIds) {
        for (Integer categoryId : categoryIds) {
            registerMapper.insertAnimeCategory(animeId, categoryId);
        }
    }

    public List<GameVO> getGamesWithoutCategory() {
        List<GameVO> games = registerMapper.getGamesWithoutCategory();
        System.out.println("게임 개수: " + games.size());
        return games;
    }

    public void assignGameCategories(int gameId, List<Integer> categoryIds) {
        for (Integer categoryId : categoryIds) {
            registerMapper.insertGameCategory(gameId, categoryId);
        }
    }



}