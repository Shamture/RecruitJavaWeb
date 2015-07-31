<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
	import="java.sql.*"
	import="dbAccess.DbAccessBean"    
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>录用详细</title>
<link type="text/css" rel="stylesheet" href="table.css">
</head>
<body >
	<table>
	<caption>录用情况</caption>
		<thead>
			<th>公司</th>
			<th>岗位</th>
			<th>是否录用</th>
		</thead>
		<tbody>
			<% 
				DbAccessBean db=new DbAccessBean();
				if(db.createConn())
				{   
					String uId=session.getAttribute("id").toString();
					String sql="select * from resume where empId="+uId+"";
					db.query(sql);
					ResultSet rst=db.getRst();
					while(db.next())
					{
						out.println("<tr>");
						out.println("<td>"+rst.getString("comName")+"</td>");
						out.println("<td>"+rst.getString("jobName")+"</td>");
						String isHire=rst.getString("isHire");
						if("yes".equals(isHire))
							out.println("<td>已经录用</td>");
						else if("no".equals(isHire))
							out.println("<td>未录用</td>");
						else
							out.println("<td>进行中</td>");
						
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