package controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import entity.orderDetail;
import service.orderDeatail_service;
@Controller
@RequestMapping("OrdersDetail")
public class orderDetail_controller {

	@Autowired
	orderDeatail_service service;
	@RequestMapping("Detail")
	protected  String Detail(int id,ModelMap mp){
		List<orderDetail> od=service.orderDetail(id);
		mp.put("oDetail",od);
		return "Orders/OrderDetail";
	}
}
