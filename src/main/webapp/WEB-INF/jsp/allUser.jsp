<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'allUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
      <div class="page-contents" align="center" id="aa" style="margin-top:50px">
      <div style="margin-left:-100px"> <c:forEach var="button" items="${button}">
      <a href="javascriipt:;" onclick="Assign('${button.jurisdiction_uri }','${sessionScope.user1.id}')">
     	 ${button.jurisdiction_describe}</a>
      </c:forEach></div>
     
         <table align="center" border="1">
          <tr>
          <td>
          		<label>选择</label>
          	</td>
          	<td>
          		<label>姓名</label>
          	</td>
          	<td>
          		<label>年龄</label>
          	</td>
          	<td>
          		<label>性别</label>
          	</td>
          	<td>
          		<label>地址</label>
          	</td>
       
          </tr>
          <c:forEach var="list" items="${list }">
          	<tr>
          		<td><input name="ids" type="checkbox" value="${list.id }" /></td>
          		<td>${list.name }</td>
          		<td>${list.age }</td>
          		<td>${list.gender }</td>
          		<td>${list.address }</td>
          	</tr>
          </c:forEach>
         </table>
       </div>
  </body>
</html>
