package com.baizhi.springboot.dao;

import com.baizhi.springboot.entity.Auction;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AuctionDao {
    List<Auction> selectAll(@Param("auction") Auction auction);
    void delete(int auction_id);
    void update(Auction auction);
    void insert(Auction auction);
    Auction selectOne(int auction_id);
    Auction selcetRRR(int auction_id);
}
