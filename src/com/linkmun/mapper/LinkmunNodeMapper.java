package com.linkmun.mapper;

import com.linkmun.model.LinkmunNode;

public interface LinkmunNodeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LinkmunNode record);

    int insertSelective(LinkmunNode record);

    LinkmunNode selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LinkmunNode record);

    int updateByPrimaryKey(LinkmunNode record);
    
    int sclectcount();
}