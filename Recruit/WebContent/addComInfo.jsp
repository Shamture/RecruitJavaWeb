<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加信息</title>
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
<form action="comAdd">
	<table align="center">
	<caption><h2>添加信息</h2></caption>
		<tr>
			<th>名称:</th>
			<th><input type="text" name="comName"></th>
		</tr>
		<tr>
			<th>电话:</th>
			<th><input type="text" name="comTel"></th>
		</tr>
		<tr>
			<th>地址:</th>
			<th><input type="text" name="comAddress"></th>
		</tr>
		<tr>
			<th>经营行业:</th>
			<th><input type="text" name="comIndust"></th>
		</tr>
		<tr>
			<th >简介:</th>
			<th><textarea  name="comIntro" cols="10" rows="15" style="width:100%"></textarea></th>
		</tr>
		<tr>
			<th><input type="submit" name="submit" value="提交" class="subBtn"></th>
			<th><input type="reset" name="rest" value="重置" class="subBtn" style="float:left"></th>
		</tr>
	</table>
	</form>
</body>
</html>