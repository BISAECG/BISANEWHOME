package com.bisa.health.shop.dao;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.shop.model.Goods;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class GoodsDaoImpl extends BaseDao<Goods> implements IGoodsDao {

    public Goods selectGoodsByGoodsNumber(String goods_number) {
        String sql = "SELECT * FROM h_goods WHERE goods_number = ?";
        return super.selectObjectBySql(sql, new Object[]{goods_number}, Goods.class);
    }

    @Override
    public int updateAppraiseNumber(Goods goods) {
        String sql = "UPDATE h_goods SET appraise_number = ? WHERE id = ?";
        return super.updateBySql(sql, new Object[]{goods.getAppraiseNumber(), goods.getId()});
    }

    @Override
    public List<Goods> listChildrenGoods(Integer id) {
        String sql = "SELECT * FROM h_goods WHERE parent_id = ? and goods_status !=2";
        return super.listBySql(sql, new Object[]{id}, Goods.class);
    }

    @Override
    public Goods SelectGoodsById(int id) {
        String sql = "SELECT * FROM h_goods WHERE id = ?";
        return super.queryObjectBySql(sql, new Object[]{id}, Goods.class);
    }

    @Override
    public boolean updateGoodsStoreAndSalesNumber(String goods_number_id, Integer count) {
        String sql = "UPDATE h_goods SET store_number = store_number - ?,sales_number = sales_number + ? WHERE goods_number = ?";
        int result = super.updateBySql(sql, new Object[]{count, count, goods_number_id});
        return result >= 1 ? true : false;
    }
    
    @Override
    public int updateGoodsStatus(String goodsNumber, int value) {
        String sql = "UPDATE h_goods SET goods_status = ? WHERE goods_number = ?";
        return super.updateBySql(sql, new Object[]{value, goodsNumber});
    }

}
