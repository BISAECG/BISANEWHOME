package com.bisa.health.shop.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="h_news_classify")
public class NewsClassify implements Serializable {

    private static final long serialVersionUID = -5146253085136253313L;
    private int id;
    private String new_classify;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    @Column(name = "new_classify")
    public String getNew_classify() {
        return new_classify;
    }

    public void setNew_classify(String new_classify) {
        this.new_classify = new_classify;
    }
    public NewsClassify() {
        super();
    }

    public NewsClassify(int id, String new_classify) {
        this.id = id;
        this.new_classify = new_classify;
    }

    @Override
    public String toString() {
        return "NewsClassify{" +
                "id=" + id +
                ", new_classify='" + new_classify + '\'' +
                '}';
    }
}
