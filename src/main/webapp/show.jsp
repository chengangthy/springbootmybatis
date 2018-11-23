<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript">
	
	function test1(){
		return test()
	}
	function test(){
		//alert(1)
		var price=$("#price").val();
		var price1=$("#pricesss").html();
			if(parseInt(price)<parseInt(price1)||price==""){
				$("#tishi").html("不能低于最高起拍价,不能为空")
				return false
			}else{
				$("#tishi").html("可以拍卖")
				return true
			}
	}
	
	
</script>
</head>

<body>

<div class="wrap">
<!-- main begin-->
  <div class="sale">
    <h1 class="lf">在线拍卖系统</h1>
    <div class="logout right"><a href="#" title="注销">注销</a></div>
  </div>
  <div class="items sg-font lf">
  
      <ul class="rows">
        <li>名称：</li>
        <li class="borderno">${requestScope.auction.auction_name}</li>
      </ul>
      <ul class="rows">
        <li>描述：</li>
        <li class="borderno">${requestScope.auction.auction_desc}</li>
      </ul>
      <ul class="rows">
        <li>开始时间：</li>
        <li class="borderno"><fmt:formatDate value="${requestScope.auction.auction_start_time}" pattern="yyyy-mm-dd hh:mm:ss"/></li>
      </ul>
      <ul class="rows">
        <li>结束时间：</li>
        <li class="borderno">
        <fmt:formatDate value="${requestScope.auction.auction_end_time}" pattern="yyyy-mm-dd hh:mm:ss"/>
        </li>
      </ul>
      <ul class="rows border-no">
        <li>起拍价：</li>
         
        <li class="borderno">${requestScope.auction.auction_start_price}</li>
      </ul>
  </div>
  <div class="rg borders"><img src="img/${requestScope.auction.auction_pic}" width="270" height="185" alt="" /></div>
  <div class="cl"></div>
  <div class="top10 salebd">
       <p>
       
        <form action="${pageContext.request.contextPath }/insertRecord.action" method="post" onsubmit="return test1()">
       <label for>出价：</label>
       <input name="user_id" type="hidden"  class="inputwd"  value="${sessionScope.user.user_id}"/>
       <input name="auction_id" type="hidden"  class="inputwd" value="${requestScope.auction.auction_id}"/>
       <input type="number" name="auction_price"  class="inputwd"   id="price" onblur="test()"/>
       <input name="" type="submit" value="竞 拍" class="spbg buttombg f14  sale-buttom" />
       </form>
       </p>
       <p class="f14 red" id="tishi"></p>
  </div>
  <div class="top10">
  
   <a href=""> <input name="" type="submit" value="刷 新" class="spbg buttombg f14" /></a>
    <a href="${pageContext.request.contextPath}/selectAll.action"><input name="" type="submit" value="返回列表" class="spbg buttombg f14" /></a>
  
  </div>
    
  <div class="offer">
    <h3>出价记录</h3>
    <div class="items sg-font">
      <ul class="rows even strong">
        <li>竞拍时间</li>
        <li>竞拍价格</li>
        <li class="borderno">竞拍人</li>
      </ul>
      <c:forEach items="${requestScope.auction.recordlist}" var="s">
      <ul class="rows">
        <li><fmt:formatDate value="${s.auction_time }" pattern="yyyy-mm-dd hh:mm:ss"/></li>
        <li id="pricesss">${s.auction_price}</li>
        <li class="borderno">${s.user.user_name}</li>
      </ul>
      </c:forEach>
  </div>
  </div>
   
<!-- main end-->
</div>
</body>
</html>
