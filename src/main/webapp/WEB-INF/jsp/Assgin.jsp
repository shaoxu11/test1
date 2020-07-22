<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Assgin.jsp' starting page</title>
   	  <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <!-- <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" /> -->
        <meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="stylesheet" href="static/layui/css/layui.css" media="all">
		<link rel="stylesheet" href="static/css/font.css">
        <link rel="stylesheet" href="static/css/xadmin.css">
       <!--  <link rel="stylesheet" href="./css/theme5.css">-->
        <script src="static/layui/layui.all.js" charset="utf-8"></script> 
        <script type="text/javascript" src="static/js/xadmin.js"></script>

  </head>
  <!-- 在此写代码 -->
  <body>

   
  
     <div class="page-contents" align="center" id="aa" style="margin-top:50px">
     
     
             <div><button class="layui-btn" lay-active="e1">事件1</button>
<button class="layui-btn" lay-active="e2">事件2</button>
<button class="layui-btn" lay-active="e3">事件3</button></div>
       <div id="test12" class="demo-tree-more"></div>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>t>
      <script type="text/javascript"> 
      alert("cscscs")
   layui.use('util', function(){
  var util = layui.util;
  
  //处理属性 为 lay-active 的所有元素事件
  util.event('lay-active', {
    e1: function(){
      alert('触发了事件1');
    }
    ,e2: function(){
      alert('触发了事件2');
    }
    ,e3: function(){
      alert('触发了事件3');
    }
  });
});

	        	var menu = ${json1};
	        	var menu2 = ${json2};
	        	var menu3 = ${json3};
	        	var somemenu = ${juri};
	        	alert(somemenu);
	         
	        	
	       	 layui.use(['tree', 'util'], function(){
        var tree = layui.tree,
                layer = layui.layer,
                util = layui.util,
                data = [];
	layer.msg("Hellp")
      for (var i = 0; i < menu.length; i++) { //循环一级菜单
		        	var checked = false;	//复选框声明
		        	
		        	for(var a = 0; a < somemenu.length; a++){
		        		if(somemenu[a].id == menu[i].id){	//判断已有权限id是否有一级菜单的id
		        			checked = true;		//有则勾选
		        		}
		        		if(somemenu[a].jurisdiction_parent == menu[i].id){ //判断已有权限的父级id和一级菜单id是否相等
		        			checked = false; 	//若权限含有一级菜单的子集id,则不勾选当前一级菜单
		        		}
		        	}
			        data.push({	//添加一级菜单数据
			        	title: menu[i].jurisdiction_name,
						id: menu[i].id,
						children: [],
						checked: checked
					});
					
					for (var x = 0; x < menu3.length; x++) { //循环三级按钮
						var checked = false;
						for(var a = 0; a < somemenu.length; a++){
							if(somemenu[a].id == menu3[x].id){
								checked = true;
							}

						}
						if(menu3[x].jurisdiction_parent == menu[i].id){  //绑定一级和对应的三级按钮
					        data[i].children.push({	//添加二级菜单数据
					        	title: menu3[x].jurisdiction_name,
								id: menu3[x].id,
								children: [],
								checked: checked
							
							});
						}
			    	}
					for (var x = 0; x < menu2.length; x++) { //循环二级菜单
						var checked = false;
						for(var a = 0; a < somemenu.length; a++){
							if(somemenu[a].id == menu2[x].id){
								checked = true;
							}
							if(somemenu[a].jurisdiction_parent == menu2[x].id){
								checked = false;
							}
						}
						if(menu2[x].jurisdiction_parent == menu[i].id){  //绑定一级和对应的二级菜单
					        data[i].children.push({	//添加二级菜单数据
					        	title: menu2[x].jurisdiction_name,
								id: menu2[x].id,
								children: [],
								checked: checked
							
							});
						
							for (var y = 0; y < menu3.length; y++) { //循环三级按钮
								var checked = false;
								for(var a = 0; a < somemenu.length; a++){
									if(somemenu[a].id == menu3[y].id){
										checked = true;
									}
								
								}
								if(menu3[y].jurisdiction_parent == menu2[x].id){ //绑定一级和对应的三级按钮
							        data[i].children[x].children.push({	//添加二级菜单数据
							        	title: menu3[y].jurisdiction_name,
										id: menu3[y].id,
										checked: checked
									
									});
								}
					    	}
				    	}
			    	}
		    	}
				
			 //基本演示
			  tree.render({
			    elem: '#test12'
			    ,data: data
			    ,showCheckbox: true  //是否显示复选框
			    ,id: 'demoId1'
			    /* ,isJump: true //是否允许点击节点时弹出新窗口跳转
			    ,click: function(obj){
			      var data = obj.data;  //获取当前点击的节点数据
			      layer.msg('状态：'+ obj.state + '<br>节点数据：' + JSON.stringify(data));
			    } */
			  });
			  
			  //按钮事件
			  util.event('lay-demo', {
			    getChecked: function(othis){
			      var checkedData = tree.getChecked('demoId1'); //获取选中节点的数据
			      
			      layer.alert(JSON.stringify(checkedData), {shade:0});
			      console.log(checkedData);
			    }
			    ,setChecked: function(){
			      tree.setChecked('demoId1', [12, 16]); //勾选指定节点
			    }
			    ,reload: function(){
			      //重载实例
			      tree.reload('demoId1', {
			        
			      });
			      
			    }
			  });
			 
			  
			
			});
      </script>
      

        </div>
  </body>
</html>