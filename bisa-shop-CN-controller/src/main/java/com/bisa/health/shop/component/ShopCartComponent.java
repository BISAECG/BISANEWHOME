package com.bisa.health.shop.component;

import com.bisa.health.client.entity.User;
import com.bisa.health.shiro.web.filter.CallLoginFilter;
import com.bisa.health.shiro.web.filter.ILoginSuccessCallBack;
import com.bisa.health.shop.dto.GoodsComboDto;
import com.bisa.health.shop.dto.GoodsShopcar;
import com.bisa.health.shop.dto.ShopCartDto;
import com.bisa.health.shop.enumerate.GoodsStatusEnum;
import com.bisa.health.shop.enumerate.GoodsTypeEnum;
import com.bisa.health.shop.model.Combo;
import com.bisa.health.shop.model.Goods;
import com.bisa.health.shop.service.IComboService;
import com.bisa.health.shop.service.IGoodsService;
import com.bisa.health.shop.utils.InternationalizationUtil;
import com.bisa.health.shop.utils.ShopCartCookieUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 购物车加载数据组件 通过service调取数据，用缓存分解数据库查询压力
 * 
 * @author Administrator
 */

@Component
public class ShopCartComponent implements InitializingBean {

	@Autowired
	private IGoodsService goodsService;
	@Autowired
	private IComboService comboService;
	@Autowired
	private RedisUtilComponent redisUtilComponent;

	@Autowired
	private CallLoginFilter callLoginFilter;

	private static final String BUYER_CART = "cart";

	/**
	 * 获取购物车下面的 所有(套餐)商品
	 * 
	 * @return
	 */
	public List<Object> getShopCartsDetailsByCartItems(List<GoodsShopcar> listGoodsShopCar, HttpSession session) {
		return loadShopGoodsDetails(listGoodsShopCar, session);
	}

	/**
	 * 加载购物车的明细
	 * 
	 * @param listGoodsShopCar
	 * @param session
	 * @return ShopCartDto, List<ShopCartDto>
	 */
	private List<Object> loadShopGoodsDetails(List<GoodsShopcar> listGoodsShopCar, HttpSession session) {

		// 获取当前语言类型
		String lang = InternationalizationUtil.getLang(session);

		if (listGoodsShopCar == null) {
			return null;
		}

		List<Object> shopCartDetails = new ArrayList<>();
		for (GoodsShopcar goodsShopcar : listGoodsShopCar) {
			if (goodsShopcar.getGoodsType() == GoodsTypeEnum.combo.getValue()) { // 套餐

				List<Combo> comboList = comboService.selectComboByGuid(goodsShopcar.getGoodsGuid(),lang);
				List<ShopCartDto> shopCartDtoList = new ArrayList<>();
				for (Combo combo : comboList) {

					GoodsComboDto goodsComboDto = new GoodsComboDto(combo);
					// 这里去判断商品的状态(就是有没有货)
					Goods goods = goodsService.selectGoodsByGoodsNumber(combo.getGoodsNumber(), lang);
					// 这里判断商品的状态
					if (goods.getStoreNumber() >= combo.getCount()) {
						goodsComboDto.setGoodsStatus(GoodsStatusEnum.in_sale.getValue());
					} else if (goods.getStoreNumber() < combo.getCount()
							|| goods.getGoodsStatus() == GoodsStatusEnum.sale_out.getValue()) {
						goodsComboDto.setGoodsStatus(GoodsStatusEnum.sale_out.getValue());
					} else if (goods.getGoodsStatus() == GoodsStatusEnum.invalid.getValue()) {
						goodsComboDto.setGoodsStatus(GoodsStatusEnum.invalid.getValue());
					}

					ShopCartDto shopCartDto = new ShopCartDto(goodsComboDto, goodsShopcar);
					shopCartDtoList.add(shopCartDto);
				}
				// 表示这个就是 套餐 的 分类对象 (包含多个商品的问题)
				shopCartDetails.add(shopCartDtoList);
			} else {
				// 表示这个就是单品的 分类对象
				Goods goods = goodsService.selectGoodsByGoodsNumber(goodsShopcar.getGoodsGuid(), lang);
				GoodsComboDto goodsComboDto = new GoodsComboDto(goods);

				// 这里判断商品的状态
				if (goods.getStoreNumber() >= goodsShopcar.getCount()) {
					goodsComboDto.setGoodsStatus(GoodsStatusEnum.in_sale.getValue());
				} else if (goods.getStoreNumber() < goodsShopcar.getCount()
						|| goods.getGoodsStatus() == GoodsStatusEnum.sale_out.getValue()) {
					goodsComboDto.setGoodsStatus(GoodsStatusEnum.sale_out.getValue());
				} else if (goods.getGoodsStatus() == GoodsStatusEnum.invalid.getValue()) {
					goodsComboDto.setGoodsStatus(GoodsStatusEnum.invalid.getValue());
				}

				ShopCartDto shopCartDto = new ShopCartDto(goodsComboDto, goodsShopcar);
				shopCartDetails.add(shopCartDto);
			}
		}
		return shopCartDetails;
	}

