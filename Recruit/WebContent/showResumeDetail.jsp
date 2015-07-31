<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
 	import="dbAccess.DbAccessBean"
 	import="java.sql.*"
 %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>简历投递情况</title>
<link type="text/css" rel="stylesheet" href="table.css">
</head>
<%
	String cIsHire=request.getParameter("cIsHire");
 	String cResumeID=request.getParameter("resumeID");
	if(null!=cIsHire&&null!=cResumeID)
	{
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{
			String sql="update resume set isHire='"+cIsHire+"' where resumeID="+cResumeID+"";
			System.out.println(sql);
			db.update(sql);
			db.closeRst();
			db.closeStat();
			db.closeConn();
		}
	}
%>
<body style="background: url(back.JPG);background-size:cover">
	<table>
		<thead>
			<th>岗位</th>
			<th>简历投递人</th>
			<th>录用状态</th>
			<th colspan="2">操作</th>
		</thead>
		<tbody>
			<%
				DbAccessBean db=new DbAccessBean();
				if(db.createConn())
				{
					String comId=session.getAttribute("id").toString();
					String sql="select * from resume where comId="+comId+"";
					db.query(sql);
					ResultSet rst=db.getRst();
					while(db.next())
					{
						out.println("<tr>");
						out.println("<td>"+rst.getString("jobName")+"</td>");
						out.println("<td><a href=\"showUserInfo.jsp?Uid="+rst.getString("empId")+"\">"+rst.getString("empName")+"</a></td>");
						String isHire=rst.getString("isHire");
						if("yes".equals(isHire))
							out.println("<td>已录用</td>");
						else
							out.println("<td>未录用</td>");
						
						String resumeID=rst.getString("resumeID");
						out.println("<td><a href=\"?cIsHire=yes&resumeID="+resumeID+"\">录用<a/></td>");
						out.println("<td><a href=\"?cIsHire=no&resumeID="+resumeID+"\">不录用<a/></td>");
						out.println("</tr>");
					}
					db.closeRst();
					db.closeStat();
					db.closeConn();					
				}
			%>
		</tbody>
	</table>
</body>
</html>