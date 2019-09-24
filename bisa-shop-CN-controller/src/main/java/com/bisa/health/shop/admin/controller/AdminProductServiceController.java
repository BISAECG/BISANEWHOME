package com.bisa.health.shop.admin.controller;



import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.admin.dto.OrderListPageDto;
import com.bisa.health.shop.admin.service.IAdminGoodsInternationalizationService;
import com.bisa.health.shop.admin.service.IAdminGoodsService;
import com.bisa.health.shop.admin.service.IProductService;
import com.bisa.health.shop.admin.util.JsonResult;
import com.bisa.health.shop.model.Goods;
import com.bisa.health.shop.model.GoodsInternationalization;
import com.bisa.health.shop.model.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "admin/adminProductService")
public class AdminProductServiceController {
    @Autowired
    private IProductService productService1;
    @Autowired
    private IAdminGoodsService adminGoodsService;
    @Autowired
    private IAdminGoodsInternationalizationService adminGoodsInternationalizationService;
    /**
     * 跳转编辑产品与服务列表
     */
    @RequestMapping(value = "/updateProduct", method = RequestMethod.GET)
    public String updateProduceService(){
        return  "admin/admin_commodity/updateProduct";
    }
    /**
     * 跳转产品与服务列表
     */
    @RequestMapping(value = "/queryProduct", method = RequestMethod.GET)
    public String insertProduceService(){
        return  "admin/admin_commodity/queryProduct";
    }
    /**
     * 插入产品服务信息
     * @param class_id
     * @param introduce
     * @param internationalization
     * @return
     */
    @RequestMapping(value = "/insertProduceService", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult insertProduceService(int class_id,String introduce,int internationalization){
        JsonResult jsonResult=new JsonResult();
        try {
            List<ProductService> productService=productService1.selectProduceServicebyClass_id(class_id ,internationalization);
            if (productService.size()==0){
                List<Goods> list=adminGoodsService.selectGoodsByClassifyId(class_id);
                if (list.size()==0){
                    jsonResult.setMsg("200");
                }else{
                for (Goods goods:list){
                    GoodsInternationalization goodsInternationalization= adminGoodsInternationalizationService.selectInsternationalzationByInternationalization(goods.getGoodsNumber(),internationalization);
                    if (goodsInternationalization==null){
                        jsonResult.setMsg("100");
                    }else{
                        productService1.insertProduceService(class_id, introduce, internationalization, goodsInternationalization.getImg_url(), goodsInternationalization.getId(),goodsInternationalization.getGoods_number());
                        jsonResult.setFlag(true);
                    }

                }
                }
            }
        } catch (Exception e) {
           jsonResult.setFlag(false);
            e.printStackTrace();
        }
        return jsonResult;
    }

    /**
     * 查询产品服务用于产品服务
     * @return
     */
    @RequestMapping(value = "/selectProduceService",method = RequestMethod.GET)
    @ResponseBody
    public ProductService  selectProduceService(int id,int internationalization){
        return productService1.selectProduceService(id, internationalization);
    }
    /**
     * 查询所有的产品服务
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "selectProduceServiceList",method = RequestMethod.GET)
    public OrderListPageDto<ProductService> selectProduceServiceAll(Integer page, Integer limit){
        Map<String,Object> map=new HashMap<>();
        OrderListPageDto<ProductService> productServiceList= productService1.selectProduceServiceAll(page,limit);

        return  productServiceList;
    }
    /**
     * 更新产品服务
     * @param introduce
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/updateProduceService",method = RequestMethod.GET)
    public JsonResult updateProduceService(String introduce,int id){
        JsonResult jsonResult=new JsonResult();
        try {
            boolean updateProduceService=productService1.updateProduceService(introduce, id);
            if (updateProduceService==true){
                jsonResult.setFlag(true);
                jsonResult.setMsg("100");
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonResult.setFlag(false);
        }
        return jsonResult;
    }

    /**
     * 删除产品服务
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteProduceService",method = RequestMethod.GET)
    public JsonResult deleteProduceService(int id){
        JsonResult jsonResult=new JsonResult();
            boolean deleteProduceService=productService1.deleteProduceService(id);

            if (deleteProduceService==true){
                jsonResult.setFlag(true);
                jsonResult.setMsg("100");
            }else{
                jsonResult.setFlag(false);
            }
        return jsonResult;
    }
}
