package com.baizhi.springboot.service;

import com.baizhi.springboot.entity.Auction;

import java.util.List;

public interface AuctionService {
    List<Auction> selectAll(Auction auction);
    void delete(int auction_id);
    void update(Auction auction);
    void insert(Auction auction);
    Auction selectOne(int auction_id);
    Auction selcetRRR(int auction_id);
}
