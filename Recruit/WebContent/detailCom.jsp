<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
	import="com.comInfoBean"
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>企业信息</title>
</head>
<% 
	String id=request.getParameter("comid");
	comInfoBean comInfo=comInfoBean.getComInfo(id);
%>
<body >
	<table align="center">
	<caption><h2>企业信息</h2></caption>
		<tr>
			<th>名称:</th>
			<th><input type="text" name="comName" value="<%= comInfo.getName()%>"></th>
		</tr>
		<tr>
			<th>电话:</th>
			<th><input type="text" name="comTel" value="<%= comInfo.getTel()%>"></th>
		</tr>
		<tr>
			<th>地址:</th>
			<th><input type="text" name="comAddress" value="<%= comInfo.getAddress()%>"></th>
		</tr>
		<tr>
			<th>经营行业:</th>
			<th><input type="text" name="comIndust" value="<%= comInfo.getIndrustry()%>"></th>
		</tr>
		<tr>
			<th >简介:</th>
			<th><textarea  name="comIntro" cols="10" rows="15" style="width:100%" ><%= comInfo.getIntro()%></textarea></th>
		</tr>
	</table>
</body>
</html>