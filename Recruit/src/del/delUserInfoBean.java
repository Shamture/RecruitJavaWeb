package del;

import dbAccess.DbAccessBean;

public class delUserInfoBean {
	
	String id;
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public boolean delete()
	{
		boolean isSuccess=false;
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{
			String sql="delete from employee where empid="+this.id+"";
			if(db.update(sql))
				isSuccess=true;
			db.closeRst();
			db.closeStat();
			db.closeConn();				
		}
		return isSuccess;
	}
}
