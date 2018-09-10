package serviceImp;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dao.product_dao;
import entity.product;
import service.product_service;
import util.SearchInfo;
@Service
public class product_serviceImp implements product_service {
	@Autowired
	product_dao dao ;
	public List<product> select(SearchInfo info) {
		return dao.select(info);
	}
	public void delete(int id) {
		dao.delete(id);
	}

	public void allDelete(SearchInfo info) {
		dao.allDelete(info);
	}

	public void insert(product pt) {
		dao.insert(pt);
	}

	public void update(product pt) {
		dao.update(pt);
	}

	public product edit(int id) {
		return dao.edit(id);
	}
	public List<product> page(SearchInfo info) {
		return dao.page(info);
    }
	public void  status(int status,int id) {
		 dao.status(status,id);		
	}
	
	

}
