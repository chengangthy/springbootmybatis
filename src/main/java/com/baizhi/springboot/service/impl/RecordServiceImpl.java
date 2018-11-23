package com.baizhi.springboot.service.impl;

import com.baizhi.springboot.dao.RecordDao;
import com.baizhi.springboot.entity.Record;
import com.baizhi.springboot.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service("recordService")
@Transactional
public class RecordServiceImpl implements RecordService {
    @Autowired
    private RecordDao recordDao;

    public void setRecordDao(RecordDao recordDao) {
        this.recordDao = recordDao;
    }

    @Override
    public void insert(Record record) {
        record.setAuction_time(new Date());
        recordDao.insert(record);
    }


}
