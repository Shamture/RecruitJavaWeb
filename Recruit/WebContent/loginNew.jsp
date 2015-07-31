<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>loginNew</title>
<link type="text/css" rel="stylesheet" href="login.css">
</head>
<body>
<div>
<form action="login" method="post">
<table align="center">
	<tr>
		<td class="btn1">用户名:</td>
		<td><input class="login" type="text" name="username"  onblur="if(this.value.replace(/^ +| +$/g,'')=='')alert('名称不能为空!')" ></td>		
	</tr>
	<tr>
		<td class="btn1">密码:</td>
		<td><input class="login" type="password" name="pwd" onblur="if(this.value.replace(/^ +| +$/g,'')=='')alert('密码不能为空!')"></td>
	</tr>
	<tr>
		<td class="btn1">类型:</td>
		<td>
		<select class="login" name="selectName">
			<option>用户</option>
			<option>企业</option>
			<option>管理员</option>
		</select>
		</td>
	</tr>
	<tr>
		<td ><input class="btn" type="submit" name="submit" value="登录"></td>
		<td class="btn1" ><a  href="register.jsp">注册</a></td>
	</tr>
</table>
</form>
</div>
</body>
</html>