package com.culture.review.register;

import java.util.List;

import lombok.Data;

@Data
public class AnimeCategoryVO {
    private int animeId;
    private List<Integer> categoryIds;
}
