package com.bisa.health.shop.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name="s_news_inlink")
public class NewsInLink implements Serializable {
    private static final long serialVersionUID = -3392514471944951046L;
    private int id;

    private String inner_chain_text_CN; //内链中文文本
    private String inner_chain_text_EN; //内链英文文本
    private String inner_chain_text_HK; //内链繁体文本
    private String inner_chain_url; //内链路径
    private Date creation_time;     //创建时间

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    @Column(name = "inner_chain_url")
    public String getInner_chain_url() {
        return inner_chain_url;
    }

    public void setInner_chain_url(String inner_chain_url) {
        this.inner_chain_url = inner_chain_url;
    }

    @Column(name = "creation_time")
    public Date getCreation_time() {
        return creation_time;
    }

    public void setCreation_time(Date creation_time) {
        this.creation_time = creation_time;
    }



    @Column(name = "inner_chain_text_CN")
    public String getInner_chain_text_CN() {
        return inner_chain_text_CN;
    }

    public void setInner_chain_text_CN(String inner_chain_text_CN) {
        this.inner_chain_text_CN = inner_chain_text_CN;
    }
    @Column(name = "inner_chain_text_EN")
    public String getInner_chain_text_EN() {
        return inner_chain_text_EN;
    }

    public void setInner_chain_text_EN(String inner_chain_text_EN) {
        this.inner_chain_text_EN = inner_chain_text_EN;
    }
    @Column(name = "inner_chain_text_HK")
    public String getInner_chain_text_HK() {
        return inner_chain_text_HK;
    }

    public void setInner_chain_text_HK(String inner_chain_text_HK) {
        this.inner_chain_text_HK = inner_chain_text_HK;
    }

    public NewsInLink() {
    }

    public NewsInLink(int id, String inner_chain_text_CN, String inner_chain_text_EN, String inner_chain_text_HK, String inner_chain_url, Date creation_time) {
        this.id = id;
        this.inner_chain_text_CN = inner_chain_text_CN;
        this.inner_chain_text_EN = inner_chain_text_EN;
        this.inner_chain_text_HK = inner_chain_text_HK;
        this.inner_chain_url = inner_chain_url;
        this.creation_time = creation_time;
    }

    @Override
    public String toString() {
        return "NewsInnerChain{" +
                "id=" + id +
                ", inner_chain_text_CN='" + inner_chain_text_CN + '\'' +
                ", inner_chain_text_EN='" + inner_chain_text_EN + '\'' +
                ", inner_chain_text_HK='" + inner_chain_text_HK + '\'' +
                ", inner_chain_url='" + inner_chain_url + '\'' +
                ", creation_time='" + creation_time + '\'' +
                '}';
    }
}
