package com.linkmun.mapper;

import com.linkmun.model.LinkmunDelegate;

public interface LinkmunDelegateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LinkmunDelegate record);

    int insertSelective(LinkmunDelegate record);

    LinkmunDelegate selectByPrimaryKey(Integer id);
    LinkmunDelegate selectByUsername(String name);

    int updateByPrimaryKeySelective(LinkmunDelegate record);

    int updateByPrimaryKey(LinkmunDelegate record);
    int sclectcount();
}