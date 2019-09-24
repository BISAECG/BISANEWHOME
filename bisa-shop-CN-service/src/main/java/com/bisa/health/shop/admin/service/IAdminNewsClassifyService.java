package com.bisa.health.shop.admin.service;

import com.bisa.health.shop.model.NewsClassify;

import java.util.List;

public interface IAdminNewsClassifyService {
    /**
     * 查询新闻标签表
     * @return
     */
    List<NewsClassify> selectNewsClassify();
}
