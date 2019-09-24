package com.bisa.health.shop.model;

import com.bisa.health.shop.enumerate.GoodsClassify;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


/**
 * 服务激活卡使用记录
 */

@Entity
@Table(name = "h_service_card_record", indexes = {@Index(columnList = "user_guid")})
public class ServiceCardRecord implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
    private Integer userGuid; // 拥有者的user_guid
    private String cardName; // 卡名称
    private String cardNumber; // BHA+年月日+递增+CN，共20位，如"BISA20180810100000CN"
    private String activeCode; // 激活码8位 随机数字
    private GoodsClassify cardType; // 卡类型（次数型；时限型）
    private String goodsNumber; // 商品编号（24小时报告；悉心铃）
    private String goodsUrl; // 商品图片(这里是个冗余字段，看分页信息的方便点)

    private Integer count; // （激活卡面值）次数/月份
    private String account;// 激活账号（服务使用者的账号，手机号或邮箱）
    private Date activeTime; // 使用时间，激活时间
    private Date createTime; // 创建时间，购买时间
    private Integer cardStatus; // 是否使用；0-未使用；1-已使用（已激活）
    private Integer orderGoodsId; // 关联订单详情及激活卡， 便于售后处理
    private int version;
    private String serviceToken; //服务编码(用于激活服务）

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

    @Column(name = "card_name")
    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    @Column(name = "card_number")
    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    @Column(name = "active_code")
    public String getActiveCode() {
        return activeCode;
    }

    public void setActiveCode(String activeCode) {
        this.activeCode = activeCode;
    }
   

    @Enumerated(EnumType.STRING)
    @Column(name = "card_type")
    public GoodsClassify getCardType() {
		return cardType;
	}

	public void setCardType(GoodsClassify cardType) {
		this.cardType = cardType;
	}

	 public Integer getCount() {
	        return count;
	 }
	 
	public void setCount(Integer count) {
        this.count = count;
    }
	

    @Column(name = "account")
    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    @Column(name = "active_time")
    public Date getActiveTime() {
        return activeTime;
    }

    public void setActiveTime(Date activeTime) {
        this.activeTime = activeTime;
    }

    @Column(name = "create_time")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Column(name = "goods_url")
    public String getGoodsUrl() {
        return goodsUrl;
    }

    public void setGoodsUrl(String goodsUrl) {
        this.goodsUrl = goodsUrl;
    }

    @Column(name = "card_status")
    public Integer getCardStatus() {
        return cardStatus;
    }

    public void setCardStatus(Integer cardStatus) {
        this.cardStatus = cardStatus;
    }

    @Column(name = "order_goods_id")
    public Integer getOrderGoodsId() {
        return orderGoodsId;
    }

    public void setOrderGoodsId(Integer orderGoodsId) {
        this.orderGoodsId = orderGoodsId;
    }

    @Column(name = "goods_number")
    public String getGoodsNumber() {
        return goodsNumber;
    }

    public void setGoodsNumber(String goodsNumber) {
        this.goodsNumber = goodsNumber;
    }

    @Column(name = "service_token")
    public String getServiceToken() {
        return serviceToken;
    }

    public void setServiceToken(String serviceToken) {
        this.serviceToken = serviceToken;
    }
    @Version
    public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public ServiceCardRecord() {
        super();
    }

    public ServiceCardRecord(Integer id, Integer userGuid, String cardName, String cardNumber, String activeCode, GoodsClassify cardType, String goodsNumber, String goodsUrl, Integer count, String account, Date activeTime, Date createTime, Integer cardStatus, Integer orderGoodsId, String serviceToken) {
        this.id = id;
        this.userGuid = userGuid;
        this.cardName = cardName;
        this.cardNumber = cardNumber;
        this.activeCode = activeCode;
        this.cardType = cardType;
        this.goodsNumber = goodsNumber;
        this.goodsUrl = goodsUrl;
        this.count = count;
        this.account = account;
        this.activeTime = activeTime;
        this.createTime = createTime;
        this.cardStatus = cardStatus;
        this.orderGoodsId = orderGoodsId;
        this.serviceToken = serviceToken;
    }

    @Override
    public String toString() {
        return "ServiceCardRecord{" +
                "id=" + id +
                ", userGuid=" + userGuid +
                ", cardName='" + cardName + '\'' +
                ", cardNumber='" + cardNumber + '\'' +
                ", activeCode='" + activeCode + '\'' +
                ", cardType=" + cardType +
                ", goodsNumber='" + goodsNumber + '\'' +
                ", goodsUrl='" + goodsUrl + '\'' +
                ", count=" + count +
                ", account='" + account + '\'' +
                ", activeTime=" + activeTime +
                ", createTime=" + createTime +
                ", cardStatus=" + cardStatus +
                ", orderGoodsId=" + orderGoodsId +
                ", serviceToken='" + serviceToken + '\'' +
                '}';
    }
}
