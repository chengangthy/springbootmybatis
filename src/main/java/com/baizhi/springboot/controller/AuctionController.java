package com.baizhi.springboot.controller;


import com.baizhi.springboot.entity.Auction;
import com.baizhi.springboot.service.AuctionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class AuctionController {
    @Autowired
    private AuctionService auctionService;

    Logger logger= LoggerFactory.getLogger(AuctionController.class);

    /**
     * 这个方法是组合查询和展示所有
     * @param auction auction是组合查询需要的变量,jsp在name属性传过来，这边用对象接收参数
     * @param map 需要展示，所以定义map，list放入map中，给下一个jsp传参
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping("/selectAll")
    public String selectAll(Auction auction,Map map) throws UnsupportedEncodingException{
        try {
            List<Auction> auctionlist = auctionService.selectAll(auction);
            map.put("auctionlist",auctionlist);
            for (Auction auction1 : auctionlist) {
                logger.debug("auction集合:"+auction1);
            }
        } catch (Exception e) {
            logger.debug("错误");
        }

        return "admin";
    }
    @RequestMapping("/delete")
    public String delete(int auction_id){
        auctionService.delete(auction_id);
        //String url=URLEncoder.encode(s, enc)
        return "redirect:/selectAll.action";
    }
    @RequestMapping("/insert")
    public String insert(Auction auction,MultipartFile pic,HttpServletRequest request) throws IllegalStateException, IOException{
        String fileName=sFile(pic, request);
        auction.setAuction_pic(fileName);
        auctionService.insert(auction);
        return "redirect:/selectAll.action";
    }
    @RequestMapping("/update")
    public String update(Auction auction,MultipartFile pic,HttpServletRequest request) throws IllegalStateException, IOException{
        if(!"".equals(pic)){
            //获取到上传上来的文件名
            String fileName=pic.getOriginalFilename();
            //对文件进行重命名
            fileName=new Date().getTime()+"_"+fileName;
            System.out.println(fileName+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2");

            //路径的问题
            //根据upload文件夹名字，可以获取到它的绝对路径
            String realPath ="E:/img";
            pic.transferTo(new File(realPath+"/"+fileName));
            auction.setAuction_pic(fileName);
        }
        auctionService.update(auction);
        return "redirect:/selectAll.action";
    }
    @RequestMapping("/selectOne")
    public String selectOne(int auction_id,Map map){
        Auction auction=auctionService.selectOne(auction_id);
        map.put("auction", auction);
        return "update";
    }
    public String sFile(MultipartFile pic,HttpServletRequest request) throws IllegalStateException, IOException{
        //获取到上传上来的文件名
        String fileName=pic.getOriginalFilename();
        //对文件进行重命名
        fileName=new Date().getTime()+"_"+fileName;
        System.out.println(fileName+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2");
        //路径的问题
        String realPath = "E:/img";
        pic.transferTo(new File(realPath+"/"+fileName));
        return fileName;
    }
    /**
     *
     * @param auction_id 根据id查询返回一个对象,里面有一个list集合
     * @param map 把查询出来的对象放入map，给下一个jsp传值
     * @return
     */
    @RequestMapping("/selectRecord")
    public String selectRecord(int auction_id,Map map){
        Auction auction=auctionService.selcetRRR(auction_id);
        System.out.println(auction+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        map.put("auction", auction);
        return "show";
    }

}
