package entity;

public class carDetail {

	int id;
	String email;
	String fullname;
	String info;
	String typename;
	int type_id;
	double price;
	double nowprice;
	int count;
	String pics;
	String status;
	String comments;
	
	
	
	
	
	
	
	
	
	public carDetail(int id, String email, String fullname, String info, String typename, int type_id, double price,
			double nowprice, int count, String pics, String status, String comments) {
		super();
		this.id = id;
		this.email = email;
		this.fullname = fullname;
		this.info = info;
		this.typename = typename;
		this.type_id = type_id;
		this.price = price;
		this.nowprice = nowprice;
		this.count = count;
		this.pics = pics;
		this.status = status;
		this.comments = comments;
	}
	public carDetail() {
		super();
	}
	
	public String[] getPiclist() {
		if(pics.length()<5)return new String[0];
		return pics.split(",");
	}
	public String getPic() {
		if(pics.length()<5)return null;
		String [] pic=pics.split(",");
		
		if(pic.length>0)
		return pic[0];
		else return null;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getPics() {
		return pics;
	}
	public void setPics(String pics) {
		this.pics = pics;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
}
