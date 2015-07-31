<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册</title>
<style>
	.content1{
		width:150px;
	}
	.registe{
		width:75px;
		float:left;
	}
</style>
</head>
<body>
	<form  name=" form1" action="register" method="post">
	<table align="center">
		<tr>
			<td>类型:</td>
			<td><input  type="radio" name="rType" value="用户">选工作  &nbsp;<input type="radio" name="rType" value="企业">招人
			</td>
		</tr>
		<tr>
			<td>邮箱:</td>
			<td><input class="content1" type="text" name="username"></td>
		</tr>
		<tr>
			<td>密码:</td>
			<td><input class="content1" type="password" name="pwd"></td>
		</tr>
		<tr>
			<td><input type="submit" name="submit" value="注册"></td>
		</tr>
	</table>
	</form>
</body>


</html>