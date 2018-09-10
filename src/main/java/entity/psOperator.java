package entity;

public class psOperator {
	public  static String [] genders={"男","女"};
	public  static String [] statuses={"正常","离职"};
	public  static String [] powers={"普通操作员","商品编辑员","订单管理员","超级管理员"};
	
	int id;
	String nike;
	int sex;
	String tel;
	String comments;
	
	
	public psOperator() {
		super();
	}
	public static String[] getGenders() {
		return genders;
	}
	public static String[] getStatuses() {
		return statuses;
	}
	public static String[] getPowers() {
		return powers;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNike() {
		return nike;
	}
	public void setNike(String nike) {
		this.nike = nike;
	}
	
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
	
	
	
}
