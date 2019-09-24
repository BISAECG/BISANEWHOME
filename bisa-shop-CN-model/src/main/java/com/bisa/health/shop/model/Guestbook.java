package com.bisa.health.shop.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 留言model
 */

@Entity
@Table(name = "h_guestbook")
public class Guestbook implements Serializable {

    private int id;                //	主键ID
    private String name;           //	24	姓名
    private String phone;          //	20	手机号/座机号
    private String mail;           //	50	邮箱
    private String title;          //	40	主题

    private int message_type;      //		留言类型（1-商品咨询；2-服务咨询；3-售后；4-账户异常；5-无关项）由留言处理人标注
    private String message;        //		留言内容
    private String message_time;   //	50	留言时间
    private int handle_way;        //		处理方式（1-邮箱；2-短信；3-通话）
    private String handle_time;    //	50	处理时间
    private int handle_status;     //		处理状态(1-待处理；2-处理完毕）
    private String reply_content;  //		回复内容
    private String reply_name;     //	36	回复人用户名

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(length = 24, nullable = false)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(length = 20, nullable = false)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Column(length = 50, nullable = false)
    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    @Column(length = 40)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getMessage_type() {
        return message_type;
    }

    public void setMessage_type(int message_type) {
        this.message_type = message_type;
    }

    @Column(nullable = false)
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Column(length = 50)
    public String getMessage_time() {
        return message_time;
    }

    public void setMessage_time(String message_time) {
        this.message_time = message_time;
    }

    public int getHandle_way() {
        return handle_way;
    }

    public void setHandle_way(int handle_way) {
        this.handle_way = handle_way;
    }

    @Column(length = 50)
    public String getHandle_time() {
        return handle_time;
    }

    public void setHandle_time(String handle_time) {
        this.handle_time = handle_time;
    }

    public int getHandle_status() {
        return handle_status;
    }

    public void setHandle_status(int handle_status) {
        this.handle_status = handle_status;
    }

    public String getReply_content() {
        return reply_content;
    }

    public void setReply_content(String reply_content) {
        this.reply_content = reply_content;
    }

    @Column(length = 36)
    public String getReply_name() {
        return reply_name;
    }

    public void setReply_name(String reply_name) {
        this.reply_name = reply_name;
    }

    public Guestbook() {
        super();
    }

    public Guestbook(int id, String name, String phone, String mail, String title, int message_type, String message,
                     String message_time, int handle_way, String handle_time, int handle_status, String reply_content,
                     String reply_name) {
        super();
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.mail = mail;
        this.title = title;
        this.message_type = message_type;
        this.message = message;
        this.message_time = message_time;
        this.handle_way = handle_way;
        this.handle_time = handle_time;
        this.handle_status = handle_status;
        this.reply_content = reply_content;
        this.reply_name = reply_name;
    }

    @Override
    public String toString() {
        return "Guestbook [id=" + id + ", name=" + name + ", phone=" + phone + ", mail=" + mail + ", title=" + title
                + ", message_type=" + message_type + ", message=" + message + ", message_time=" + message_time
                + ", handle_way=" + handle_way + ", handle_time=" + handle_time + ", handle_status=" + handle_status
                + ", reply_content=" + reply_content + ", reply_name=" + reply_name + "]";
    }

}
