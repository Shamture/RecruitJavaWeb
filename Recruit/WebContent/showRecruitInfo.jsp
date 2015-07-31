<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
  	import="recruit.RecruitBean"
  	import="java.util.*"
  	import="dbAccess.DbAccessBean"
  %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>招聘信息</title>
<link type="text/css" rel="stylesheet" href="table.css">
</head>
<% 
	String rComId=request.getParameter("rComId");
	String rRecuritId=request.getParameter("rRecuritId");
	String rComName=request.getParameter("rComName");
	String rJobName=request.getParameter("rJobName");
	String uId=session.getAttribute("id").toString();
	String uName=session.getAttribute("username").toString();
	if(null!=rComId && null!=rRecuritId && null!=uId &&null!=rComName&&null!=rJobName&&null!=uName)
	{
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{ 
			
			String sql="insert into resume "
			+"values(null,'"+rComId+"','"+rRecuritId+"','"+uId+"','no','"+rComName+"','"+rJobName+"','"+uName+"')";//no表示未录用
			db.update(sql);
			db.closeRst();
			db.closeStat();
			db.closeConn();
		}
	}
%>
<body > 
	<table>
		<thead>
			<tr>
				<th>企业名称</th>
				<th>企业电话</th>
				<th>企业地址</th>
				<th>岗位</th>
				<th>工资</th>
				<th>招聘人数</th>
				<th>发布时间</th>
				<th>岗位要求</th>
				<th>其他要求</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<%
			List<RecruitBean> list=RecruitBean.queryAll();
			for(int i=0;i<list.size();++i)
			{
				RecruitBean r=(RecruitBean)list.get(i);
				out.println("<tr>");
				//out.println("<td hidden=\"hidden\">"+r.getComId()+"</td>");
				out.println("<td>"+r.getComName()+"</td>");
				out.println("<td>"+r.getComTel()+"</td>");
				out.println("<td>"+r.getComAddress()+"</td>");
				out.println("<td>"+r.getJobName()+"</td>");
				out.println("<td>"+r.getJobSalary()+"</td>");
				out.println("<td>"+r.getJobHireCount()+"</td>");
				out.println("<td>"+r.getJobPublish()+"</td>");
				out.println("<td>"+r.getJobRequire()+"</td>");
				out.println("<td>"+r.getJobOtherReq()+"</td>");
				out.println("<td><a href=?rComId="+r.getComId()+"&rRecuritId="+r.getRecruitId()+""
						+"&rComName="+r.getComName()+"&rJobName="+r.getJobName()+">投递简历</a></td>");
				out.println("</tr>");
			}
		%>
		</tbody>
	</table>
</body>
</html>