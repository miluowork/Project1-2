package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.product;
import entity.type;
import service.product_service;
import service.type_service;
import util.SearchInfo;
import util.JsonUtil.JsonInfo;

	@Controller
	@RequestMapping("Products")
	public class product_controller{
		@Autowired
		product_service service;
		@Autowired
		type_service tpService;
		
		
	@RequestMapping("index")
	protected String index(ModelMap mp,SearchInfo info ,Integer select ,String txt)  {
		System.out.println(4156);
		System.out.println(txt);
		String limit=info.getLimit();
	    if (select==null)select=0; 
		String where ="";
		Integer counts;
		if (txt!=null&&txt.length()>0) {
			switch (select) {
			case 1:
				where=" where b.id = '"+txt+"' ";
				System.out.println(where);
				break;
			case 2:
				where=" where a.status = '"+txt+"' " ;
				System.out.println(where);
				System.out.println(select);
				break;
			default:
				where=" where a.fullname like '%"+txt+"%' ";
				System.out.println(where);
				break;
			}
		}
		List<type> tpList =tpService.select();
		mp.put("tpList", tpList);
		mp.put("select", select);
		mp.put("txt",select!=null?"'"+txt+"'":txt);
		mp.put("status", product.getStatuses());
		mp.put("priority",product.getPrioritys());
		info.setWhere(where);
//		counts=service.page(info).get(0).getCount();
//		System.out.println(counts);
		/*info.setMaxpage(20/info.getMax()+1);*/
		/*System.out.println(info.getMaxpage());
		System.out.println(info.getPageno()+"ҳ");*/
		mp.put("search", info);
		mp.put("list", service.select(info));
		return "Products/Products_List";
	}
	
	@RequestMapping("info")
	protected String info(int id,ModelMap mp,SearchInfo info ,Integer select ,String txt)  {
		System.out.println(56);
		String limit=info.getLimit();
	    if (select==null)select=0; 
		String where ="";
		Integer counts;
		if (txt!=null&&txt.length()>0) {
			switch (select) {
			case 1:
				where=" where b.name like '%"+txt+"%' ";
				System.out.println(where);
				break;
			case 2:
				where=" where a.status = '"+txt+"' " ;
				/*System.out.println(where);*/
				/*System.out.println(select);*/
				break;
			default:
				where=" where a.fullname like '%"+txt+"%' ";
				/*System.out.println(where);*/
				break;
			}
		}
		
		mp.put("select", select);
		mp.put("txt",select!=null?"'"+txt+"'":txt);
		mp.put("status", product.getStatuses());
		mp.put("priority",product.getPrioritys());
		info.setWhere(where);
//		counts=service.page(info).get(0).getCount();
//		System.out.println(counts);
		info.setMaxpage(20/info.getMax()+1);
		/*System.out.println(info.getMaxpage());
		System.out.println(info.getPageno()+"ҳ");*/
		mp.put("search", info);
		mp.put("lists", service.edit(id));
		return "Products/info";
	}
	 
	@RequestMapping("delete")
	protected String delete(int id){
		service.delete(id);
		 return "redirect:index";
	}
	@RequestMapping("allDelete")
	public String allDelete(SearchInfo info,String ids){
		System.out.println(ids);
		info.setIds(ids);
		service.allDelete(info);
		return "redirect:index";
	}


	@RequestMapping("insert")
	protected @ResponseBody JsonInfo  insert(ModelMap mp,product pt){
		System.out.println("insert");
		service.insert(pt);
		return new JsonInfo(1, "");
	}
	@RequestMapping("update")
	protected @ResponseBody JsonInfo update(product pt)  {
		service.update(pt);
		return new JsonInfo(1, "");
	}
	
	@RequestMapping("status")
	protected @ResponseBody JsonInfo status(@Param("status")Integer status,@Param("id") Integer id ,HttpServletRequest req)  {
		id=Integer.parseInt(req.getParameter("id"));
		status=Integer.parseInt(req.getParameter("status"));
		if(status==0) {
			status=1;
		}else {
			status=0;
		}
		service.status(status,id);
		return new JsonInfo(1, "");
		
		
	}
		
	@RequestMapping("edit")
	protected String edit(int id,ModelMap mp)  {
		List<type> tpList =tpService.select();
		mp.put("tpList", tpList);
		mp.put("info",service.edit(id));
		return add(mp);
	}

	@RequestMapping("add") 
	protected String  add(ModelMap mp) {
		List<type> tpList =tpService.select();
		mp.put("tpList", tpList);
		System.out.println("add");
		mp.put("status", product.getStatuses());
		mp.put("priority",product.getPrioritys());
		return "Products/edit";
		
	}

	}


