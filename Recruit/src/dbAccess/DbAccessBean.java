package dbAccess;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbAccessBean {
   
	private String drv="com.mysql.jdbc.Driver";
	private String url="jdbc:mysql://localhost:3306/recruit";
	private String usr="root";
	private String pwd="240286024";
	private Connection conn=null;
	private Statement stat=null;
	private ResultSet rst=null;
	public String getDrv() {
		return drv;
	}
	public void setDrv(String drv) {
		this.drv = drv;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUsr() {
		return usr;
	}
	public void setUsr(String usr) {
		this.usr = usr;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Connection getConn() {
		return conn;
	}
	public void setConn(Connection conn) {
		this.conn = conn;
	}
	public Statement getStat() {
		return stat;
	}
	public void setStat(Statement stat) {
		this.stat = stat;
	}
	public ResultSet getRst() {
		return rst;
	}
	public void setRst(ResultSet rst) {
		this.rst = rst;
	}
	
	public boolean createConn(){
		boolean isSuccess=false;
		try {
			Class.forName(drv).newInstance();
			conn=DriverManager.getConnection(url, usr, pwd);
			isSuccess=true;
			
		} catch (SQLException e) {}
		  catch (ClassNotFoundException e){}
		 catch  (InstantiationException e){}
		 catch  (IllegalAccessException e){}
		return isSuccess;
	}
	public boolean update(String sql){
		boolean isSuccess=false;
		//System.out.println(sql);
		try{
			stat= conn.createStatement();
			stat.execute(sql);
			isSuccess=true;			
		}
		catch(Exception e){
			System.out.println(e.toString());
		}
		return isSuccess;
	}
	
	public void query(String sql){
		try {
			stat=conn.createStatement();
			rst=stat.executeQuery(sql);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public boolean next() {
		boolean isSuccess=false;
		try {
			if(rst.next())
				isSuccess=true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return isSuccess;
	}
	
	public String getValue(String field) {
		String value=null;
		try {
			if(rst!=null)
				value=rst.getString(field);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return value;
	}
	
	public void closeConn(){
		try {
			if(conn!=null)
				conn.close();
		} catch (SQLException e) {
			// TODO: handle exception
		}
	}
	public void closeStat() {
		try {
			if(stat!=null)
				stat.close();
		} catch (SQLException e) {
			// TODO: handle exception
		}
	}
	public void closeRst(){
		try {
			if(rst!=null)
				rst.close();
		} catch (SQLException e) {
			// TODO: handle exception
		}
	}
	
}
