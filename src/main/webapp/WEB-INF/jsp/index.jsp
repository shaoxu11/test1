<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- 	// <script type="text/javascript" src="../static/js/jquery-1.12.4.js"></script> -->
	<style>
    body{ text-align:center} 
    	#divcss5{margin:0 auto;width:500px;height:250px;text-align:center} 
    .a{
    	position: relative;
    	left:10px;
    	top:25px;
    	}
   #dengl{
   
   }
    </style>
    
  </head>
<%-- 
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script> --%>
   
  <body>
  <div align="center" id="divcss5" style="background-color: #5BC0DE; margin-top: 100px" >
			<h3 class="a">用户管理系统</h3>
			<form action="login" method="get">
				<table align="center" style="margin-top: 50px" >
					<tr  style="height: 40px">
						<td>用户名</td>
						<td ><input style="color:red"type="text" name="student_name" id="userName" /></td>
					</tr>

					<tr>
						<td>密 码</td>
						<td><input type="text" name="student_password" id="password"
							id="student_password" /></td>
					</tr>
					<tr>
					<td>验证码</td>
						<td><input type="text" name="" id="cpacha" value=""
							sytle="width:50px"/>
						<img src="Cpachau?a=4&b=110&c=30&capchaType=denglu" width="110px"  id="cpa" style="cursor:pointer" title="点击换一张" onclick="cp1()" height="30px">
						</td>
					</tr>
				</table>
				</br>
				<input style="color:#000000;background-color:#DDDCEB"  type="button" value="登陆" class="btn btn-info"" id="dengl" onclick="loginUser();"/>
				<input style="color:#000000;background-color:#DDDCEB" type="button"  value="注册" onclick="addUser()" class="btn btn-info""/>
				
			</form>
		</div>
  </body>

  <script type="text/javascript" src="static/js/jquery-1.12.4.js"></script>
<!--   <script type="text/javascript" src="static/js/jquery.js"></script> -->
  <script type="text/javascript">
  
  	function addUser(){
  	 location.href="addUser";
  	}
  	function cp1(){
  		$("#cpa").attr("src",'Cpachau?a=4&b=110&c=30&capchaType=denglu&t=' +new Date().getTime() );
  	}
  	//登录
  	function loginUser(){
  		var userName = $("#userName").val();
  		var password = $("#password").val();
  		var cpacha = $("#cpacha").val();
  		if(userName == null || userName==""){
  			alert("用户名不能为空!");
  		}else if(password == null || password ==""){
  			alert("密码不能为空");
  		}else if(cpacha == null || cpacha==""){
  			alert("请输入验证码!")
  		}else{
  			$.ajax({
  				url			:			"login",
  				type		:			"post",
  				data		:			{
  					"name"	:	userName,
  					"password"	:	password,
  					"cpacha"	:	cpacha
  				},
  				dataType	:		"json",
  				success		:			function(data){
					if(data.type=="success"){
						location.href="menu"
					}else{
						alert(data.msg);
					}
  				},
  				error		:		function(){
  					alert("登录出现异常!");
  				}
  			});
  		}
  	}
  </script>
  

</html>
