package serviceImp;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dao.operator_dao;
import entity.operator;
import entity.psOperator;
import service.operator_service;
import util.SearchInfo;
@Service
public class operator_serviceImp implements operator_service {
	@Autowired
	 operator_dao dao ;
	public List<operator> select(SearchInfo info) {
		return dao.select(info);
	}
	public void delete(int id) {
		dao.delete(id);
	}

	public void allDelete(SearchInfo info) {
		dao.allDelete(info);
	}

	public void insert(operator op) {
		dao.insert(op);
	}

	public void update(operator op) {
		dao.update(op);
	}

	public operator edit(int id) {
		return dao.edit(id);
	}
	public List<operator> page(SearchInfo info) {
		return dao.page(info);
    }
	public void  status(int status,int id) {
		 dao.status(status,id);		
	}
	public operator login(String nike) {
		return dao.login(nike);
	}
	public void pwdChange(String password, int id) {
		dao.pwdChange(password, id);
		
	}
	public void psChange(psOperator po) {
		dao.psChange(po);
		
	}
	public void reset(int id) {
		dao.reset(id);
		
	}
	
	

}
