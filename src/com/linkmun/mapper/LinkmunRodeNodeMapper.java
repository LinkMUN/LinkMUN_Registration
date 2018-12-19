package com.linkmun.mapper;

import java.util.List;

import com.linkmun.model.LinkmunRodeNode;

public interface LinkmunRodeNodeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LinkmunRodeNode record);

    int insertSelective(LinkmunRodeNode record);

    LinkmunRodeNode selectByPrimaryKey(Integer id);
    
    List<LinkmunRodeNode> selectByRode(Integer role);

    int updateByPrimaryKeySelective(LinkmunRodeNode record);

    int updateByPrimaryKey(LinkmunRodeNode record);
}