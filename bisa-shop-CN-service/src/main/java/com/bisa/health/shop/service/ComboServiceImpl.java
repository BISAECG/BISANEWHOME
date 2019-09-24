package com.bisa.health.shop.service;

import com.bisa.health.shop.dao.IComboDao;
import com.bisa.health.shop.enumerate.InternationalizationEnum;
import com.bisa.health.shop.model.Combo;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
@CacheConfig(cacheNames = "ComboServiceImpl")
public class ComboServiceImpl implements IComboService {

    @Resource
    private IComboDao comboDao;

    @Override
    @Cacheable(key = "targetClass.name+methodName+#comboGuid+#lang")
    public List<Combo> selectComboByGuid(String comboGuid, String lang) {
        List<Combo> comboList = null;
        if (InternationalizationEnum.zh_CN.getName().equals(lang)) {
            //简体
            comboList = comboDao.selectComboByGuid(comboGuid, InternationalizationEnum.zh_CN.getValue());
        } else if (InternationalizationEnum.en_US.getName().equals(lang)) {
            //英文
            comboList = comboDao.selectComboByGuid(comboGuid, InternationalizationEnum.en_US.getValue());
            System.out.println(InternationalizationEnum.en_US);
        } else if(InternationalizationEnum.zh_HK.getName().equals(lang)){
            //繁体
            comboList = comboDao.selectComboByGuid(comboGuid, InternationalizationEnum.zh_HK.getValue());
        }
        return comboList;
    }

}
