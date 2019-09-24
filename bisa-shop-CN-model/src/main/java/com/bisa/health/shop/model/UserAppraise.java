package com.bisa.health.shop.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 用户评价model
 */
@Entity
@Table(name = "h_user_appraise")
public class UserAppraise implements Serializable {

    private Integer id;
    private Integer userGuid;        //评价人id
    private String goodsNumber; //商品编号

    private String username;  //用户名或昵称（匿名）
    private String userAvator;  //用户头像

    private String appraiseOne;    //初次评价内容
    private String appraiseTwo;    //追评内容
    private Integer appraiseDegree; //评价等级

    private Date appraiseOneTime; //初次评价时间
    private Date appraiseTwoTime; //追评时间

    private String reply;  //后台人员回复
    private Integer replyUserGuid;  //后台人员id
    private Date replyTime;  //回复时间

    @Id
    @GeneratedValue
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "user_guid")
    public Integer getUserGuid() {
        return userGuid;
    }

    public void setUserGuid(Integer userGuid) {
        this.userGuid = userGuid;
    }

    @Column(name = "goods_number")
    public String getGoodsNumber() {
        return goodsNumber;
    }

    public void setGoodsNumber(String goodsNumber) {
        this.goodsNumber = goodsNumber;
    }

    @Column(name = "appraise_one")
    public String getAppraiseOne() {
        return appraiseOne;
    }

    public void setAppraiseOne(String appraiseOne) {
        this.appraiseOne = appraiseOne;
    }

    @Column(name = "appraise_two")
    public String getAppraiseTwo() {
        return appraiseTwo;
    }

    public void setAppraiseTwo(String appraiseTwo) {
        this.appraiseTwo = appraiseTwo;
    }

    @Column(name = "appraise_degree")
    public Integer getAppraiseDegree() {
        return appraiseDegree;
    }

    public void setAppraiseDegree(Integer appraiseDegree) {
        this.appraiseDegree = appraiseDegree;
    }

    @Column(name = "appraise_one_time")
    public Date getAppraiseOneTime() {
        return appraiseOneTime;
    }

    public void setAppraiseOneTime(Date appraiseOneTime) {
        this.appraiseOneTime = appraiseOneTime;
    }

    @Column(name = "appraise_two_time")
    public Date getAppraiseTwoTime() {
        return appraiseTwoTime;
    }

    public void setAppraiseTwoTime(Date appraiseTwoTime) {
        this.appraiseTwoTime = appraiseTwoTime;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    @Column(name = "reply_user_guid")
    public Integer getReplyUserGuid() {
        return replyUserGuid;
    }

    public void setReplyUserGuid(Integer replyUserGuid) {
        this.replyUserGuid = replyUserGuid;
    }

    @Column(name = "reply_time")
    public Date getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(Date replyTime) {
        this.replyTime = replyTime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Column(name = "user_avator")
    public String getUserAvator() {
        return userAvator;
    }

    public void setUserAvator(String userAvator) {
        this.userAvator = userAvator;
    }


    public UserAppraise() {
        super();
    }

    public UserAppraise(Integer id, Integer userGuid, String goodsNumber, String username, String userAvator,
                        String appraiseOne, String appraiseTwo, Integer appraiseDegree, Date appraiseOneTime, Date appraiseTwoTime,
                        String reply, Integer replyUserGuid, Date replyTime) {
        super();
        this.id = id;
        this.userGuid = userGuid;
        this.goodsNumber = goodsNumber;
        this.username = username;
        this.userAvator = userAvator;
        this.appraiseOne = appraiseOne;
        this.appraiseTwo = appraiseTwo;
        this.appraiseDegree = appraiseDegree;
        this.appraiseOneTime = appraiseOneTime;
        this.appraiseTwoTime = appraiseTwoTime;
        this.reply = reply;
        this.replyUserGuid = replyUserGuid;
        this.replyTime = replyTime;
    }

    @Override
    public String toString() {
        return "UserAppraise [id=" + id + ", userGuid=" + userGuid + ", goodsNumber=" + goodsNumber + ", username="
                + username + ", userAvator=" + userAvator + ", appraiseOne=" + appraiseOne + ", appraiseTwo="
                + appraiseTwo + ", appraiseDegree=" + appraiseDegree + ", appraiseOneTime=" + appraiseOneTime
                + ", appraiseTwoTime=" + appraiseTwoTime + ", reply=" + reply + ", replyUserGuid=" + replyUserGuid
                + ", replyTime=" + replyTime + "]";
    }

}