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
<script type="text/javascript" src="/AspringB/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript">
	function test(){
		   var t1=test1();
		   var t2=test2();
		   var t3=test3();
		   var t4=test4();
		if(t1&&t2&&t3&&t4){
			return true;
		}else{
			return false;
		}
	}


	function test1(){
		var d=document.getElementById("username");
		   dv=d.value;
		   var p2=document.getElementById("div1");
		   if(dv.length>=6&&dv.length<=20&&dv!=null){
			   p2.innerHTML="正确";
			   p2.style="color:black";
			     return true;
		   }else{
			   p2.innerHTML="用户名要求不低于6个字符";
			   p2.style="color:red";
		         return false;
		   }
	}
	
	function test2(){
		var d=document.getElementById("password");
		   dv=d.value;
		   var p4=document.getElementById("div2");
		   if(dv.length>=6&&dv.length<=20&&dv!=null){
			   p4.innerHTML="正确";
			   p4.style="color:black";
			     return true;
		   }else{
			   p4.innerHTML="您的密码可以由大小写英文字母、数字组成，长度6－20位。";
			   p4.style="color:red";
		         return false;
		   }
	}
	
	function test3(){
		var d=document.getElementById("card");
		   dv=d.value;
		   var p4=document.getElementById("div3");
		   if(dv!=null&&dv!=""){
			   p4.innerHTML="正确";
			   p4.style="color:black";
			     return true;
		   }else{
			   p4.innerHTML="身份证号必填";
			   p4.style="color:red";
		         return false;
		   }
	}
	
	function test4(){
		var t=document.getElementById("tel");
		   tv=t.value;
		   var p5=document.getElementById("div4");
		   if(tv!=null&&tv!=""){
			   p5.innerHTML="正确";
			   p5.style="color:black";
			     return true;
		   }else{
			   p5.innerHTML="电话号码必填";
			   p5.style="color:red";
		         return false;
		   }
	}
	function test10(){
		$("#imgVcode").prop("src","getKaptcha.action?a="+new Date().getTime());
	}






</script>

</head>

<body>
<div class="wrap">
  <!-- main begin-->
      <div class="zclf login logns">
        <form  action="${pageContext.request.contextPath}/reg.action" method="post" onsubmit="return test()">
        <table>
        <h1  class="blue">用户注册</h1>
          <dl>
            <dd>
              <label> <small>*</small>用户名</label>
              <input type="text" name="user_name" class="inputh lf" value="" onblur="test1()" id="username"/>
             <div class="lf red laba" id="div1">用户名要求不低于6个字符</div>
            </dd>
            <dd>
              <label> <small>*</small>密码</label>
              <input type="text" name="user_password" class="inputh lf" value="" onblur="test2()" id="password"/>
              <div class="lf red laba" id="div2">密码要求不低于6个字符</div>
            </dd>
            <dd>
              <label> <small>*</small>身份证号</label>
              <input type="text" name="user_card_no" class="inputh lf" value="" onblur="test3()" id="card"/>
              <div class="lf red laba" id="div3">身份证号必填</div>
            </dd>
            <dd>
              <label> <small>*</small>电话</label>
              <input type="text" name="user_tel" class="inputh lf" value="" onblur="test4()" id="tel"/>
              <div class="lf red laba" id="div4">电话号码必填</div>
            </dd>
            <dd>
              <label> <small>*</small>住址</label>
              <input type="text" name="user_address" class="inputh lf" value=""  id="address"/>
            </dd>
            <dd>
              <label> <small>*</small>邮政编码</label>
              <input type="text" name="user_post_number" class="inputh lf" value=""  id="post"/>
            </dd>
            <dd class="hegas">
              <label> <small>*</small>验证码</label>
              <input type="text" class="inputh inputs lf" value="" name="kaptcha"/>
               <span class="wordp lf"><img src="getKaptcha.action" width="96" height="27" alt="" id='imgVcode'/></span>
               <span class="blues lf"><a href="javascript:void(0)" onclick="test10()" title="">看不清</a></span>
            </dd>
            <dd class="hegas">
              <label>&nbsp;</label>
               <input name=""  type="checkbox" id="rem_u"   />
              <label for="rem_u" class="labels">我同意<span class="blues">《服务条款》</span></label>
            </dd>
            <dd class="hegas">
              <label>&nbsp;</label>
              <input name="" type="submit" value="立即注册" class="spbg buttombg buttombgs f14 lf" />
            </dd>
          </dl>
          </table>
          </form>
    </div>
<!-- main end-->
<!-- footer begin-->

</div>
 <!--footer end-->
 
</div>
</body>
</html>
