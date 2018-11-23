package com.baizhi.springboot.service.impl;


import com.baizhi.springboot.dao.AuctionDao;
import com.baizhi.springboot.entity.Auction;
import com.baizhi.springboot.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("auctionService")
@Transactional
public class AuctionServiceImpl implements AuctionService {
    @Autowired
    private AuctionDao auctionDao;

    public void setAuctionDao(AuctionDao auctionDao) {
        this.auctionDao = auctionDao;
    }

    @Override
    public List<Auction> selectAll(Auction auction) {
        return auctionDao.selectAll(auction);
    }

    @Override
    public void delete(int auction_id) {
        auctionDao.delete(auction_id);
    }

    @Override
    public void update(Auction auction) {
        auctionDao.update(auction);
    }

    @Override
    public void insert(Auction auction) {
        auctionDao.insert(auction);
    }

    @Override
    public Auction selectOne(int auction_id) {
        return auctionDao.selectOne(auction_id);
    }

    @Override
    public Auction selcetRRR(int auction_id) {
        return auctionDao.selcetRRR(auction_id);
    }


}
