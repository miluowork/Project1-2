package service;

import java.util.List;

import entity.orders;
import util.SearchInfo;

    public interface orders_service  {
    	
    	public List<orders> select(SearchInfo info);
    	
    	public List<orders> page(SearchInfo info);
    	
    

    	public void delete(int id);

    	public void allDelete(SearchInfo info);

    	public void insert(orders ord);

    	public void update(orders ord);
    	
    	public void status(int status,int id);

    	public orders edit(int id);
}
