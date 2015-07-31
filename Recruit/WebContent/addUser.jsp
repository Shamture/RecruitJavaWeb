<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加个人信息</title>
<style type="text/css">
	th{
		text-align: right;
	}
	.th1{
		text-align:left;
	}
	input{
		width:100%;
	}
</style>
</head>
<script type="text/javascript">
	function validForm()
	{
		var reason="";
		
		
	}
	function validName(name)
	{
		var error="";
		if(name.value==null||name.value=="")
			error="名字不能为空";
		return error;
	}
</script>
<body >
	<form action="userAdd" method="post" name="form1">
	<table align="center">
	<caption style="font-weight: bold;" >添加个人信息</caption>
		<tr>
			<th>姓名:</th><th><input type="text" name="name" ></th>
			<th>年龄:</th><th><input type="text" name="age"  ></th>
		</tr>
		<tr>
			<th>性别:
			</th>
			<th>
			<select name="sex" style="width:100%">
				<option>男</option>
				<option>女</option> 
			</select>
			</th>
			<th>出生日期:</th><th><input style="width: 100%;"  type="date" name="date" ></th>
		</tr>
		<tr>
			<th>联系方式:</th><th><input type="text" name="tel" ></th>
			<th>户籍:</th><th><input type="text" name="househ" ></th>
		</tr>
		<tr>
			<th>学历:</th><th><input type="text" name="xueli" ></th>
			<th>专业:</th><th><input type="text" name="major" ></th>
		</tr>
		<tr>
			<th>学位:</th><th><input type="text" name="degree" ></th>
			<th>毕业学校:</th><th><input type="text" name="school" ></th>
		</tr>
		<tr >
			<th colspan="1">业务技能:</th>
			<th colspan="3" class="th1" ><textarea name="skill" cols="60" rows="10"></textarea></th>
		</tr>
		<tr>
			<th><input type="hidden"></th>
			<th colspan="1"><input type="submit" name="submit" value="添加" style="width:60% ;align:right;"></th>
			<th><input type="reset" name="reset" value="重置" style="width:100%;align:left;"></th>
			<th><input type="hidden"></th>
		</tr>
	</table>
	</form>
</body>
</html>