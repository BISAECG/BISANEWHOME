package com.bisa.health.shop.dao;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.shop.model.Combo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ComboDaoImpl extends BaseDao<Combo> implements IComboDao {

    @Override
    public List<Combo> selectComboByGuid(String comboGuid, Integer lang) {
        String sql = "SELECT s.classify_id,s.combo_guid,s.count,s.discount_price,i.goods_name,s.goods_number,s.goods_price,s.id,s.img_url,s.need_post FROM h_combo s INNER JOIN h_goods_internationalization i on i.goods_number=s.goods_number WHERE combo_guid = ? and i.internationalization = ?";
        return super.listBySql(sql, new Object[]{comboGuid,lang}, Combo.class);
    }

}
