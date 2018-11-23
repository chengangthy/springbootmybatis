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
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript">
		function test(){
			var t1=test1();
			var t2=test2();
			var t3=test3();
			var t4=test4();
			var t5=test5();
			if(t1&t2&t3&t4&t5){
				return true
			}else{
				return false
			}
		}
		
		
		function test1(){
			var val1=$("#in1").val();
			if(val1!=null&val1!=""){
				$("#div1").html("正确")
				return true
			}else{
				$("#div1").html("不能为空")
				return false
			}
		}
		
		function test2(){
			var val1=$("#in2").val();
			if(val1.length>0){
				$("#div2").html("正确")
				return true
			}else{
				$("#div2").html("必须为数字")
				return false
			}
		}
		
		function test3(){
			var val1=$("#in3").val();
			if(val1.length>0){
				$("#div3").html("正确")
				return true
			}else{
				$("#div3").html("必须为数字")
				return false
			}
		}
		function test4(){
			var val1=$("#in4").val();
			if(val1.length>0){
				$("#div4").html("正确")
				return true
			}else{
				$("#div4").html("格式：2011-05-05 12:30:00")
				return false
			}
		}
		function test5(){
			var val1=$("#in5").val();
			if(val1.length>0){
				$("#div5").html("正确")
				return true
			}else{
				$("#div5").html("格式：2011-05-05 12:30:00")
				return false
			}
		}
	
	
	
	$(function(){
			// 文件上传(文件域)的改变事件
			$(':file').change(function(event) {
				//  HTML5 js 对象的获取
   				var files = event.target.files, file;  
				if(files && files.length > 0){
					// 获取目前上传的文件
     		 		file = files[0];
     		 		// 文件的限定类型什么的道理是一样的
     		 		if(file.size > 1024 * 1024 * 2) {
	       			 	alert('图片大小不能超过 2MB!');
	        			return false;
     				}
      				// file对象生成可用的图片
      				var URL = window.URL || window.webkitURL;
      				// 通过 file 生成目标 url
      				var imgURL = URL.createObjectURL(file);
      				// 用这个 URL 产生一个 <img> 将其显示出来
      				$("img").prop('src', imgURL);
				}
			});
		});



</script>

</head>

<body>
<div class="wrap">
  <!-- main begin-->
  <div class="sale">
    <h1 class="lf">在线拍卖系统</h1>
    <div class="logout right"><a href="#" title="注销">注销</a></div>
  </div>
  		<form action="${pageContext.request.contextPath}/update.action" method="post" enctype="multipart/form-data" onsubmit="return test()">
      <div class="login logns produce">
        <h1 class="blues">拍卖品信息</h1>
          <dl>
            <dd >
              <label>名称：</label>
              <input type="hidden" name="auction_id" value="${requestScope.auction.auction_id}"/>
              <input type="text" class="inputh lf" name="auction_name" value="${requestScope.auction.auction_name}" id="in1" onblur="test1()"/>
              <div class="lf red laba" id="div1"></div>
            </dd>
            <dd>
              <label>起拍价：</label>
              <input type="text" class="inputh lf" name="auction_start_price" value="${requestScope.auction.auction_start_price}" id="in2" onblur="test2()"/>
              <div class="lf red laba" id="div2"><!-- 必须为数字 --></div>
            </dd>
            <dd>
              <label>底价：</label>
              <input type="text" class="inputh lf" name="auction_upset" value="${requestScope.auction.auction_upset}" id="in3" onblur="test3()"/>
              <div class="lf red laba" id="div3"><!-- 必须为数字 --></div>
            </dd>
            <dd>
              <label>开始时间：</label>
              <input type="text" class="inputh lf" name="auction_start_time" value="<fmt:formatDate value="${requestScope.auction.auction_start_time}"
		  		pattern="yyyy-MM-dd hh:mm:ss"
		  		/>
              " id="in4" onblur="test4()"/>
              <div class="lf red laba" id="div4"><!-- 格式：2011-05-05 12:30:00 --></div>
            </dd>
            <dd>
              <label>结束时间：</label>
              <input type="text" class="inputh lf" name="auction_end_time" value="<fmt:formatDate value="${requestScope.auction.auction_end_time}"
		  		pattern="yyyy-MM-dd hh:mm:ss"
		  		/>
              " id="in5" onblur="test5()"/>
              <div class="lf red laba" id="div5"><!-- 格式：2011-05-05 12:30:00 --></div>
            </dd>
            <dd class="dds">
              <label>描述：</label>
              <!-- <textarea name="" cols="" rows="" class="textarea">嘿嘿</textarea> -->
              <input type="text" name="auction_desc" value="${requestScope.auction.auction_desc}" class="inputh lf"/>
            </dd>
            <dd>
              <label>修改图片：</label>
              <div class="lf salebd"><a href="#"><img src="img/${requestScope.auction.auction_pic}" width="100" height="100" id="img"/></a></div>
               <input name="pic" type="file" class="marg10"  value="${requestScope.auction.auction_pic}"/>
           		<input type="hidden" name="auction_pic" value="${requestScope.auction.auction_pic}"/>
            </dd>
            <dd class="hegas">
                <input name="" type="submit" value="保 存" class="spbg buttombg buttombgs f14 lf buttomb" />
                <input name="" type="submit" value="取 消" class="spbg buttombg buttombgs f14 lf buttomb" />
                
            </dd>
          </dl>
    </div>
    </form>
<!-- main end-->
<!-- footer begin-->

</div>
 <!--footer end-->
 
</div>
</body>
</html>
