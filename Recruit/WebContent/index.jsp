<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录</title>
<link type="text/css" rel="stylesheet" href="login.css">
</head>
<body>
<section class="login">
	<div class="titulo">登录</div>
	<form action="login" method="post" enctype="application/x-www-form-urlencoded">
    	<input type="text" name="username" required title="Username required" placeholder="Username" data-icon="U" onblur="if(this.value.replace(/^ +| +$/g,'')=='')alert('名称不能为空!')">
        <input type="password" name="pwd" required title="Password required" placeholder="Password" data-icon="x" onblur="if(this.value.replace(/^ +| +$/g,'')=='')alert('密码不能为空!')">
        <select  name="selectName">
			<option>用户</option>
			<option>企业</option>
			<option>管理员</option>
		</select>
        <div class="olvido">
        	<div class="col"><a href="register.jsp" title="Ver Carásteres">注册</a></div>
            <div class="col"><a href="#" title="Recuperar Password">Fotgot Password?</a></div>
        </div>
        <input  type="submit" name="submit" value="Submit"  class="enviar">
    </form>
</section>

</body>
</html>