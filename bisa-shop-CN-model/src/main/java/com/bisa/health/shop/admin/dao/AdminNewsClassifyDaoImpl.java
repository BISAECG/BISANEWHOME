package com.bisa.health.shop.admin.dao;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.shop.model.NewsClassify;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class AdminNewsClassifyDaoImpl extends BaseDao<NewsClassify> implements IAdminNewsClassifyDao {

    @Override
    public List<NewsClassify> selectNewsClassify() {
        String sql = "SELECT * FROM h_news_classify ";
        return super.listBySql(sql, new Object[]{}, NewsClassify.class);
    }
}
