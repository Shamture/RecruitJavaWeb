<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="recruit.RecruitBean"
    %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>更改招聘信息</title>
<style>
	.th1{
	text-align:right;
	}
	textarea{
		width:100%;
		
	}
</style>
</head>
<% 	
	String recruitId=request.getParameter("recruitId");
	RecruitBean rec=RecruitBean.queryById(recruitId);
%>
<body >
<div>
<form action="recruitUpdate" method="post">
		<table align="center">
		<caption style="font-weight:bold;">更新岗位信息</caption>
			<tr>
				<th class="th1">岗位名称</th><th><input type="text" name="jobName" value="<%= rec.getJobName()%>"></th>
			</tr>
			<tr>
				<th class="th1">岗位工资</th><th><input type="text" name="jobSalary" value="<%= rec.getJobSalary()%>"></th>
			</tr>
			<tr>
				<th class="th1">招聘人数</th><th><input type="text" name="jobHireCount" value="<%= rec.getJobHireCount() %>"></th>
			</tr>
			<tr>
				<th class="th1">岗位要求</th><th><textarea rows="10" name="jobRequire"><%= rec.getJobRequire() %></textarea></th>
			</tr>
			<tr>
				<th class="th1">其他要求</th><th><textarea rows="10" name="jobRequireOth"><%= rec.getJobOtherReq() %></textarea></th>
			</tr>
			<tr>
				<th><input type="submit" name="submit" value="更新" style="width:100%"></th>
				<th><input type="reset" name="reset" value="重置" style="width:70px;float:left;"></th>
			</tr>
		</table>
		<input type="hidden" name="recruitId" value="<%= recruitId %>">
	</form>
</div>
</body>
</html>