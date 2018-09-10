package serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dao.orderDeatail_dao;
import entity.orderDetail;
import entity.orders;
import service.orderDeatail_service;
@Service
public class orderDeatail_serviceImp implements orderDeatail_service {
	@Autowired
	orderDeatail_dao dao ;
	
	 public List<orderDetail> orderDetail(int id){
		return dao.orderDetail(id);
	}
}
