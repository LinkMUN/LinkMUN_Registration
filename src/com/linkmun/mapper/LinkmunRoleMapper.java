package com.linkmun.mapper;

import com.linkmun.model.LinkmunRole;

public interface LinkmunRoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LinkmunRole record);

    int insertSelective(LinkmunRole record);

    LinkmunRole selectByPrimaryKey(Integer id);
    
    LinkmunRole selectByrolename(String name);

    int updateByPrimaryKeySelective(LinkmunRole record);

    int updateByPrimaryKey(LinkmunRole record);
}