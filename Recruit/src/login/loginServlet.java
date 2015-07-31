package login;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class loginServlet extends  HttpServlet {
	
	public void init(ServletConfig config)throws ServletException
	{
		
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("username");
		String pwd=request.getParameter("pwd");
		String type=request.getParameter("selectName");
		HttpSession session=request.getSession();
		loginRegisterBean login=new loginRegisterBean(name,pwd,type);
		boolean isValid=login.isExist();
		System.out.println(isValid);
		System.out.println(type);
		System.out.println(pwd);
		System.out.println(name);
		if(isValid)
		{
			session.setAttribute("username", name);
			session.setAttribute("type", type);
			session.setAttribute("id", login.getId());
			if(type.equals("用户"))
				response.sendRedirect("user.jsp");
			else if(type.equals("企业"))
				response.sendRedirect("com.jsp");
			else if(type.equals("管理员"))
				response.sendRedirect("admin.jsp");
			else
				response.sendRedirect("login.jsp");
		}
		else
			response.sendRedirect("login.jsp");
		
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		doPost(request,response);
	}
	public void destroy()
	{
		
	}
	
}
