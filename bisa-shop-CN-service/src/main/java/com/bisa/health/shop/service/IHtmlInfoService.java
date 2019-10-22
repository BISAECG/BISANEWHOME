package com.bisa.health.shop.service;
import com.bisa.health.shop.admin.dto.PageJsonDto;
import com.bisa.health.shop.model.HtmlInfo;

import java.util.List;

public interface IHtmlInfoService {
    /**
     * 添加页面信息
     * @param htmlInfo
     * @return
     */
	HtmlInfo addHtmlInfo(HtmlInfo htmlInfo);
    /**
     * 修改页面信息
     * @param htmlInfo
     * @return
     */
	HtmlInfo updateHtmlInfo(HtmlInfo htmlInfo);

    /**
     * 查询所有页面信息
     * @return
     */
	PageJsonDto<HtmlInfo> selectHtmlInfoList(Integer page, Integer limit);
    /**
     * 根据id查询网页信息
     * @param id
     * @return
     */
    HtmlInfo selectHtmlInfoById(Integer id);

    /**
     * 根据删除网页信息
     * @param id
     * @return
     */
    Boolean delectHtmlInfoById(Integer id);
    /**
     * 查询所有页面信息
     * @return
     */
    List<HtmlInfo> selectHtmlInfo();
}