	/**
	 * 获取redis中保存的购物车数据
	 * 
	 * @param redisKey
	 * @return
	 */
	public List<GoodsShopcar> getListGoodsShopcarFromRedis(String redisKey) {
		List<GoodsShopcar> listGoodsShopCar = new ArrayList<GoodsShopcar>();

		if (redisUtilComponent.hasKey(redisKey)) { // cart:session-id

			GoodsShopcar goodsShopcar = null;
			long cartCount = redisUtilComponent.lGetListSize(redisKey);
			List<Object> goodsShopcarList = redisUtilComponent.lGet(redisKey, 0, cartCount - 1);
			for (int i = 0; i < goodsShopcarList.size(); i++) {

				goodsShopcar = (GoodsShopcar) goodsShopcarList.get(i);
				goodsShopcar.setId(i);
				listGoodsShopCar.add(goodsShopcar);
			}
			return listGoodsShopCar;
		} else {
			return null;
		}
	}

	/**
	 * 获取redis中保存的购物车数据（封装数据）
	 * 
	 * @param redisKey
	 * @param session
	 * @return
	 */
	public List<Object> getShopCartsFromRedis(String redisKey, HttpSession session) {

		List<GoodsShopcar> listGoodsShopCar = getListGoodsShopcarFromRedis(redisKey);
		if (listGoodsShopCar != null) {
			Collections.reverse(listGoodsShopCar); // 倒序
		}
		return loadShopGoodsDetails(listGoodsShopCar, session);
	}

	/**
	 * 从redis获取购物车数量
	 * 
	 * @param redisKey
	 * @return
	 */
	public Integer getCartCountFromRedis(String redisKey) {
		if (redisUtilComponent.hasKey(redisKey)) {
			return (int) redisUtilComponent.lGetListSize(redisKey);
		}
		return 0;
	}

