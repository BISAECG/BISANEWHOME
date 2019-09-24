package com.bisa.health.shop.admin.service;



import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.admin.dto.OrderListPageDto;
import com.bisa.health.shop.model.ProductService;

import java.util.List;

public interface IProductService {

    /**
     * 添加产品服务信息
     * @param
     * @return
     */
    int insertProduceService(int class_id,String introduce,int internationalization,String imgurl,Integer good_id,String goods_number);

    /**
     * 查询产品服务信息
     * @return
     */
    ProductService selectProduceService(int id,int internationalization);

    /**
     * 更新产品服务
     * @return
     */
    boolean updateProduceService(String introduce,int id);

    /**
     * 删除产品服务信息
     * @param id
     * @return
     */
    boolean deleteProduceService(int id);


    /**
     * 删除产品服务信息
     * @param goods_number
     * @return
     */
    boolean deleteProduceServiceByNumber(String goods_number);
    /**
     * 根据Class_id查询
     * @param class_id
     * @param internationalization
     * @return
     */
    List<ProductService> selectProduceServicebyClass_id(int class_id,int internationalization);
    /**
     * 查询产品服务信息
     * @return
     */
    OrderListPageDto<ProductService> selectProduceServiceAll(Integer page, Integer limit);
}
