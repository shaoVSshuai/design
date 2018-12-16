package com.hzyc.intstudio.dao;

import java.util.List;

import com.hzyc.intstudio.entity.Comments;

public interface CommentsMapper {
    int deleteByPrimaryKey(String id);

    int insert(Comments record);

    int insertSelective(Comments record);

    Comments selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Comments record);

    int updateByPrimaryKey(Comments record);
    
    List<Comments> selectAll();
}