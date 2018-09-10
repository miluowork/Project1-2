package controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.operator;
import entity.orders;
import service.orders_service;
import util.SearchInfo;
import util.JsonUtil.JsonInfo;

	@Controller
	@RequestMapping("Orders")
	public class orders_controller{
		@Autowired
		orders_service service;
		
		
	@RequestMapping("index")
	protected String index(ModelMap mp,SearchInfo info ,Integer select ,String txt)  {
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		Date  date1=new Date();
		Date  date2=new Date();
		Date  date3=new Date();
		String dt=ft.format(date1);
		Calendar ca1 = Calendar.getInstance();
		Calendar ca2 = Calendar.getInstance();
		ca1.add(Calendar.DAY_OF_WEEK,-7);
		ca2.add(Calendar.DAY_OF_MONTH,-30);
		date2=ca1.getTime();
		date3=ca2.getTime();
		String startDate1=ft.format(date2);
		String startDate2=ft.format(date3);
		
		String limit=info.getLimit();
	    if (select==null)select=0; 
		String where ="";
		Integer counts;
		if (txt!=null&&txt.length()>0) {
			switch (select) {
			case 1:
				if(txt.equals("0")) {
					where=" WHERE a.date BETWEEN '"+dt+"' AND '"+dt+"'  " ;
				}else if(txt.equals("1")){
					where=" WHERE a.date BETWEEN '"+startDate1+"' AND '"+dt+"'  " ;
				}else{
					where=" WHERE a.date BETWEEN '"+startDate2+"' AND '"+dt+"'  " ;
				}
				System.out.println(where);
				break;
			default:
				where=" where a.code like '%"+txt+"%' ";
				System.out.println(where);
				break;
			}
		}
		mp.put("select", select);
		mp.put("txt",select!=null?"'"+txt+"'":txt);
		mp.put("status", orders.getStatuses());
		mp.put("assessStatus", orders.getAsStatus());
		mp.put("dateRange", orders.getDateRange());
		info.setWhere(where);
		info.setMaxpage(8/info.getMax()+1);
		mp.put("search", info);
		mp.put("list", service.select(info));
		return "Orders/Orderform";
	}


	/*@RequestMapping("insert")
	protected @ResponseBody JsonInfo  insert(ModelMap mp,orders ord ){
		service.insert(ord);
		return new JsonInfo(1, "");
	}*/
	@RequestMapping("update")
	protected @ResponseBody JsonInfo update(orders ord)  {
		service.update(ord);
		return new JsonInfo(1, "");
	}
	
	@RequestMapping("status")
	protected @ResponseBody JsonInfo status(@Param("status")Integer status,@Param("id") Integer id ,HttpServletRequest req)  {
		id=Integer.parseInt(req.getParameter("id"));
		status=Integer.parseInt(req.getParameter("status"));
		if(status==1) {
			status=2;
		}else if(status==4){
			status=5;
		}
		service.status(status,id);
		return new JsonInfo(1, "");
		
		
	}
	
	
		
	@RequestMapping("edit")
	protected String edit(int id,ModelMap mp)  {
		mp.put("info",service.edit(id));
		return add(mp);
	}

	@RequestMapping("add") 
	protected String  add(ModelMap mp) {
		mp.put("status", orders.getStatuses());
		mp.put("assessStatus", orders.getAsStatus());
		return "Orders/edit";
	}

	}


