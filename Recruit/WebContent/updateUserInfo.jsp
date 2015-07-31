<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="user.UserInfoBean"
    %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>更新个人信息</title>
</head>
<% UserInfoBean userInfo=(UserInfoBean)session.getAttribute("userInfoBean"); %>
<body >
<% if(userInfo!=null) { %>
<form action="userUpdate" method="post" name="form1">
	<table align="center">
	<caption style="font-weight: bold;" >修改个人信息</caption>
		<tr>
			<th>姓名:</th><th><input type="text" name="name" value="<%= userInfo.getName() %>"></th>
			<th>年龄:</th><th><input type="text" name="age"  value="<%= userInfo.getAge()%>"></th>
		</tr>
		<tr>
			<th>性别:
			</th>
			<th>
			<select name="sex" style="width:100%">
				 <% if("男".equals(userInfo.getSex())) { %>
				    <option>女</option>
				    <option selected="selected">男</option>
				<% } else if(("女").equals(userInfo.getSex())){ %>
					<option selected="selected">女</option> 
					<option >男</option>
				<% } %>
			</select>
			</th>
			<th>出生日期:</th><th><input style="width: 100%;"  type="date" name="date" value="<%= userInfo.getDateborn()%>"></th>
		</tr>
		<tr>
			<th>联系方式:</th><th><input type="text" name="tel" value="<%= userInfo.getTel()%>"></th>
			<th>户籍:</th><th><input type="text" name="househ" value="<%= userInfo.getHouseHold()%>"></th>
		</tr>
		<tr>
			<th>学历:</th><th><input type="text" name="xueli" value="<%= userInfo.getXueli()%>"></th>
			<th>专业:</th><th><input type="text" name="major" ></th>
		</tr>
		<tr>
			<th>学位:</th><th><input type="text" name="degree" value="<%= userInfo.getDegree()%>"></th>
			<th>毕业学校:</th><th><input type="text" name="school" value="<%= userInfo.getSchool()%>"></th>
		</tr>
		<tr >
			<th colspan="1">业务技能:</th>
			<th colspan="3" class="th1" ><textarea name="skill" cols="60" rows="10" ><%= userInfo.getSkill() %></textarea></th>
		</tr>
		<tr>
			<th><input type="hidden"></th>
			<th colspan="1"><input type="submit" name="submit" value="更新" style="width:60% ;align:right;"></th>
			<th><input type="reset" name="reset" value="重置" style="width:100%;align:left;"></th>
			<th><input type="hidden"></th>
		</tr>
	</table>
	</form>
	<% } else { %>
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
	<% } %>
	
</body>
</html>