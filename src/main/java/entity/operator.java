package entity;

public class operator {
	public  static String [] genders={"��","Ů"};
	public  static String [] statuses={"����","��ְ"};
	public  static String [] powers={"��ͨ����Ա","��Ʒ�༭Ա","��������Ա","��������Ա"};
	Integer count;
	int id;
	String nike;
	String password;
	String name;
	int sex;
	String tel;
	int power;
	int status;
	String comments;
	
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
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
	public operator() {
		super();
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
	
	
	
}
