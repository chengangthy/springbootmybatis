package com.baizhi.springboot.entity;

import java.util.Date;

public class Record {
    private int id;//竞拍记录编号
    private int user_id;//竞拍者编号
    private int auction_id;//拍卖品编号
    private Date auction_time;//竞价时间
    private Double auction_price;//竞拍价格
    private User user;
    public Record() {
        super();
        // TODO Auto-generated constructor stub
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getUser_id() {
        return user_id;
    }
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    public int getAuction_id() {
        return auction_id;
    }
    public void setAuction_id(int auction_id) {
        this.auction_id = auction_id;
    }
    public Date getAuction_time() {
        return auction_time;
    }
    public void setAuction_time(Date auction_time) {
        this.auction_time = auction_time;
    }
    public Double getAuction_price() {
        return auction_price;
    }
    public void setAuction_price(Double auction_price) {
        this.auction_price = auction_price;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Record(int id, int user_id, int auction_id, Date auction_time,
                  Double auction_price, User user) {
        super();
        this.id = id;
        this.user_id = user_id;
        this.auction_id = auction_id;
        this.auction_time = auction_time;
        this.auction_price = auction_price;
        this.user = user;
    }
    @Override
    public String toString() {
        return "Record [id=" + id + ", user_id=" + user_id + ", auction_id="
                + auction_id + ", auction_time=" + auction_time
                + ", auction_price=" + auction_price + ", user=" + user + "]";
    }
}
