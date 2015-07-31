<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="dbAccess.DbAccessBean"
    import="java.sql.ResultSet"
    %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员页面</title>
<link type="text/css" rel="stylesheet" href="table.css">
</head>
<% DbAccessBean db=new DbAccessBean();
	String empid=request.getParameter("empid");
	String comid=request.getParameter("comid");
	if(null!=empid || null!=comid)
	{
		if(db.createConn())
		{
			if(null!=empid)
			{
				String sql="delete from emplogin where id="+empid+"";
				String sql1="delete from employee where empid="+empid+"";
				db.update(sql);
				db.update(sql1);
			}
			if(null!=comid)
			{
				String sql="delete from comlogin where id="+comid+"";
				String sql1="delete from company where comid="+comid+"";
				db.update(sql);
				db.update(sql1);
			}
			db.closeRst();
			db.closeStat();
			db.closeConn();
		}
	}
%>
<body >
	<div>
		<table>
		<caption>求职者信息</caption>
		<thead>
			<tr>
				<th>用户名</th>
				<th>密码</th>
				<th colspan="2">操作</th>
			</tr>
		</thead>
		<tbody>
			<% 
			   if(db.createConn())
			   {
					String sql="select * from emplogin";
					db.query(sql);
					while(db.next())
					{	
						
						//try{
							out.println("<tr>");
							out.println("<td>"+db.getRst().getString("name").toString()+"</td>");
							out.println("<td>"+db.getRst().getString("pwd").toString()+"</td>");
							out.println("<td><a href=\"detailUser.jsp?empid="+db.getRst().getString("id").toString()+"\">查看</a></td>");
							out.println("<td><a href=\"?empid="+db.getRst().getString("id").toString()+"\">删除</a></td>");
							out.println("<tr>");
						//}
						//catch(Exception e){
						//	System.out.println(e.toString());
						//}						 
					}
					db.closeRst();
					db.closeStat();
					db.closeConn();					
			   }  			   
			%>
		</tbody>
		</table>
	</div>
	<div>
		<table>
			<caption>企业用户信息</caption>
		<thead>
			<tr>
				<th>用户名</th>
				<th>密码</th>
				<th colspan="2">操作</th>
			</tr>
		</thead>
		<tbody>
			<% 
			   if(db.createConn())
			   {
					String sql="select * from comlogin";
					db.query(sql);
					while(db.next())
					{	
						
						//try{
							out.println("<tr>");
							out.println("<td>"+db.getRst().getString("name").toString()+"</td>");
							out.println("<td>"+db.getRst().getString("pwd").toString()+"</td>");
							out.println("<td><a href=\"detailCom.jsp?comid="+db.getRst().getString("id").toString()+"\">查看</a></td>");
							out.println("<td><a href=\"?comid="+db.getRst().getString("id").toString()+"\">删除</a></td>");
							out.println("<tr>");
						//}
						//catch(Exception e){
						//	System.out.println(e.toString());
						//}						 
					}
					db.closeRst();
					db.closeStat();
					db.closeConn();					
			   }  			   
			%>
		</tbody>
		</table>
	</div>
	
	
</body>
</html>