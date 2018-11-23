<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	
	function test10(){
		$("#imgVcode").prop("src","getKaptcha.action?a="+new Date().getTime());
	}
</script>
	
</head>

<body>
<div class="wrap">
<!-- main begin-->
 <div class="main">
   <div class="sidebar">
     <p><img src="images/img1.jpg" width="443" height="314" alt="" /></p>
   </div>
   <div class="sidebarg">
   <!--  target='_blank'是跳转新的页面 -->
    <%--  <form action="${pageContext.request.contextPath}/login.action" method="post" target='_blank'> --%>
     <form action="${pageContext.request.contextPath}/login.action" method="post">
    <div class="login">
      <dl>
        <dt class="blues">用户登陆</dt>
        <dd><label >用户名：</label><input type="text" class="inputh"  name="user_name"/></dd>
        <dd><label >密 码：</label><input type="password" class="inputh"  name="user_password"/></dd>
        <dd>
           <label class="lf" for="passwords">验证码：</label>
          
          
           <input type="text" class="inputh inputs lf"  id="passwords" name="kaptcha"/>
           <span class="wordp lf"><img src="getKaptcha.action" width="96" height="27" alt="" id='imgVcode'/></span>
           <span class="blues lf"><a href="javascript:void(0)" onclick="test10()" title="">看不清</a></span>
        
        
        </dd>
        <dd>
           <input name=""  type="checkbox" id="rem_u"  />
           <span for="rem_u">下次自动登录</span>
        </dd>
        <dd class="buttom">
           <input name="" type="submit" value="登 录" class="spbg buttombg f14 lf" />
           <input name="" type="submit" value="注 册" class="spbg buttombg f14 lf" />
           <span class="blues  lf"><a href="" title="">忘记密码?</a></span>
           <div class="cl"></div>
        </dd>
       
      </dl>
    </div>
    </form>
   </div>
  <div class="cl"></div>
 </div>
<!-- main end-->
 
<!-- footer begin-->
</div>
 <!--footer end-->
 
</div>
</body>
</html>
