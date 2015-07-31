package recruit;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comInfoBean;
public class AddRecruitServlet extends HttpServlet{
	public void init(ServletConfig config)throws ServletException
	{
		
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		request.setCharacterEncoding("utf-8");
		String jobName=request.getParameter("jobName");
		String jobRequire=request.getParameter("jobRequire");
		String jobSalary=request.getParameter("jobSalary");
		String jobHireCount=request.getParameter("jobHireCount");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String jobPublish=df.format(new Date());
		String jobRequireOth=request.getParameter("jobRequireOth");
		
		System.out.println(jobPublish);
		comInfoBean comInfo=(comInfoBean)request.getSession().getAttribute("comInfo");
		RecruitBean recri=new RecruitBean();
		recri.setComId(comInfo.getId());
		recri.setComName(comInfo.getName());
		recri.setComTel(comInfo.getTel());
		recri.setComAddress(comInfo.getAddress());
		recri.setJobName(jobName);
		recri.setJobRequire(jobRequire);
		recri.setJobSalary(jobSalary);
		recri.setJobHireCount(jobHireCount);
		recri.setJobPublish(jobPublish);
		recri.setJobOtherReq(jobRequireOth);
		if(recri.insert())
		{
			response.sendRedirect("com.jsp");
			System.out.println("添加成功!");
		}
		else
		{	
			System.out.println("添加失败!");
			response.sendRedirect("com.jsp");
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		doPost(request,response);
	}
	public void destroy()
	{
		
	}
	
}