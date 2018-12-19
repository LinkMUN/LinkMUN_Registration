package com.linkmun.mapper;

import java.util.List;

import com.linkmun.model.LinkmunUser;

public interface LinkmunUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LinkmunUser record);

    int insertSelective(LinkmunUser record);

    LinkmunUser selectByPrimaryKey(Integer id);
    
    LinkmunUser selectByUsername(String name);
    
    LinkmunUser selectByEmail(String email);

    List<LinkmunUser> selectAll();
    
    int updateByPrimaryKeySelective(LinkmunUser record);

    int updateByPrimaryKey(LinkmunUser record);
}