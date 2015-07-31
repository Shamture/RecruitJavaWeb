package recruit;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbAccess.DbAccessBean;

public class RecruitBean {
	
	private String recruitId;
	public String getRecruitId() {
		return recruitId;
	}
	public void setRecruitId(String recruitId) {
		this.recruitId = recruitId;
	}

	private String comId;
	private String comName;
	private String comTel;
	private String comAddress;
	private String jobName;
	private String jobRequire;
	private String jobSalary;
	private String jobHireCount;
	private String jobPublish;
	private String jobOtherReq;
	
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getComTel() {
		return comTel;
	}
	public void setComTel(String comTel) {
		this.comTel = comTel;
	}
	public String getComAddress() {
		return comAddress;
	}
	public void setComAddress(String comAddress) {
		this.comAddress = comAddress;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getJobRequire() {
		return jobRequire;
	}
	public void setJobRequire(String jobRequire) {
		this.jobRequire = jobRequire;
	}
	public String getJobSalary() {
		return jobSalary;
	}
	public void setJobSalary(String jobSalary) {
		this.jobSalary = jobSalary;
	}
	public String getJobHireCount() {
		return jobHireCount;
	}
	public void setJobHireCount(String jobHireCount) {
		this.jobHireCount = jobHireCount;
	}
	public String getJobPublish() {
		return jobPublish;
	}
	public void setJobPublish(String jobPublish) {
		this.jobPublish = jobPublish;
	}
	public String getJobOtherReq() {
		return jobOtherReq;
	}
	public void setJobOtherReq(String jobOtherReq) {
		this.jobOtherReq = jobOtherReq;
	}
	
	public boolean update(String recruitId)
	{
		boolean isSuccess=false;
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{
			String sql="update recruit set jobname='"+this.jobName+"', jobRequire='"+this.jobRequire+"', jobSalary='"+this.jobSalary+"',"
					+ " jobCount='"+this.jobHireCount+"', jobPublish='"+this.jobPublish+"', jobOtherReq='"+this.jobOtherReq+"'";
			if(db.update(sql))
				isSuccess=true;
			db.closeRst();
			db.closeStat();
			db.closeConn();
		}
		return isSuccess;
	}
	
	public static RecruitBean queryById(String recruitId)
	{
		RecruitBean recru=null;
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{
			String sql="select * from recruit where recruitID="+recruitId+"";
			db.query(sql);
			while(db.next())
			{
				recru=new RecruitBean();
				try {
					ResultSet rst=db.getRst();
					RecruitBean rec=new RecruitBean();
					recru.setRecruitId(rst.getString("recruitID"));
					recru.setComId(rst.getString("comId"));
					recru.setComName(rst.getString("comName"));
					recru.setComTel(rst.getString("comTel"));
					recru.setComAddress(rst.getString("comAddress"));
					recru.setJobName(rst.getString("jobName"));
					recru.setJobRequire(rst.getString("jobRequire"));
					recru.setJobSalary(rst.getString("jobSalary"));
					recru.setJobHireCount(rst.getString("jobCount"));
					recru.setJobPublish(rst.getString("jobPublish"));
					recru.setJobOtherReq(rst.getString("jobOtherReq"));
					//isExist=true;
				} catch (SQLException e) {
					// TODO: handle exception
				}
			}
			db.closeRst();
			db.closeStat();
			db.closeConn();
		}
		return recru;
	}
	public static List<RecruitBean> query(String comId)
	{
		List<RecruitBean> list=new ArrayList<RecruitBean>();
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{
			String sql="select * from recruit where comId="+comId+"";
			db.query(sql);
			while(db.next())
			{
				try {
					ResultSet rst=db.getRst();
					RecruitBean rec=new RecruitBean();
					rec.setRecruitId(rst.getString("recruitID"));
					rec.setComId(rst.getString("comId"));
					rec.setComName(rst.getString("comName"));
					rec.setComTel(rst.getString("comTel"));
					rec.setComAddress(rst.getString("comAddress"));
					rec.setJobName(rst.getString("jobName"));
					rec.setJobRequire(rst.getString("jobRequire"));
					rec.setJobSalary(rst.getString("jobSalary"));
					rec.setJobHireCount(rst.getString("jobCount"));
					rec.setJobPublish(rst.getString("jobPublish"));
					rec.setJobOtherReq(rst.getString("jobOtherReq"));
					list.add(rec);
					//isExist=true;
				} catch (SQLException e) {
					// TODO: handle exception
				}
			}
			db.closeRst();
			db.closeStat();
			db.closeConn();
		}
		return list;
	}
		
	public static List<RecruitBean> queryAll()
	{
		List<RecruitBean> list=new ArrayList<RecruitBean>();
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{
			String sql="select * from recruit";
			db.query(sql);
			while(db.next())
			{
				try {
					ResultSet rst=db.getRst();
					RecruitBean rec=new RecruitBean();
					rec.setRecruitId(rst.getString("recruitID"));
					rec.setComId(rst.getString("comId"));
					rec.setComName(rst.getString("comName"));
					rec.setComTel(rst.getString("comTel"));
					rec.setComAddress(rst.getString("comAddress"));
					rec.setJobName(rst.getString("jobName"));
					rec.setJobRequire(rst.getString("jobRequire"));
					rec.setJobSalary(rst.getString("jobSalary"));
					rec.setJobHireCount(rst.getString("jobCount"));
					rec.setJobPublish(rst.getString("jobPublish"));
					rec.setJobOtherReq(rst.getString("jobOtherReq"));
					list.add(rec);
					//isExist=true;
				} catch (SQLException e) {
					// TODO: handle exception
				}
			}
			db.closeRst();
			db.closeStat();
			db.closeConn();
		}
		return list;
	}
	public boolean insert()
	{
		boolean isSuccess=false;
		DbAccessBean db=new DbAccessBean();
		if(db.createConn())
		{
			String sql="insert into recruit values(null,'"+this.comId+"','"+this.comName+"','"+this.comTel+"',"
					+ "'"+this.comAddress+"','"+this.jobName+"','"+this.jobRequire+"','"+this.jobSalary+"','"+this.jobHireCount+"',"
					+ "'"+this.jobPublish+"','"+this.jobOtherReq+"')";
			System.out.println(sql); 
			if(db.update(sql))
			{
				isSuccess=true;
			}
			db.closeRst();
			db.closeStat();
			db.closeConn();
		}
	    return isSuccess;
	}
}
