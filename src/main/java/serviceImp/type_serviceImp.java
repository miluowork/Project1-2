package serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dao.type_dao;
import entity.type;
import service.type_service;

@Service
/*@Transactional*/
public class type_serviceImp implements type_service{
	@Autowired
	type_dao dao ;

	public List<type> select() {
		return dao.select();
	}

}
