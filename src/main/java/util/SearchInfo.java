package util;

public class SearchInfo {
	int max = 100;
	

	Integer pageno = 1;
	String where="";
	String limit=" limit " + (pageno - 1) * max + "," + max;
	String ids;
	Integer Maxpage=100;
	
	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}
	
	public Integer getMaxpage() {
		return Maxpage;
	}

	public void setMaxpage(Integer maxpage) {
		Maxpage = maxpage;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public Integer getPageno() {
		return pageno;
	}
	
	public Integer getNext() {
		return  pageno<Maxpage?pageno+1:pageno;
	}
	
	public Integer getPrev() {
		return pageno>1?pageno-1:1;
	}

	public void setPageno(Integer pageno) {
		if (pageno == null || pageno < 1)
			pageno = 1;
		this.pageno = pageno;
		limit = " limit " + (pageno - 1) * max + "," + max;
	}
	
	public void setCanPage(boolean iscan) {
		if(!iscan) limit="";
	}

	
	

	public String getWhere() {
		return where;
	}

	public void setWhere(String where) {
		this.where = where;
	}

	public String getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}

}
