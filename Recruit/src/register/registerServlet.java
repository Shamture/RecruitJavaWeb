package register;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import login.loginRegisterBean;
public class registerServlet extends  HttpServlet {
	
	public void init(ServletConfig config)throws ServletException
	{
		
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("username");
		String pwd=request.getParameter("pwd");
		String type=request.getParameter("rType");
		loginRegisterBean register=new loginRegisterBean(name,pwd,type);
		boolean isOK=register.register();
		
		if(isOK)
		{
			//if(type.equals("用户"))
			//	response.sendRedirect("login.jsp");
			//else if(type.equals("企业"))
			//	response.sendRedirect("com.jsp");
			//else if(type.equals("管理员"))
			//	response.sendRedirect("admin.jsp");
			//else
				response.sendRedirect("login.jsp");
		}
		else
			response.sendRedirect("register.jsp");
		
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		doPost(request,response);
	}
	public void destroy()
	{
		
	}
	
}
