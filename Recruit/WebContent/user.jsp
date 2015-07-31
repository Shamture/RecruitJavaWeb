<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="user.UserInfoBean"
    import="dbAccess.DbAccessBean"
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户页面</title>
<link type="text/css" rel="stylesheet" href="table.css">
</head>
<%
	String userId=request.getParameter("userId");
	if(userId!=null)
	{
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{
			String sql="delete from employee where empid="+userId+"";
			db.update(sql);
			db.closeRst();
			db.closeStat();
			db.closeConn();
		}
	}
%>
<body >
	<div class="nav">
		<div class="div1">
		
		<% boolean isExists=UserInfoBean.isExist(session.getAttribute("id").toString()); %>
		
		<% if(isExists) { %>
		   <a href="#">添加个人信息</a>
		<% } else {%>
			<a href="addUser.jsp">添加个人信息</a>
		<% } %>
		</div>
		<div class="div1"><a href="showRecruitInfo.jsp">查看招聘信息</a></div>
		<div class="div1"><a href="showHireInfo.jsp">查看录用信息</a></div>
	</div>
	<div>
		<table >
		<caption>个人信息一览</caption>
		<thead>
			<tr>
				<th>姓名</th>
				<th>年龄</th>
				<th>性别</th>
				<th>出生日期</th>
				<th>联系方式</th>
				<th>户籍所在地</th>
				<th>学历</th>
				<th>专业</th>
				<th>学位</th>
				<th>毕业学校</th>
				<th>业务技能</th>
				<th colspan="2">操作</th>
			</tr>
		</thead>
		<tbody>
		<%
			if(UserInfoBean.isExist(session.getAttribute("id").toString()))
			{
				UserInfoBean userInfo=UserInfoBean.getUserInfo(session.getAttribute("id").toString());
				session.setAttribute("userInfoBean", userInfo);
				out.println("<tr id="+userInfo.getId()+">");
				out.println("<td>"+userInfo.getName()+"</td>");
				out.println("<td>"+userInfo.getAge()+"</td>");
				out.println("<td>"+userInfo.getSex()+"</td>");
				out.println("<td>"+userInfo.getDateborn()+"</td>");
				out.println("<td>"+userInfo.getTel()+"</td>");
				out.println("<td>"+userInfo.getHouseHold()+"</td>");
				out.println("<td>"+userInfo.getXueli()+"</td>");
				out.println("<td>"+userInfo.getMajor()+"</td>");
				out.println("<td>"+userInfo.getDegree()+"</td>");
				out.println("<td>"+userInfo.getSchool()+"</td>");
				out.println("<td>"+userInfo.getSkill()+"</td>");
				out.println("<td><a href=\"updateUserInfo.jsp\">更新</a></td>");
				out.println("<td><a href=\"?userId="+userInfo.getId()+"\">删除</a></td>");
				out.println("</tr>");
			}
		%>	
		</tbody>
		</table>
	</div>
</body>
</html>