package com.bisa.health.shop.service;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.shop.admin.dto.PageJsonDto;
import com.bisa.health.shop.dao.IHtmlInfoDao;
import com.bisa.health.shop.model.HtmlInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@CacheConfig(cacheNames = "HtmlInfoServiceImpl")
public class HtmlInfoServiceImpl implements IHtmlInfoService{


    @Autowired
    private IHtmlInfoDao iAdminHtmlInfoDao;

    @Override
    public HtmlInfo addHtmlInfo(HtmlInfo htmlInfo) {
        return iAdminHtmlInfoDao.addHtmlInfo(htmlInfo);
    }

    @Override
    public HtmlInfo updateHtmlInfo(HtmlInfo htmlInfo) {
        return iAdminHtmlInfoDao.updateHtmlInfo(htmlInfo);
    }

    @Override
    public PageJsonDto<HtmlInfo> selectHtmlInfoList(Integer page, Integer limit) {
        SystemContext.setPageOffset((page - 1) * limit);
        SystemContext.setPageSize(limit);
        SystemContext.setSort("update_time"); // 默认按订单时间倒序
        SystemContext.setOrder("desc");
        Pager<HtmlInfo> pagerOrder=iAdminHtmlInfoDao.selectHtmlInfoList();
        PageJsonDto<HtmlInfo> listPageDto = new PageJsonDto<>();
        listPageDto.setCode(0);
        listPageDto.setMsg("''");
        listPageDto.setCount(pagerOrder.getTotal());
        listPageDto.setData(pagerOrder.getDatas());
        return listPageDto;
    }
    @Override
    public HtmlInfo selectHtmlInfoById(Integer id) {
        return iAdminHtmlInfoDao.selectHtmlInfoById(id);
    }

    @Override
    public Boolean delectHtmlInfoById(Integer id) {
        return iAdminHtmlInfoDao.delectHtmlInfoById(id);
    }

    @Override
    public List<HtmlInfo> selectHtmlInfo() {
        return iAdminHtmlInfoDao.selectHtmlInfo();
    }
}
