package com.bisa.health.shop.enumerate;

/**
 * 国际化 类型语言
 * @author Administrator
 */

public enum InternationalizationEnum {

    /**
     * 中文简体
     */
    zh_CN(1, "zh_CN", "简体"),
    /**
     * 中文繁体
     */
    zh_HK(2, "zh_HK", "繁体"),
    /**
     * 英文
     */
    en_US(3, "en_US", "英文");

    private int value;
    private String name;
    private String msg;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

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

    private InternationalizationEnum(int value, String name, String msg) {
        this.value = value;
        this.name = name;
        this.msg = msg;
    }

    public static InternationalizationEnum getByValue(int value) {
        for (InternationalizationEnum status : values()) {
            if (status.getValue() == value) {
                return status;
            }
        }
        return null;
    }

}
