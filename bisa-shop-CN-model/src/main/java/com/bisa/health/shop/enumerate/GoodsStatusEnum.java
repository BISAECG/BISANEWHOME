package com.bisa.health.shop.enumerate;

/**
 * 商品状态
 * @author Administrator
 */
public enum GoodsStatusEnum {

    /**
     * 售罄0
     */
    sale_out(0, "sale_out"),
    /**
     * 销售中
     */
    in_sale(1, "in_sale"),
    /**
     * 下架
     */
    invalid(2, "invalid");

    private int value;
    private String name;

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private GoodsStatusEnum(int value, String name) {
        this.value = value;
        this.name = name;
    }

    public static GoodsStatusEnum getByValue(int value) {
        for (GoodsStatusEnum status : values()) {
            if (status.getValue() == value) {
                return status;
            }
        }
        return null;
    }

}
