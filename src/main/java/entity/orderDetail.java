package entity;

public class orderDetail {
	int id;
	int product_id;
	int order_id;
	double price;
	double nowprice;
	int count;
	String comments;
	String fullname;
	String code;
	
	
	
	
	
	public orderDetail(int id, int product_id, int order_id, double price, double nowprice, int count, String comments,
			String fullname, String code) {
		super();
		this.id = id;
		this.product_id = product_id;
		this.order_id = order_id;
		this.price = price;
		this.nowprice = nowprice;
		this.count = count;
		this.comments = comments;
		this.fullname = fullname;
		this.code = code;
	}
	public orderDetail() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getNowprice() {
		return nowprice;
	}
	public void setNowprice(double nowprice) {
		this.nowprice = nowprice;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	
	
}
