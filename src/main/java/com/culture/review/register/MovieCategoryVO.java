package com.culture.review.register;

import java.util.List;

import lombok.Data;

@Data
public class MovieCategoryVO {
    private int movieId;
    private List<Integer> categoryIds;
}
