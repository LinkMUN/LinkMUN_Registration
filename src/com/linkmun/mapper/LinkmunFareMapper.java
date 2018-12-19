package com.linkmun.mapper;

import com.linkmun.model.LinkmunFare;

public interface LinkmunFareMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LinkmunFare record);

    int insertSelective(LinkmunFare record);

    LinkmunFare selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LinkmunFare record);

    int updateByPrimaryKey(LinkmunFare record);
}