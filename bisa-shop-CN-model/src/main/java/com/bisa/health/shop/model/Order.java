package com.bisa.health.shop.model;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 订单model
 */
@Entity
@Table(name = "h_order")
public class Order implements Serializable {

    private static final long serialVersionUID = -2150540282786645128L;

    private Integer id;
    private String order_no;         //订单号
    private Integer user_id;         //买家id
    private String consignee;         // 收货人名字
    private String phone;            // 收货人手机号码
    private String detail_address;   // 详细地址

    private Integer tra_status;         //交易状态（0:取消，1：未支付，2：待发货，3：待收货  4:待评价  5：待追评
    private Integer pay_type;         //枚举类PayType  1 微信  2 支付宝  3 银联  4visa
    private Date pay_time;             //支付时间
    private Date deliver_goods_time; //发货时间
    private Date receive_goods_time; //收货时间

    private Integer after_sale_apply; //1 可以申请售后, 2  售后处理中
    private BigDecimal total_price;         //订单商品总价(不包含 邮费的价格) 2000
    private BigDecimal post_price;         //邮费                          			 100

    private BigDecimal preferential_price; //优惠价格         			 （优惠了100)
    private BigDecimal actual_payment;      //实际 付款价格				2000

    private String logistics_number; //物流单号
    private String logistics_name;     //物流公司名
    private String logisticsAccount;     //物流公司付费账号
    private Date create_time;         //订单创建时间

    private String orderEmail;        //发送账单邮箱
    private String payment_id; //賬單編號(这个是银联支付要的字段)
    
    
    @Id
    @GeneratedValue
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDetail_address() {
        return detail_address;
    }

    public void setDetail_address(String detail_address) {
        this.detail_address = detail_address;
    }

    public BigDecimal getActual_payment() {
        return actual_payment;
    }

    public void setActual_payment(BigDecimal actual_payment) {
        this.actual_payment = actual_payment;
    }

    public Date getPay_time() {
        return pay_time;
    }

    public void setPay_time(Date pay_time) {
        this.pay_time = pay_time;
    }

    public Date getDeliver_goods_time() {
        return deliver_goods_time;
    }

    public void setDeliver_goods_time(Date deliver_goods_time) {
        this.deliver_goods_time = deliver_goods_time;
    }

    public Date getReceive_goods_time() {
        return receive_goods_time;
    }

    public void setReceive_goods_time(Date receive_goods_time) {
        this.receive_goods_time = receive_goods_time;
    }

    public BigDecimal getTotal_price() {
        return total_price;
    }

    public void setTotal_price(BigDecimal total_price) {
        this.total_price = total_price;
    }

    public BigDecimal getPreferential_price() {
        return preferential_price;
    }

    public void setPreferential_price(BigDecimal preferential_price) {
        this.preferential_price = preferential_price;
    }

    public BigDecimal getPost_price() {
        return post_price;
    }

    public void setPost_price(BigDecimal post_price) {
        this.post_price = post_price;
    }

    public String getLogistics_number() {
        return logistics_number;
    }

    public void setLogistics_number(String logistics_number) {
        this.logistics_number = logistics_number;
    }

    public String getLogistics_name() {
        return logistics_name;
    }

    public void setLogistics_name(String logistics_name) {
        this.logistics_name = logistics_name;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Integer getTra_status() {
        return tra_status;
    }

    public void setTra_status(Integer tra_status) {
        this.tra_status = tra_status;
    }

    public Integer getPay_type() {
        return pay_type;
    }

    public void setPay_type(Integer pay_type) {
        this.pay_type = pay_type;
    }

    public Integer getAfter_sale_apply() {
        return after_sale_apply;
    }

    public void setAfter_sale_apply(Integer after_sale_apply) {
        this.after_sale_apply = after_sale_apply;
    }

    @Column(name = "order_email")
    public String getOrderEmail() {
        return orderEmail;
    }

    public void setOrderEmail(String orderEmail) {
        this.orderEmail = orderEmail;
    }

    @Column(name = "logistics_account")
    public String getLogisticsAccount() {
        return logisticsAccount;
    }

    public void setLogisticsAccount(String logisticsAccount) {
        this.logisticsAccount = logisticsAccount;
    }

    public String getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(String payment_id) {
        this.payment_id = payment_id;
    }
    

	public Order() {
        super();
    }

    public Order(Integer id, String order_no, Integer user_id, String consignee, String phone, String detail_address,
                 Integer tra_status, Integer pay_type, Date pay_time, Date deliver_goods_time, Date receive_goods_time,
                 Integer after_sale_apply, BigDecimal total_price, BigDecimal post_price, BigDecimal preferential_price,
                 BigDecimal actual_payment, String logistics_number, String logistics_name, String logisticsAccount,
                 Date create_time, String orderEmail, String payment_id) {
        super();
        this.id = id;
        this.order_no = order_no;
        this.user_id = user_id;
        this.consignee = consignee;
        this.phone = phone;
        this.detail_address = detail_address;
        this.tra_status = tra_status;
        this.pay_type = pay_type;
        this.pay_time = pay_time;
        this.deliver_goods_time = deliver_goods_time;
        this.receive_goods_time = receive_goods_time;
        this.after_sale_apply = after_sale_apply;
        this.total_price = total_price;
        this.post_price = post_price;
        this.preferential_price = preferential_price;
        this.actual_payment = actual_payment;
        this.logistics_number = logistics_number;
        this.logistics_name = logistics_name;
        this.logisticsAccount = logisticsAccount;
        this.create_time = create_time;
        this.orderEmail = orderEmail;
        this.payment_id = payment_id;
    }

    @Override
    public String toString() {
        return "Order [id=" + id + ", order_no=" + order_no + ", user_id=" + user_id + ", consignee=" + consignee
                + ", phone=" + phone + ", detail_address=" + detail_address + ", tra_status=" + tra_status
                + ", pay_type=" + pay_type + ", pay_time=" + pay_time + ", deliver_goods_time=" + deliver_goods_time
                + ", receive_goods_time=" + receive_goods_time + ", after_sale_apply=" + after_sale_apply
                + ", total_price=" + total_price + ", post_price=" + post_price + ", preferential_price="
                + preferential_price + ", actual_payment=" + actual_payment + ", logistics_number=" + logistics_number
                + ", logistics_name=" + logistics_name + ", logisticsAccount=" + logisticsAccount + ", create_time="
                + create_time + ", orderEmail=" + orderEmail + ", payment_id=" + payment_id + "]";
    }


}