package com.bisa.health.shop.admin.service;


import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;

import com.bisa.health.shop.admin.dao.IAdminProductServiceDao;
import com.bisa.health.shop.admin.dto.OrderListPageDto;
import com.bisa.health.shop.model.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import java.util.List;



@Service
@CacheConfig(cacheNames = "ProductServiceImpl")
public class ProductServiceImpl implements IProductService{
    @Autowired
    private IAdminProductServiceDao adminProductServiceDao;

    @Override
    @CacheEvict(value = "ProductServiceImpl", allEntries = true)
    public int insertProduceService(int class_id,String introduce,int internationalization,String imgurl,Integer good_id,String goods_number) {
        return adminProductServiceDao.insertProduceService(class_id, introduce, internationalization, imgurl, good_id,goods_number);
    }

    @Override
    @Cacheable(key = "targetClass.name+methodName+#id+#internationalization")
    public ProductService selectProduceService(int id,int internationalization) {
        return adminProductServiceDao.selectProduceService(id,internationalization);
    }

    @Override
    @CacheEvict(value = "ProductServiceImpl", allEntries = true)
    public boolean updateProduceService(String introduce, int id) {
        return adminProductServiceDao.updateProduceService(introduce, id);
    }

    @Override
    @CacheEvict(value = "ProductServiceImpl", allEntries = true)
    public boolean deleteProduceService(int id) {
        return adminProductServiceDao.deleteProduceService(id);
    }

    @Override
    @CacheEvict(value = "ProductServiceImpl", allEntries = true)
    public boolean deleteProduceServiceByNumber(String goods_number) {
        return adminProductServiceDao.deleteProduceServiceByNumber(goods_number);
    }

    @Override
    @Cacheable(key = "targetClass.name+methodName+#class_id+#internationalization")
    public List<ProductService> selectProduceServicebyClass_id(int class_id, int internationalization) {
        return adminProductServiceDao.selectProduceServicebyClass_id(class_id, internationalization);
    }

    @Override
    @Cacheable(key = "targetClass.name+methodName+#page+#limit")
    public OrderListPageDto<ProductService> selectProduceServiceAll(Integer page, Integer limit) {
        SystemContext.setPageOffset((page - 1) * limit);
        SystemContext.setPageSize(limit);
        SystemContext.setSort("class_id");
        SystemContext.setOrder("desc");
        Pager<ProductService>  productService = adminProductServiceDao.selectProduceServiceAll();
        OrderListPageDto<ProductService> productServiceDto =new OrderListPageDto<>();
        productServiceDto.setCode(0);
        productServiceDto.setMsg("''");
        productServiceDto.setCount(productService.getTotal());
        productServiceDto.setData(productService.getDatas());
        return productServiceDto;
    }

}
