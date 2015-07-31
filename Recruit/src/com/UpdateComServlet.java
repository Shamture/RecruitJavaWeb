package com;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;
public class UpdateComServlet extends HttpServlet{
	public void init(ServletConfig config)throws ServletException
	{
		
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("comName");
		String tel=request.getParameter("comTel");
		String address=request.getParameter("comAddress");
		String intro=request.getParameter("comIntro");
		String indust=request.getParameter("comIndust");
		String comId=request.getSession().getAttribute("id").toString();
		
		comInfoBean comInfo=new comInfoBean();
		
		
		comInfo.setId(comId);
		comInfo.setName(name);
		comInfo.setTel(tel);
		comInfo.setAddress(address);
		comInfo.setIntro(intro);
		comInfo.setIndrustry(indust);
		if(comInfo.updateCom())
		{
			response.sendRedirect("com.jsp");
			System.out.println("��ӳɹ�!");
		}
		else
		{	
			System.out.println("���ʧ��!");
			response.sendRedirect("addComInfo.jsp");
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