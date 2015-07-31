<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加招聘信息</title>
<style>
	.th1{
	text-align:right;
	}
	textarea{
		width:100%;
	}
</style>
</head>
<body >
	<div>
	<form action="recruitAdd" method="post">
		<table align="center">
		<caption style="font-weight:bold;">招聘岗位</caption>
			<tr>
				<th class="th1">岗位名称</th><th><input type="text" name="jobName"></th>
			</tr>
			<tr>
				<th class="th1">岗位工资</th><th><input type="text" name="jobSalary"></th>
			</tr>
			<tr>
				<th class="th1">招聘人数</th><th><input type="text" name="jobHireCount"></th>
			</tr>
			<tr>
				<th class="th1">岗位要求</th><th><textarea rows="10" name="jobRequire"></textarea></th>
			</tr>
			<tr>
				<th class="th1">其他要求</th><th><textarea rows="10" name="jobRequireOth"></textarea></th>
			</tr>
			<tr>
				<th><input type="submit" name="submit" value="提交" style="width:100%"></th>
				<th><input type="reset" name="reset" value="重置" style="width:70px;float:left;"></th>
			</tr>
		</table>
	</form>
	</div>
	
</body>
</html>