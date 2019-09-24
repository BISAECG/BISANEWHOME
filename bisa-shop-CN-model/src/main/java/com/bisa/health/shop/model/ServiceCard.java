package com.bisa.health.shop.model;


import com.bisa.health.shop.enumerate.GoodsClassify;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 服务激活卡model
 */

@Entity
@Table(name = "h_service_card", indexes = {@Index(columnList = "card_number")})
public class ServiceCard implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
    private String cardName; //卡名称
    private String cardNumber; //BHA+年月日+递增+CN，共20位，如"BISA20180810100000CN"
    private String activeCode; //激活码8位  随机数字
    private String goodsNumber;  //商品编码（用于订单关联卡）
    private GoodsClassify cardType; //卡类型（次数型；时限型）

    
    @Version
    private int version;
    private String serviceToken; //服务编码(用于激活服务）
    private int count; //（面值）次数/月份
    private int cardStatus; //是否使用；0-未使用；1-已使用
    private int createrUserId;    //创建人Id
    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    @Column(name = "card_status")
    public int getCardStatus() {
        return cardStatus;
    }

    public void setCardStatus(int cardStatus) {
        this.cardStatus = cardStatus;
    }
    @Column(name = "creater_userId")
    public int getCreaterUserId() {
        return createrUserId;
    }

    public void setCreaterUserId(int createrUserId) {
        this.createrUserId = createrUserId;
    }

    public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	@Column(name = "count")
    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Column(name = "card_name")
    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    @Enumerated(EnumType.STRING)
    @Column(name = "card_type")
    public GoodsClassify getCardType() {
		return cardType;
	}

	public void setCardType(GoodsClassify cardType) {
		this.cardType = cardType;
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

    public ServiceCard() {
        super();
    }

	public ServiceCard(String cardName, String cardNumber, String activeCode, String goodsNumber, GoodsClassify cardType,
			int version, String serviceToken, int count, int cardStatus,int createrUserId) {
		super();
		this.cardName = cardName;
		this.cardNumber = cardNumber;
		this.activeCode = activeCode;
		this.goodsNumber = goodsNumber;
		this.cardType = cardType;
		this.version = version;
		this.serviceToken = serviceToken;
		this.count = count;
		this.cardStatus = cardStatus;
		this.createrUserId = createrUserId;
	}

	@Override
	public String toString() {
		return "ServiceCard [id=" + id + ", cardName=" + cardName + ", cardNumber=" + cardNumber + ", activeCode="
				+ activeCode + ", goodsNumber=" + goodsNumber + ", cardType=" + cardType + ", version=" + version
				+ ", serviceToken=" + serviceToken + ", count=" + count + ", cardStatus=" + cardStatus + ",createrUserId="+createrUserId+"]";
	}

    

}
