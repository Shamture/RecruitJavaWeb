package user;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class UpdateUserServlet extends HttpServlet{
	public void init(ServletConfig config)throws ServletException
	{
		
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		String age=request.getParameter("age");
		String sex=request.getParameter("sex");
		String date=request.getParameter("date");
		String tel=request.getParameter("tel");
		String household=request.getParameter("househ");
		String xueli=request.getParameter("xueli");
		String major=request.getParameter("major");
		String degree=request.getParameter("degree");
		String school=request.getParameter("school");
		String skill=request.getParameter("skill");
		String userId=request.getSession().getAttribute("id").toString();
		
		UserInfoBean userInfo=new UserInfoBean();
		
		userInfo.setId(userId);
		userInfo.setAge(age);
		userInfo.setDateborn(date);
		userInfo.setDegree(degree);
		userInfo.setHouseHold(household);
		userInfo.setXueli(xueli);

		userInfo.setMajor(major);
		userInfo.setTel(tel);
		userInfo.setSchool(school);
		userInfo.setSex(sex);
		userInfo.setSkill(skill);
		userInfo.setName(name);
		
		if(userInfo.UpdateUserInfo())
		{
			response.sendRedirect("user.jsp");
			System.out.println("添加成功!");
		}
		else
		{	
			System.out.println("添加失败!");
			response.sendRedirect("addUser.jsp");
		}
		
//		session.setAttribute("username", name);
//		session.setAttribute("type", type);
//		loginRegisterBean login=new loginRegisterBean(name,pwd,type);
//		boolean isValid=login.isExist();
//		System.out.println(isValid);
//		System.out.println(type);
//		System.out.println(pwd);
//		System.out.println(name);
//		if(isValid)
//		{
//			if(type.equals("用户"))
//				response.sendRedirect("user.jsp");
//			else if(type.equals("企业"))
//				response.sendRedirect("com.jsp");
//			else if(type.equals("管理员"))
//				response.sendRedirect("admin.jsp");
//			else
//				response.sendRedirect("login.jsp");
//		}
//		else
//			response.sendRedirect("login.jsp");
		
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		doPost(request,response);
	}
	public void destroy()
	{
		
	}
	
}