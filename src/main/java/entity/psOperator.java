package entity;

public class psOperator {
	public  static String [] genders={"��","Ů"};
	public  static String [] statuses={"����","��ְ"};
	public  static String [] powers={"��ͨ����Ա","��Ʒ�༭Ա","��������Ա","��������Ա"};
	
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
