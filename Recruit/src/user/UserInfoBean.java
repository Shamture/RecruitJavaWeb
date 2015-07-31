package user;

import java.sql.ResultSet;

import dbAccess.DbAccessBean;

public class UserInfoBean {
	private String name;
	private String age;
	private String sex;
	private String dateborn;
	private String tel;
	private String houseHold;
	private String xueli;
	private String major;
	private String degree;
	private String school;
	private String skill;	
	private String Id;
	
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getDateborn() {
		return dateborn;
	}
	public void setDateborn(String dateborn) {
		this.dateborn = dateborn;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHouseHold() {
		return houseHold;
	}
	public void setHouseHold(String houseHold) {
		this.houseHold = houseHold;
	}
	public String getXueli() {
		return xueli;
	}
	public void setXueli(String xueli) {
		this.xueli = xueli;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	
	public boolean isExist()
	{
		boolean isSuccess=false;
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{
			String sql="select * from employee where empId='"+Id+"'";
			db.query(sql);
			if(db.next())
				isSuccess=true;
			db.closeRst();
			db.closeStat();
			db.closeConn();
		}
		return isSuccess;
	}
	
	public static boolean isExist(String Id)
	{
		boolean isSuccess=false;
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{
			String sql="select * from employee where empId='"+Id+"'";
			db.query(sql);
			if(db.next())
				isSuccess=true;
			db.closeRst();
			db.closeStat();
			db.closeConn();
		}
		return isSuccess;
	}
	
	
	public static UserInfoBean getUserInfo(String id)
	{
		UserInfoBean userInfo=null;
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{
			userInfo=new UserInfoBean();
			String sql="select * from employee where empid="+id+"";
			db.query(sql);
			if(db.next())
			{
				try{
					ResultSet rst=db.getRst();
					userInfo.setId(rst.getString("empid").toString());
					userInfo.setName(rst.getString("empname").toString());
					userInfo.setAge(rst.getString("empage").toString());
					userInfo.setSex(rst.getString("empgender").toString());
					
					userInfo.setDateborn(rst.getString("empborn").toString());
					userInfo.setTel(rst.getString("empcontact").toString());
					userInfo.setHouseHold(rst.getString("emphousehold").toString());
					userInfo.setDegree(rst.getString("empedu").toString());
					
					userInfo.setMajor(rst.getString("empmajor").toString());
					userInfo.setXueli(rst.getString("empdegree").toString());
					userInfo.setSchool(rst.getString("empschool").toString());
					userInfo.setSkill(rst.getString("empskill").toString());
				}
				catch(Exception e)
				{
					System.out.println(e.toString());
				}
			}
			db.closeRst();
			db.closeStat();
			db.closeConn();
			
		}
		
		return userInfo;
	}
	
	public boolean UpdateUserInfo()
	{
		boolean isSuccess=false;
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{
			String sql="update employee set empname='"+this.name+"', empage='"+this.age+"'"
					+ ", empGender='"+this.sex+"', empBorn='"+this.dateborn+"', empcontact='"+this.tel+"'"
					+ ", empHouseHold='"+this.houseHold+"', empEdu='"+this.xueli+"', empMajor='"+this.major+"'"
					+ ", empDegree='"+this.degree+"', empSchool='"+this.school+"',empSkill='"+this.skill+"' where empid='"+this.Id+"'";
			if(db.update(sql)){
				isSuccess=true;
			}
			db.closeRst();
			db.closeStat();
			db.closeConn();
		}
		
		return isSuccess;
	}
	
	public boolean Insert()
	{
		boolean isSuccess=false;
		if(isExist())
			return false;
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{
			String sql="insert into employee values('"+Id+"','"+name+"','"+age+"','"+sex+"','"+dateborn+"','"+tel+"','"+houseHold+"','"+xueli+"','"+major+"','"+degree+"','"+school+"','"+skill+"')";
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
