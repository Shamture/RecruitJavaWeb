package del;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class delUserInfoServlet extends HttpServlet{
	public void init(ServletConfig config)throws ServletException
	{
		
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		request.setCharacterEncoding("utf-8");
		String userId=request.getSession().getAttribute("id").toString();
		
		delUserInfoBean userInfo=new delUserInfoBean();
		userInfo.setId(userId);
		
		if(userInfo.delete())
		{
			
			System.out.println("É¾³ý³É¹¦!");
		}
		response.sendRedirect("user.jsp");
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		doPost(request,response);
	}
	public void destroy()
	{
		
	}
	
}