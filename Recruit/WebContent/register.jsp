<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册</title>
<link type="text/css" rel="stylesheet" href="login.css" >
</head>
<body>
<section class="login">
	<div class="titulo">注册</div>
	<form action="register" method="post" enctype="application/x-www-form-urlencoded">
    	<input type="text" name="username" required title="Username required" placeholder="Username" data-icon="U" onblur="if(this.value.replace(/^ +| +$/g,'')=='')alert('名称不能为空!')">
        <input type="password" name="pwd" required title="Password required" placeholder="Password" data-icon="x" onblur="if(this.value.replace(/^ +| +$/g,'')=='')alert('密码不能为空!')">
        <select  name="rType">
			<option>用户</option>
			<option>企业</option>
		</select>
		<div class="olvido">
        	<div class="col"><a href="#" title="Ver Carásteres" hidden="hidden">注册</a></div>
            <div class="col"><a href="#" title="Recuperar Password" hidden="hidden">Fotgot Password?</a></div>
        </div>
        <input  type="submit" name="submit" value="注册"  class="enviar">
    </form>
</section>
</body>
</html>