<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	

</head>

<body>
<div class="wrap">
<!-- main begin-->
  <div class="sale">
 
    <h1 class="lf">在线拍卖系统</h1>
    
    <div class="logout right"><a href="" title="注销">下线</a>
    </div>
  </div>
 
  <div class="forms">
   <form action="${pageContext.request.contextPath}/selectAll.action" method="post">
    <label for="name">名称</label>
    <input name="auction_name" type="text" class="nwinput" id="name"/>
    <label for="names">描述</label>
    <input name="auction_desc" type="text" id="names" class="nwinput"/>
    <label for="time">开始时间</label>
    <input name="auction_start_time" type="text" id="time" class="nwinput"/>
    <label for="end-time">结束时间</label>
    <input name="auction_end_time" type="text" id="end-time" class="nwinput" />
    价格
    <input name="auction_start_price" type="text" id="price" class="nwinput" />
    <input name="" type="submit"  value="查询" class="spbg buttombg f14  sale-buttom"/>
    <input type="button"  value="发布" class="spbg buttombg f14  sale-buttom buttomb"/>
     </form>
  </div>
 
  <div class="items">
      <ul class="rows even strong">
        <li>名称</li>
        <li class="list-wd">描述</li>
        <li>开始时间</li>
        <li>结束时间</li>
        
        <li>起拍价</li>
        <li class="borderno">操作</li>
      </ul>
      <c:forEach items="${requestScope.auctionlist}" var="a">
      <ul class="rows">
        <li><a href="国书" title=""> ${a.auction_name}</a></li>
        <li class="list-wd">${a.auction_desc}</li>
        <li>
        <fmt:formatDate value="${a.auction_start_time}"
		  		pattern="yyyy-MM-dd hh:mm:ss"
		  		/>
        </li>
        <li>
        <fmt:formatDate value="${a.auction_end_time}"
		  		pattern="yyyy-MM-dd hh:mm:ss"
		  		/>
        </li>
        <li>${a.auction_start_price}</li>
        <li class="borderno red">
       <c:if test="${sessionScope.user.user_is_admin==1}">
    	<a href="${pageContext.request.contextPath}/selectOne.action?auction_id=${a.auction_id}" title="修改" onclick="dele();">修改</a>|
        <a href="${pageContext.request.contextPath}/delete.action?auction_id=${a.auction_id}" title="删除" onclick="abc();">删除</a>
       </c:if>
           
       <c:if test="${sessionScope.user.user_is_admin==0}">
       <a href="${pageContext.request.contextPath}/selectRecord.action?auction_id=${a.auction_id}">竞拍</a>|
       </c:if>
        </li>
      </ul>
      </c:forEach>
	<a href="${pageContext.request.contextPath}/insert.jsp">添加</a>
      <div class="page">
        <a href="#" title="">首页</a>
        <a href="#" title="">上一页</a>
        <span class="red">前5页</span>
        <a href="#" title="">1</a> 
        <a href="#" title="">2</a> 
        <a href="#" title="">3</a> 
        <a href="#" title="">4</a>
        <a href="#" title="">5</a> 
        <a href="#" title="">下一页</a>
        <a href="#" title="">尾页</a> 
      </div>
  </div>
<!-- main end-->
</div>
</body>
</html>
