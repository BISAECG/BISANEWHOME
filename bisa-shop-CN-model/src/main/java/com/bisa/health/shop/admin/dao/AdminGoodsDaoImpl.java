package com.bisa.health.shop.admin.dao;

import java.util.List;

import com.bisa.health.shop.dto.InternationalizationGoodsDto;
import org.springframework.stereotype.Repository;

import com.bisa.health.basic.dao.BaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.Goods;

@Repository
public class AdminGoodsDaoImpl extends BaseDao<Goods> implements IAdminGoodsDao {

    public Goods selectGoodsByGoodsNumber(String goods_number) {
        String sql = "SELECT * FROM h_goods WHERE goods_number = ?";
        return super.selectObjectBySql(sql, new Object[]{goods_number}, Goods.class);
    }

    @Override
    public List<Goods> selectGoodsByClassifyId(Integer classifyId) {
        String sql = "SELECT * FROM h_goods WHERE classify_id = ?";
        return super.listBySql(sql, new Object[]{classifyId}, Goods.class);
    }

    @Override
    public int addGoods(Goods goods) {
        String sql = "INSERT INTO h_goods(id, parent_id, classify_id, goods_name, goods_number, title, description,"
                + " goods_price, store_number, need_post, goods_status, putaway_time, soldout_time, sales_number, appraise_number, img_url)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return super.addBySql(sql, new Object[]{goods.getId(), goods.getParentId(), goods.getClassifyId(), goods.getGoodsName(), goods.getGoodsNumber(),
                goods.getTitle(), goods.getDescription(), goods.getGoodsPrice(), goods.getStoreNumber(), goods.getNeedPost(),
                goods.getGoodsStatus(), goods.getPutawayTime(), goods.getSoldoutTime(), goods.getSalesNumber(), goods.getAppraiseNumber(), goods.getImgUrl()});
    }

    @Override
    public int updateGoods(Goods goods) {
        String sql = "UPDATE h_goods SET parent_id=?, classify_id = ?, goods_name = ?, title = ?, description = ?,"
                + " goods_price = ?, store_number = ?, need_post = ?, goods_status = ?, soldout_time = ? WHERE goods_number = ?";
        return super.updateBySql(sql, new Object[]{goods.getParentId(), goods.getClassifyId(), goods.getGoodsName(), goods.getTitle(), goods.getDescription(),
                goods.getGoodsPrice(), goods.getStoreNumber(), goods.getNeedPost(), goods.getGoodsStatus(), goods.getSoldoutTime(), goods.getGoodsNumber()});
    }


    @Override
    public int updateGoodsImg(String url, String goodsNumber) {
        String sql = "UPDATE h_goods SET img_url = ? WHERE goods_number = ?";
        return super.updateBySql(sql, new Object[]{url, goodsNumber});
    }

    @Override
    public List<Goods> loadMainGoodsObject() {
        String sql = "SELECT * FROM h_goods WHERE parent_id = 0";
        return super.listBySql(sql, null, Goods.class);
    }

    @Override
    public List<Goods> loadGoodsList() {
        String sql = "SELECT * FROM h_goods";
        return super.listBySql(sql, null, Goods.class);
    }

    @Override
    public Goods getGoodsById(Integer mainProduct) {
        String sql = "SELECT * FROM h_goods WHERE id = ?";
        return super.queryObjectBySql(sql, new Object[]{mainProduct}, Goods.class);
    }

    @Override
    public Pager<Goods> selectPagerGoods() {
        String sql = "SELECT * FROM h_goods";
        return super.findBySql(sql, Goods.class, true);
    }

    @Override
    public Pager<Goods> selecGoodsByGoodsNumber(String incontent) {
        String sql = "SELECT * FROM h_goods where goods_number = ?";
        return super.findBySql(sql, new Object[]{incontent}, Goods.class, true);
    }

    @Override
    public Pager<Goods> selectGoodsByYear(String incontent) {
        String sql = "SELECT * FROM h_goods where date_format(putaway_time,'%Y') = ?";
        return super.findBySql(sql, new Object[]{incontent}, Goods.class, true);
    }

    @Override
    public Pager<Goods> selectGoodsByYearMonth(String incontent) {
        String sql = "SELECT * FROM h_goods where date_format(putaway_time,'%Y-%m') = ?";
        return super.findBySql(sql, new Object[]{incontent}, Goods.class, true);
    }

    @Override
    public Pager<Goods> selectGoodsByYearMonthDay(String incontent) {
        String sql = "SELECT * FROM h_goods where date_format(putaway_time,'%Y-%m-%d') = ?";
        return super.findBySql(sql, new Object[]{incontent}, Goods.class, true);
    }

    @Override
    public Pager<Goods> getGoodsByGoodsStatus(int value) {
        String sql = "SELECT * FROM h_goods where goods_status = ?";
        return super.findBySql(sql, new Object[]{value}, Goods.class, true);
    }

    @Override
    public Pager<Goods> getGoodsByNeedPostTpye(int value) {
        String sql = "SELECT * FROM h_goods where need_post = ?";
        return super.findBySql(sql, new Object[]{value}, Goods.class, true);
    }
    @Override
    public int deleteGoodsByGoosNumber(String goods_number) {
        String sql = "DELETE FROM h_goods WHERE goods_number= ?";
        return super.deleteBySql(sql, new Object[]{goods_number});
    }
    @Override
    public List<InternationalizationGoodsDto> selectGoodsByService(Integer internationalization) {
        String sql = "select s.classify_id as 'classifyId',s.goods_number as 'goodsNumber',s.goods_price as 'goodsPrice',s.need_post as 'needPost',s.store_number as 'storeNumber',s.parent_id as 'parentId',IFNULL(i.title,s.title) as 'title',IFNULL(i.description,s.description) as 'description', " +
                "IFNULL(i.img_url,s.img_url) 'imgUrl',IFNULL(i.goods_name,s.goods_name)  'goodsName'  FROM h_goods  s " +
                "INNER JOIN h_goods_internationalization  i on i.goods_number = s.goods_number " +
                "where (s.classify_id=10 OR s.classify_id=11) and i.internationalization=? and s.goods_status=1 and s.parent_id!=0";
        return super.listBySql(sql, new Object[]{internationalization}, InternationalizationGoodsDto.class,false);
    }

    @Override
    public List<InternationalizationGoodsDto> selectGoodsBygoodsGuid(String goodsGuid, Integer internationalization) {
        String sql = "select s.classify_id as 'classifyId',s.goods_number as 'goodsNumber',s.goods_price as 'goodsPrice',s.need_post as 'needPost',s.store_number as 'storeNumber',s.parent_id as 'parentId',IFNULL(i.title,s.title) as 'title',IFNULL(i.description,s.description) as 'description', " +
                "IFNULL(i.img_url,s.img_url) 'imgUrl',IFNULL(i.goodh_name,s.goods_name)  'goodsName'  FROM h_goods  s " +
                "INNER JOIN h_goods_internationalization  i on i.goods_number = s.goods_number " +
                "where s.goods_number = ? and i.internationalization=? ";
            return super.listBySql(sql, new Object[]{goodsGuid,internationalization}, InternationalizationGoodsDto.class,false);
    }
}