	/**
	 * 添加或修改购物车数量
	 * 
	 * @param redisKey
	 * @param count
	 * @return
	 */
	public boolean addUpdateShopCartsInRedis(String redisKey, Integer goodsType, String goodsGuid, int count,
			int index) {
		GoodsShopcar goodsShopcar = null;
		try {
			if (redisUtilComponent.hasKey(redisKey)) {
				goodsShopcar = (GoodsShopcar) redisUtilComponent.lGetIndex(redisKey, index);

				if (goodsShopcar != null) { // 存在，修改数量
					goodsShopcar.setCount(count);// goodsShopcar.getCount() +
					return redisUtilComponent.lSetIndex(redisKey, goodsShopcar, index);
				}
			}
			// 索引不存在， 新增
			goodsShopcar = new GoodsShopcar(0, goodsType, goodsGuid, count);
			return redisUtilComponent.lSet(redisKey, goodsShopcar);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 合并cookie中购物车数据和redis中数据 无索引添加修改购物车数量
	 * 
	 * @param redisKey
	 * @param goodsType
	 *            商品/套餐
	 * @param goodsGuid
	 *            商品编号/套餐编号
	 * @param count
	 * @return
	 */
	public boolean addUpdateShopCartsInRedis(String redisKey, Integer goodsType, String goodsGuid, Integer count) {
		GoodsShopcar goodsShopcar = null;
		if (redisUtilComponent.hasKey(redisKey)) { // cart:session-id
			long cartCount = redisUtilComponent.lGetListSize(redisKey);
			List<Object> goodsShopcarList = redisUtilComponent.lGet(redisKey, 0, cartCount - 1);
			// 遍历redis中购物车数据，如果匹配， 修改数量
			for (int i = 0; i < goodsShopcarList.size(); i++) {
				goodsShopcar = (GoodsShopcar) goodsShopcarList.get(i);

				if (goodsShopcar.getGoodsType() != GoodsTypeEnum.combo.getValue()
						&& goodsShopcar.getGoodsGuid().equals(goodsGuid)) {
					goodsShopcar.setCount(goodsShopcar.getCount() + count);
					return redisUtilComponent.lSetIndex(redisKey, goodsShopcar, i);
				}
			}
		}

		// 没有匹配，添加购物车
		goodsShopcar = new GoodsShopcar(0, goodsType, goodsGuid, count);
		return redisUtilComponent.lSet(redisKey, goodsShopcar);
	}

	/**
	 * 删除购物车项，通过索引
	 * 
	 * @param redisKey
	 * @return
	 */
	public boolean deleteShopCartsInRedis(String redisKey, int index) {
		GoodsShopcar goodsShopcar = null;

		if (redisUtilComponent.hasKey(redisKey)) {
			goodsShopcar = (GoodsShopcar) redisUtilComponent.lGetIndex(redisKey, index);

			if (goodsShopcar != null) { // 存在，删除
				long result = redisUtilComponent.lRemove(redisKey, index, goodsShopcar);
				return result >= 1 ? true : false;
			}
		}
		return false;
	}

	/**
	 * 删除购物车项 通过classify id
	 * 
	 * @param redisKey
	 */
	public boolean deleteShopCartsByGoodsGuid(String redisKey, String goodsGuid) {

		GoodsShopcar goodsShopcar = null;

		if (redisUtilComponent.hasKey(redisKey)) { // cart:session-id
			long cartCount = redisUtilComponent.lGetListSize(redisKey);
			List<Object> goodsShopcarList = redisUtilComponent.lGet(redisKey, 0, cartCount - 1);
			// 遍历redis中购物车数据，如果匹配， 删除
			for (int i = 0; i < goodsShopcarList.size(); i++) {
				goodsShopcar = (GoodsShopcar) goodsShopcarList.get(i);

				if (goodsShopcar.getGoodsGuid().equals(goodsGuid)) {
					long result = redisUtilComponent.lRemove(redisKey, i, goodsShopcar);
					return result >= 1 ? true : false;
				}
			}
		}
		return false;
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		callLoginFilter.setLoginCall(new ILoginSuccessCallBack() {

			@Override
			public void success(HttpServletRequest request, HttpServletResponse response) {

				Subject subject = SecurityUtils.getSubject();
				if (null != subject && subject.isAuthenticated()) {// 判断是否登入

					User user = (User) subject.getSession().getAttribute(User.class.getName());

					String redisKey = BUYER_CART + ":" + user.getUser_guid();
					// 从cookie获取购物车数据
					List<GoodsShopcar> listGoodsShopCar;
					try {
						listGoodsShopCar = ShopCartCookieUtils.getBuyerCartCookies(request.getCookies(),BUYER_CART);
					} catch(Exception e) {
						return;
					}

					if (listGoodsShopCar == null) { // cookie无购物车数据
						return;
					} else {
						for (int i = 0; i < listGoodsShopCar.size(); i++) {
							GoodsShopcar goodShopcart = listGoodsShopCar.get(i);
							addUpdateShopCartsInRedis(redisKey, goodShopcart.getGoodsType(),
									goodShopcart.getGoodsGuid(), goodShopcart.getCount());
						}
						// 清空cookie中的购物车数据
						Cookie cookie = ShopCartCookieUtils.destroyCookie(BUYER_CART);
						response.addCookie(cookie);
					}
				}
			}
		});
	}
}
