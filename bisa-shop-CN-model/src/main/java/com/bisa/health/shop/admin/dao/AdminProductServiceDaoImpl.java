package com.bisa.health.shop.admin.dao;


import com.bisa.health.basic.dao.BaseDao;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.ProductService;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminProductServiceDaoImpl extends BaseDao<ProductService> implements IAdminProductServiceDao {

    @Override
    public int insertProduceService(int class_id,String introduce,int internationalization,String imgurl,Integer good_id,String goods_number) {
        String sql = "INSERT INTO h_product_service(class_id, introduce, internationalization, imgurl, good_id ,goods_number) VALUES(?,?,?,?,?,?)";
        return super.addBySql(sql, new Object[]{class_id,introduce,internationalization,imgurl,good_id,goods_number});
    }

    @Override
    public ProductService selectProduceService(int id,int internationalization) {
        String sql = "select * from h_product_service WHERE id = ? AND internationalization = ?";
        return super.queryObjectBySql(sql, new Object[]{id,internationalization}, ProductService.class);
    }

    @Override
    public Pager<ProductService> selectProduceServiceAll() {
        String sql = "select * from h_product_service";
        return super.findBySql(sql, null, ProductService.class, true);
    }

    @Override
    public boolean updateProduceService(String introduce,int id) {
        String sql = "UPDATE h_product_service SET introduce=? WHERE id=?";
        int result = super.updateBySql(sql, new Object[]{introduce,id});
        return result >= 1 ? true : false;
    }

    @Override
    public boolean deleteProduceService(int id) {
        String sql = "DELETE FROM h_product_service WHERE id=?";
        int result = super.deleteBySql(sql, new Object[]{id});
        return result >= 1 ? true : false;
    }

    @Override
    public boolean deleteProduceServiceByNumber(String goods_number) {
        String sql = "DELETE FROM h_product_service WHERE goods_number=?";
        int result = super.deleteBySql(sql, new Object[]{goods_number});
        return result >= 1 ? true : false;
    }

    @Override
    public List<ProductService> selectProduceServicebyClass_id(int class_id, int internationalization) {
        String sql = "SELECT * FROM h_product_service WHERE class_id=? and internationalization=?";
        return super.listBySql(sql,  new Object[]{class_id,internationalization}, ProductService.class);
    }
}
