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
	 * @return �����Ƿ���֤�ɹ�,true������֤�ɹ���false ������֤ʧ��
	 */
	public boolean isExist()
	{
		Boolean isSuccess=false;
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{    
			String sql;
			if(type.equals("�û�"))
				sql="select * from emplogin where name='"+name+"'";
			else if(type.equals("��ҵ"))
				sql="select * from comlogin where name='"+name+"'";
			else if(type.equals("����Ա"))
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
		if(!isExist())//�ж��Ƿ���ڡ�
		{
			DbAccessBean db=new DbAccessBean();
			if(db.createConn())
			{
				String sql=null;
				String table=null;
				if(type.equals("�û�"))
					table="emplogin";
				else if(type.equals("��ҵ"))
					table="comlogin";
				else if(type.equals("����Ա"))
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
			if(type.equals("�û�"))
				sql="select * from emplogin where name='"+name+"'";
			else if(type.equals("��ҵ"))
				sql="select * from comlogin where name='"+name+"'";
			else if(type.equals("����Ա"))
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
