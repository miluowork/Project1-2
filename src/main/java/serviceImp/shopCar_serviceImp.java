package serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.shopCar_dao;
import entity.carDetail;
import service.shopCar_service;
@Service
public class shopCar_serviceImp implements shopCar_service {
	@Autowired
	shopCar_dao dao ;
	
	public List<carDetail> select() {
		return dao.select();
	}

}
