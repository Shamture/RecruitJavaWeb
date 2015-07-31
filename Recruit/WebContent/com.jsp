<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="com.comInfoBean"
    import="dbAccess.DbAccessBean"
    import="recruit.RecruitBean"
    import="java.util.*"
    %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>企业主页</title>
<link type="text/css" rel="stylesheet" href="table.css">
</head>
<% String comId=request.getParameter("comId");
   String recruitId=request.getParameter("recruitId");
	if(null!=comId || null!=recruitId)
	{
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{
			if(null!=recruitId)
			{
				String delRec="delete from recruit where recruitid="+recruitId+"";
				db.update(delRec);
			}
			if(null!=comId)
			{
				String sql="delete from resume  where comid='"+comId+"'";
				db.update(sql);
				sql="delete from recruit where comId="+comId+"";
				db.update(sql);
				sql="delete from company where comId="+comId+"";
				db.update(sql);
			}
			db.closeRst();
			db.closeStat();
			db.closeConn();
		}
	}
%>
<body >
	<div class="nav">
		<div class="div1">
		
		<% boolean isExists=comInfoBean.isExists(session.getAttribute("id").toString()); %>
		
		<% if(isExists) { %>
			<a href="#">添加企业信息</a>	
		<% } else { %>
			<a href="addComInfo.jsp">添加企业信息</a>
		<% } %>
			
		</div>
		<div class="div1"><a href="addRecruit.jsp">发布招聘信息</a></div>
		<div class="div1"><a href="showResumeDetail.jsp">查看投递情况</a></div>
	</div>
	<div>
		<table>
			<caption>企业信息表单</caption>
			<thead>
			<tr>
				<th>名称</th>
				<th>电话</th>
				<th>地址</th>
				<th>简介</th>
				<th>经营行业</th>
				<th colspan="2">操作</th>
			</tr>
			</thead>
			<tbody>
			<%
			if(comInfoBean.isExists(session.getAttribute("id").toString()))
			{
				comInfoBean comInfo=comInfoBean.getComInfo(session.getAttribute("id").toString());
				out.println("<tr id="+comInfo.getId()+">");
				out.println("<td>"+comInfo.getName()+"</td>");
				out.println("<td>"+comInfo.getTel()+"</td>");
				out.println("<td>"+comInfo.getAddress()+"</td>");
				out.println("<td>"+comInfo.getIntro()+"</td>");
				out.println("<td>"+comInfo.getIndrustry()+"</td>");
				out.println("<td><a href=\"updateComInfo.jsp\">更新</a></td>");
				out.println("<td><a href=\"?comId="+comInfo.getId()+"\">删除</a></td>");
				out.println("</tr>");
				session.setAttribute("comInfo", comInfo);
			}
		 %>	
		</tbody>		
		</table>
	</div>
	<div>
		<table>
			<caption>招聘信息</caption>
			<thead>
			<tr>
				<th>岗位</th>
				<th>工资</th>
				<th>招聘人数</th>
				<th>发布时间</th>
				<th>要求</th>
				<th>其他要求</th>
				<th colspan="2">操作</th>
			</tr>
			</thead>
			<tbody>
			<% RecruitBean recru=new RecruitBean();
				List<RecruitBean> list=RecruitBean.query(session.getAttribute("id").toString());
			    for(int i=0;i<list.size();++i)
			    {
			    	RecruitBean s=(RecruitBean)list.get(i);
			    	out.println("<tr>");
			    	out.println("<td>"+s.getJobName()+"</td>");
			    	out.println("<td>"+s.getJobSalary()+"</td>");
			    	out.println("<td>"+s.getJobHireCount()+"</td>");
			    	out.println("<td>"+s.getJobPublish()+"</td>");
			    	out.println("<td>"+s.getJobRequire()+"</td>");
			    	out.println("<td>"+s.getJobOtherReq()+"</td>");
			    	out.println("<td><a href=\"updateRecruit.jsp?recruitId="+s.getRecruitId()+"\">更新</a></td>");
			    	out.println("<td><a href=\"?recruitId="+s.getRecruitId()+"\">删除</a></td>");
			    	out.println("</tr>");
			    }		
			%>
			</tbody>
		</table>
	</div>
</body>
</html>