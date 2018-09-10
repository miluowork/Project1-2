package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import entity.carDetail;
import service.shopCar_service;
@Controller
@RequestMapping("ShopCar")
public class shopCar_controller {
	@Autowired
	shopCar_service service;
	
	@RequestMapping("carSelect")
	protected String carSelect(ModelMap mp)  {
		List<carDetail> carDetail=service.select();
		mp.put("carDetail",carDetail);
		return "ShopCar/index";
	}
}
