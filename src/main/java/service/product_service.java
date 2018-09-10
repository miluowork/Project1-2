package service;

import java.util.List;
import entity.product;
import util.SearchInfo;

    public interface product_service {
    	
    	public List<product> select(SearchInfo info);
    	
    	public List<product> page(SearchInfo info);

    	public void delete(int id);

    	public void allDelete(SearchInfo info);

    	public void insert(product pt);

    	public void update(product pt);
    	
    	public void status(int status,int id);

    	public product edit(int id);
    
}
