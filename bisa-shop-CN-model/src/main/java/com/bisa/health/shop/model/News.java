package com.bisa.health.shop.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 新闻model
 */
@Entity
@Table(name = "h_news")
public class News  implements Serializable{

    private static final long serialVersionUID = 8489060357520626852L;
    private int id;
    private int news_id; //新闻编码
    private String news_title;  //新闻标题
    private String news_subhead;    //副标题
    private int read_quantity;    //阅读量
    private String news_content;//新闻内容
    private String img_url;//新闻封面图
    private Date release_time; //发布日期
    private String author;  //作者
    private int news_classify_id;//新闻类型
    private String html_keyWord;//关键词
    private String news_describe;//新闻描述
    private int news_roofPlacement;//新闻置顶，0不置顶，1置顶
    private String html_description;//网站描述
    private String html_title;//网站标题
    private int lang_id;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    @Column(name = "release_time")
    public Date getRelease_time() {
        return release_time;
    }

    public void setRelease_time(Date release_time) {
        this.release_time = release_time;
    }
    @Column(name = "author")
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
    @Column(name = "img_url")
    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }
    @Column(name = "news_title")
    public String getNews_title() {
        return news_title;
    }

    public void setNews_title(String news_title) {
        this.news_title = news_title;
    }
    @Column(name = "read_quantity")
    public int getRead_quantity() {
        return read_quantity;
    }

    public void setRead_quantity(int read_quantity) {
        this.read_quantity = read_quantity;
    }
    @Column(name = "news_content")
    public String getNews_content() {
        return news_content;
    }

    public void setNews_content(String news_content) {
        this.news_content = news_content;
    }
    @Column(name = "news_subhead")
    public String getNews_subhead() {
        return news_subhead;
    }

    public void setNews_subhead(String news_subhead) {
        this.news_subhead = news_subhead;
    }
    @Column(name = "news_id")
    public int getNews_id() {
        return news_id;
    }

    public void setNews_id(int news_id) {
        this.news_id = news_id;
    }
    @Column(name = "news_classify_id")
    public int getNews_classify_id() {
        return news_classify_id;
    }

    public void setNews_classify_id(int news_classify_id) {
        this.news_classify_id = news_classify_id;
    }
    @Column(name = "news_describe")
    public String getNews_describe() {
        return news_describe;
    }
	public void setNews_describe(String news_describe) {
        this.news_describe = news_describe;
    }
    @Column(name = "html_keyWord")
    public String getHtml_keyWord() {
		return html_keyWord;
	}

	public void setHtml_keyWord(String html_keyWord) {
		this.html_keyWord = html_keyWord;
	}

	public int getLang_id() {
		return lang_id;
	}

	public void setLang_id(int lang_id) {
		this.lang_id = lang_id;
	}


    @Column(name = "news_roofPlacement")
    public int getNews_roofPlacement() {
        return news_roofPlacement;
    }

    public void setNews_roofPlacement(int news_roofPlacement) {
        this.news_roofPlacement = news_roofPlacement;
    }
    @Column(name = "html_description")
    public String getHtml_description() {
        return html_description;
    }

    public void setHtml_description(String html_description) {
        this.html_description = html_description;
    }
    @Column(name = "html_title")
    public String getHtml_title() {
        return html_title;
    }

    public void setHtml_title(String html_title) {
        this.html_title = html_title;
    }

    public News() {
        super();
    }

	public News(int news_id, String news_title, String news_subhead, int read_quantity, String news_content,
			String img_url, Date release_time, String author, int news_classify_id, String html_keyWord,
			String news_describe, int news_roofPlacement, String html_description, String html_title, int lang_id) {
		super();
		this.news_id = news_id;
		this.news_title = news_title;
		this.news_subhead = news_subhead;
		this.read_quantity = read_quantity;
		this.news_content = news_content;
		this.img_url = img_url;
		this.release_time = release_time;
		this.author = author;
		this.news_classify_id = news_classify_id;
		this.html_keyWord = html_keyWord;
		this.news_describe = news_describe;
		this.news_roofPlacement = news_roofPlacement;
		this.html_description = html_description;
		this.html_title = html_title;
		this.lang_id = lang_id;
	}

	@Override
	public String toString() {
		return "News [id=" + id + ", news_id=" + news_id + ", news_title=" + news_title + ", news_subhead="
				+ news_subhead + ", read_quantity=" + read_quantity + ", news_content=" + news_content + ", img_url="
				+ img_url + ", release_time=" + release_time + ", author=" + author + ", news_classify_id="
				+ news_classify_id + ", html_keyWord=" + html_keyWord + ", news_describe=" + news_describe
				+ ", news_roofPlacement=" + news_roofPlacement + ", html_description=" + html_description
				+ ", html_title=" + html_title + ", lang_id=" + lang_id + "]";
	}

   
}
