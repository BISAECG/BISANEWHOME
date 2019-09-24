package com.bisa.health.shop.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 新闻内容国际化 语言model
 */

@Entity
@Table(name = "h_new_internationalization")
public class NewsInternationalization implements Serializable {

    private int id;
    private int new_id; //新闻表的外键
    private int internationalization;//国际化语言 类型

    private String img_url;//新闻封面图
    private String author;  //作者
    private String news_title;  //新闻标题
    private String news_subhead; //副标题
    private String news_content;//新闻内容
    private String news_keyWord;//关键词
    private String news_describe;//新闻描述
    private String html_description;//网站描述
    private String html_title;//网站标题

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }



    public void setId(int id) {
        this.id = id;
    }

    public int getNew_id() {
        return new_id;
    }

    public void setNew_id(int new_id) {
        this.new_id = new_id;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getNews_title() {
        return news_title;
    }

    public void setNews_title(String news_title) {
        this.news_title = news_title;
    }

    public String getNews_subhead() {
        return news_subhead;
    }

    public void setNews_subhead(String news_subhead) {
        this.news_subhead = news_subhead;
    }

    public String getNews_content() {
        return news_content;
    }

    public void setNews_content(String news_content) {
        this.news_content = news_content;
    }

    public int getInternationalization() {
        return internationalization;
    }

    public void setInternationalization(int internationalization) {
        this.internationalization = internationalization;
    }

    public String getNews_keyWord() {
        return news_keyWord;
    }

    public void setNews_keyWord(String news_keyWord) {
        this.news_keyWord = news_keyWord;
    }

    public String getNews_describe() {
        return news_describe;
    }

    public void setNews_describe(String news_describe) {
        this.news_describe = news_describe;
    }

    public String getHtml_description() {
        return html_description;
    }

    public void setHtml_description(String html_description) {
        this.html_description = html_description;
    }

    public String getHtml_title() {
        return html_title;
    }

    public void setHtml_title(String html_title) {
        this.html_title = html_title;
    }

    public NewsInternationalization() {
    }

    public NewsInternationalization(int id, int new_id, int internationalization, String img_url, String author, String news_title, String news_subhead, String news_content, String news_keyWord, String news_describe, String html_description, String html_title) {
        this.id = id;
        this.new_id = new_id;
        this.internationalization = internationalization;
        this.img_url = img_url;
        this.author = author;
        this.news_title = news_title;
        this.news_subhead = news_subhead;
        this.news_content = news_content;
        this.news_keyWord = news_keyWord;
        this.news_describe = news_describe;
        this.html_description = html_description;
        this.html_title = html_title;
    }

    @Override
    public String toString() {
        return "NewsInternationalization{" +
                "id=" + id +
                ", new_id=" + new_id +
                ", internationalization=" + internationalization +
                ", img_url='" + img_url + '\'' +
                ", author='" + author + '\'' +
                ", news_title='" + news_title + '\'' +
                ", news_subhead='" + news_subhead + '\'' +
                ", news_content='" + news_content + '\'' +
                ", news_keyWord='" + news_keyWord + '\'' +
                ", news_describe='" + news_describe + '\'' +
                ", html_description='" + html_description + '\'' +
                ", html_title='" + html_title + '\'' +
                '}';
    }
}
