package com;

import java.sql.ResultSet;

import dbAccess.DbAccessBean;

public class comInfoBean {
	private String id;
	private String name;
	private String tel;
	private String address;
	private String intro;
	private String indrustry;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getIndrustry() {
		return indrustry;
	}
	public void setIndrustry(String indrustry) {
		this.indrustry = indrustry;
	}
	
	public static boolean isExists(String id)
	{
		boolean isSuccess=false;
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{
			String sql="select * from company where comid="+id+"";
			db.query(sql);
			if(db.next())
				isSuccess=true;
			db.closeRst();
			db.closeStat();
			db.closeConn();
		}
		return isSuccess;
	}
	
	public static comInfoBean getComInfo(String id)
	{
		comInfoBean comInfo=null;
		
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{
			comInfo=new comInfoBean();
			comInfo.setId(id);
			String sql="select * from company where comId="+id+"";
			db.query(sql);
			if(db.next())
			{
				try{
					ResultSet rst=db.getRst();
					comInfo.setName(rst.getString("comName"));
					comInfo.setTel(rst.getString("comTel"));
					comInfo.setAddress(rst.getString("comAddress"));
					comInfo.setIntro(rst.getString("comIntro"));
					comInfo.setIndrustry(rst.getString("comIndust"));
				}
				catch(Exception e){System.out.println(e.toString());}
			}
			db.closeRst();
			db.closeStat();
			db.closeConn();
			
		}
		return comInfo;
	}
	
	public boolean insert(){
		boolean isSuccess=false;
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{
			if(!isExists(this.id))
			{	
				String sql="insert into company values('"+this.id+"','"+this.name+"','"+this.tel+"','"+this.address+"','"+this.intro+"','"+this.indrustry+"')";
				if(db.update(sql))
					isSuccess=true;
			}
			db.closeRst();
			db.closeStat();
			db.closeConn();
		}
		return isSuccess;
	}
	
 public boolean updateCom()
 {
	 boolean isSuccess=false;
	 DbAccessBean db=new DbAccessBean();
	 if(db.createConn())
	 {
		 String sql="update company set comname='"+this.name+"',comtel='"+this.tel+"',comaddress='"+this.address+"'"
		 		+ ",comIntro='"+this.intro+"',comIndust='"+this.indrustry+"'";
		 System.out.println(sql);
		 if(db.update(sql))
		 	isSuccess=true;
		 db.closeRst();
		 db.closeStat();
		 db.closeConn();
	 }
	 return isSuccess;
 }
	
}
