package com.bisa.health.shop.admin.dao;

import com.bisa.health.shop.model.NewsClassify;

import java.util.List;

public interface IAdminNewsClassifyDao {

    /**
     * 查询新闻标签表
     * @return
     */
    List<NewsClassify> selectNewsClassify();
}
