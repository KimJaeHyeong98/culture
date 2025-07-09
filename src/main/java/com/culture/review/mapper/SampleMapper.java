package com.culture.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.culture.review.vo.SampleVO;

@Mapper
public interface SampleMapper {
    // @Select("select * from test")
    // public List<SampleVO> selectAllReview();
}
