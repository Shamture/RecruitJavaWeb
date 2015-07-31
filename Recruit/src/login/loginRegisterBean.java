package login;

import java.sql.SQLException;

import dbAccess.DbAccessBean;

/**
 * @author Xesin1
 *
 */
public class loginRegisterBean {

	private String name;
	private String password;
	private String type;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public loginRegisterBean()
	{
		name=null;
		type=null;
		password=null;
	}
	public loginRegisterBean(String username,String pwd,String ty)
	{
		name=username;
		password=pwd;
		type=ty;
	}
	/**
	 * @return 返回是否验证成功,true代表验证成功，false 代表验证失败
	 */
	public boolean isExist()
	{
		Boolean isSuccess=false;
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{    
			String sql;
			if(type.equals("用户"))
				sql="select * from emplogin where name='"+name+"'";
			else if(type.equals("企业"))
				sql="select * from comlogin where name='"+name+"'";
			else if(type.equals("管理员"))
				sql="select * from admin where name='"+name+"'";
			else 
				return isSuccess;
			db.query(sql);
			if(db.next()){
				isSuccess=true;
			}
		}
		
		db.closeRst();
		db.closeStat();
		db.closeConn();
		
		return isSuccess;
	}
	
	public boolean register()
	{
		boolean isSuccess=false;
		if(!isExist())//判断是否存在。
		{
			DbAccessBean db=new DbAccessBean();
			if(db.createConn())
			{
				String sql=null;
				String table=null;
				if(type.equals("用户"))
					table="emplogin";
				else if(type.equals("企业"))
					table="comlogin";
				else if(type.equals("管理员"))
					table="admin";
				else
					return false;
				sql="insert into "+table+" values(null,'"+this.name+"','"+this.password+"')";
				//System.out.println(sql);
				if(db.update(sql))
					isSuccess=true;
				db.closeRst();
				db.closeStat();
				db.closeConn();
			}
		}
		return isSuccess;
	}
	
	public String getId()
	{
		String id="";
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{    
			String sql;
			if(type.equals("用户"))
				sql="select * from emplogin where name='"+name+"'";
			else if(type.equals("企业"))
				sql="select * from comlogin where name='"+name+"'";
			else if(type.equals("管理员"))
				sql="select * from admin where name='"+name+"'";
			else 
				return "";
			db.query(sql);
			if(db.next()){
				try {
					id=db.getRst().getString("ID");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		db.closeRst();
		db.closeStat();
		db.closeConn();
		return id;
	}
}
