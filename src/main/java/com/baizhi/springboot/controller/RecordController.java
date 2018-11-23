package com.baizhi.springboot.controller;


import com.baizhi.springboot.entity.Record;
import com.baizhi.springboot.service.RecordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RecordController {
    @Autowired
    private RecordService recordService;

    Logger logger= LoggerFactory.getLogger(AuctionController.class);


    @RequestMapping("/insertRecord")
    public String insertRecord(Record record){
        recordService.insert(record);
        int id=record.getAuction_id();
        return "redirect:/selectRecord.action?auction_id="+id;
    }
}
