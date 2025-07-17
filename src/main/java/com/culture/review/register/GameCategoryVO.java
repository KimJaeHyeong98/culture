package com.culture.review.register;

import java.util.List;

import lombok.Data;

@Data
public class GameCategoryVO {
    private int gameId;
    private List<Integer> categoryIds;
}
