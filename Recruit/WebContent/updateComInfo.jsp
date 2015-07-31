<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="com.comInfoBean"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>更改企业信息</title>
</head>
<style type="text/css">
	th{
		text-align:right;
		font-size:20px;
	}
	.subBtn{
		width:100px;
	}	
</style>
</head>
<body >
<% comInfoBean comInfo=(comInfoBean)session.getAttribute("comInfo"); %>
<form action="comUpdate">
	<table align="center">
	<caption><h2>添加信息</h2></caption>
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
		<tr>
			<th><input type="submit" name="submit" value="更改" class="subBtn" ></th>
			<th><input type="reset" name="rest" value="重置" class="subBtn" style="float:left"></th>
		</tr>
	</table>
	</form>
</body>
</html>