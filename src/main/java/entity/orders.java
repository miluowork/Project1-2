package entity;
public class orders {
	public  static String [] statuses={"未支付","已支付","已发货","已收货","已退货","已取消"};
	public  static String [] asStatus={"已评价","未评价"};
	public  static String [] dateRange={"当天","本周内","本月内"};
	public static String[] getStatuses() {
		return statuses;
	}
	public static void setStatuses(String[] statuses) {
		orders.statuses = statuses;
	}
	public static String[] getAsStatus() {
		return asStatus;
	}
	public static void setAsStatus(String[] asStatus) {
		orders.asStatus = asStatus;
	}
	public static String[] getDateRange() {
		return dateRange;
	}
	public static void setDateRange(String[] dateRange) {
		orders.dateRange = dateRange;
	}


	int id;
	String date;
	String code;
	double amount;
	double nowamount;
	int address_id;
	int user_id;
	int assessStatus;
	int status;
	String comments;
	String email;
	String address;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public double getNowamount() {
		return nowamount;
	}
	public void setNowamount(double nowamount) {
		this.nowamount = nowamount;
	}
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getAssessStatus() {
		return assessStatus;
	}
	public void setAssessStatus(int assessStatus) {
		this.assessStatus = assessStatus;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
}
