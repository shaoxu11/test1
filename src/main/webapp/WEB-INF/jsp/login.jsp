<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("path", path);
%>
<!doctype html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>学生成绩管理</title>
        <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <!-- <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" /> -->
        <meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="stylesheet" href="static/layui/css/layui.css">
		<link rel="stylesheet" href="static/css/font.css">
        <link rel="stylesheet" href="static/css/xadmin.css">
       <!--  <link rel="stylesheet" href="./css/theme5.css">-->
       <script type="text/javascript" src="static/js/jquery-1.12.4.js"></script>
        <script src="static/layui/layui.js" charset="utf-8"></script> 
        <script type="text/javascript" src="static/js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
         <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
   		 <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<!--          <script type="text/javascript" src="static/js.jquery.js"> -->
        <script>
            //是否开启刷新记忆tab功能
             var is_remember = false;
        </script>
        	<style type="text/css">
         tr{
         	height: 30px;
         	align:center;
         }
         td{
         	width: 80px;
         	text-align:center;
         }
        </style>
    </head>
    <body class="index">
 
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a>用户信息管理</a></div>
            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>
            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item" style="margin-right: 30px;">
                 	欢迎您!  ${sessionScope.user1.name}
                </li>
                <li class="layui-nav-item to-index">
                    <a href="index">退出</a></li>
            </ul>
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                <c:forEach var="menu1" items="${menu}">
                 <c:if test="${menu1.jurisdiction_type ==1 }">
                 <li>
					<a href="javascript:;" > 
						<i class="iconfont left-nav-li" lay-tips="系统基础管理">&#xe6b8;</i>
						<cite>${menu1.jurisdiction_name }</cite> 
						<i class="iconfont nav_right">&#xe697;</i>
					</a>
				<ul class="sub-menu">
				 <c:forEach var="menu2" items="${menu}">
				 <c:if test="${menu2.jurisdiction_type ==2 && menu2.jurisdiction_parent == menu1.id}">
                        <li>
                            <a href="javascript:;" onclick="allUser('${menu2.jurisdiction_uri}','${sessionScope.user1.id}','${menu2.id }')">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>${menu2.jurisdiction_name }</cite></a>
                        </li>
                   </c:if>
                   </c:forEach>
                   </ul>
				</li>
				</c:if>
                </c:forEach>
                  </ul>
            </div>
        </div>
         <div class="page-contents" align="center" id="aa" style="margin-top:50px">
         <h1>欢迎登录!</h1>
         
        </div>
    </body>
    <!--  <script type="text/javascript" src="static/js.jquery.js"></script> -->
    <%--  <script src="${path}/statics/js/ui.js"></script> --%>
     <script type="text/javascript">
    	
     //查询用户所有的信息
     function allUser(uri,user_id,jurisdiction_parent){
     	if(user_id ==null||user_id==""){
     		alert("请登录!");
     	}else{
     	var ise = {
     		"uri"	: 	uri,
     		"user_id":	user_id,
     		"jurisdiction_parent":jurisdiction_parent
     	}
     	$(".page-contents").removeClass();
     	$("#aa").load(uri+" .page-contents",ise);
     	}
     	
     }
     //分配权限
     function Assign(uri,id){
		var ids = [];
		$("input[name='ids']:checked").each(function(){
			ids.push($(this).val());
		});
		if(ids.length==0){alert("请至少分配一名用户");
		}else if(ids.length>1){alert("只能分配一名用户");
		
		}else{
		id=ids[0];
		$.ajax({
		url 		:		uri,
		type		:		"post",
		data		:		"uri="+uri+"&id="+id,
		success		:		function(data){
			$("#aa").html(data);
		}
		})
		/* var ise = {
			"uri":uri,
			"id":id
		}
		$(".page-contents").removeClass();
		$("#aa").load(uri+" .page-contents",ise); */
		
		
		/* jQuery.getScript("static/js/jquery-1.12.4.js"); */
			
		}

		
     }
     //修改权限
     function upateRole(id){
     	var ids=[];
     		$("input[name='ids']:checked").each(function(){
			ids.push($(this).val());
		});
		
		$.ajax({
		url		:	"updateRole",
		type	:	"post",
		data:	"ids="+ids+"&id="+id,
		success	:	function(data){
			if(data.type=="success"){
				alert(data.msg);
				location.href = location.href;
				allUser("allUser","${sessionScope.user1.id}",'3');
				
			}else{
				alert(data.msg);
			}
		},
		error	:	function(){
			alert("修改出现异常!");
		}
		});

     }
     function on(){
    	 alert("ljl");}
     </script>
</html>