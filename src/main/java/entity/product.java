package entity;

public class product {
	public  static String [] statuses={"售卖中","已下架"};
	public  static int [] prioritys={0,1,2};
	
	int id;
	String fullname;
	String activity;
	String tip;
	String sale;
	String info;
	String typename;
	int type_id;
	int price;
	int nowprice;
	int collectcount;
	int salecount;
	int priority;
	String pics;
	String status;
	String comments;
	
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
	
	public static String[] getStatuses() {
		return statuses;
	}
	public static void setStatuses(String[] statuses) {
		product.statuses = statuses;
	}
	public static int[] getPrioritys() {
		return prioritys;
	}
	public static void setPrioritys(int[] prioritys) {
		product.prioritys = prioritys;
	}
	
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
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
	public String getActivity() {
		return activity;
	}
	public void setActivity(String activity) {
		this.activity = activity;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public String getSale() {
		return sale;
	}
	public void setSale(String sale) {
		this.sale = sale;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info.replace("\"", "\'");
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getNowprice() {
		return nowprice;
	}
	public void setNowprice(int nowprice) {
		this.nowprice = nowprice;
	}
	public int getCollectcount() {
		return collectcount;
	}
	public void setCollectcount(int collectcount) {
		this.collectcount = collectcount;
	}
	public int getSalecount() {
		return salecount;
	}
	public void setSalecount(int salecount) {
		this.salecount = salecount;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
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
