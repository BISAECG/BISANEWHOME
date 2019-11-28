package com.bisa.health.shop.enumerate;

/**
 * 商品状态
 * @author Administrator
 */
public enum OrderStatusEnum {
	
	UNSHIPPED(0),//未发货
	DELIVERRY(1),//已发货
	CANCEL(2),//退货
	EXCHANGE(3);//换货
    private int value;

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

	private OrderStatusEnum(int value) {
		this.value = value;
	}


}
