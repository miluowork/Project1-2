package service;

import java.util.List;
import entity.operator;
import entity.psOperator;
import util.SearchInfo;

    public interface operator_service {
    	
	public List<operator> select(SearchInfo info);
	
	public List<operator> page(SearchInfo info);
	
	public void delete(int id);
	
	public void allDelete(SearchInfo info);
	
	public void insert(operator op);

	public void update(operator op);
	
	public void pwdChange(String password,int id);
	
	public void psChange(psOperator po);
	
	public void status(int status,int id);

	public operator edit(int id);
	
	public operator login(String nike);
	
	public void reset(int id);
}
