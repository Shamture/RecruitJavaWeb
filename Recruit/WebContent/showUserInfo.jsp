<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="user.UserInfoBean"
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>应聘者信息</title>
<style>
	p{
		font-size: 20px;
		font-weight: bold;
	}
</style>
</head>
<body >
	<%
		String id=request.getParameter("Uid").toString();
		if(null!=id)
		{
			out.println("<p>");
			UserInfoBean userInfo=UserInfoBean.getUserInfo(id);
			out.println("姓名:"+userInfo.getName()+"<br>");
			out.println("年龄:"+userInfo.getAge()+"<br>");
			out.println("性别:"+userInfo.getSex()+"<br>");
			out.println("出生日期:"+userInfo.getDateborn()+"<br>");
			out.println("联系方式:"+userInfo.getTel()+"<br>");
			out.println("户籍所在地:"+userInfo.getHouseHold()+"<br>");
			out.println("学历:"+userInfo.getXueli()+"<br>");
			out.println("专业:"+userInfo.getMajor()+"<br>");
			out.println("学位:"+userInfo.getDegree()+"<br>");
			out.println("毕业学校:"+userInfo.getSchool()+"<br>");
			out.println("专业技能:"+userInfo.getSkill()+"<br>");
			out.println("</p>");
		}
	%>
</body>
</html>