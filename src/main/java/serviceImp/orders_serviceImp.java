package serviceImp;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dao.operator_dao;
import dao.orders_dao;
import entity.operator;
import entity.orders;
import service.operator_service;
import service.orders_service;
import util.SearchInfo;
@Service
public class orders_serviceImp implements orders_service {
	@Autowired
	orders_dao dao ;
	public List<orders> select(SearchInfo info) {
		return dao.select(info);
	}
	public void delete(int id) {
		dao.delete(id);
	}

	public void allDelete(SearchInfo info) {
		dao.allDelete(info);
	}

	public void insert(orders ord) {
		dao.insert(ord);
	}

	public void update(orders ord) {
		dao.update(ord);
	}

	public orders edit(int id) {
		return dao.edit(id);
	}
	public List<orders> page(SearchInfo info) {
		return dao.page(info);
    }
	public void  status(int status,int id) {
		 dao.status(status,id);		
	}
	
	
	

}
