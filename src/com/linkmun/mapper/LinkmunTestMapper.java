package com.linkmun.mapper;

import com.linkmun.model.LinkmunTest;

public interface LinkmunTestMapper {
    int deleteByPrimaryKey(Integer testid);

    int insert(LinkmunTest record);

    int insertSelective(LinkmunTest record);

    LinkmunTest selectByPrimaryKey(Integer testid);

    int updateByPrimaryKeySelective(LinkmunTest record);

    int updateByPrimaryKey(LinkmunTest record);
}