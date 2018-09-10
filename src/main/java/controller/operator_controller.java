package controller;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;

import entity.operator;
import entity.psOperator;
import service.operator_service;
import util.SearchInfo;
import util.JsonUtil.JsonInfo;

	@Controller
	@RequestMapping("Operator")
	public class operator_controller{
		@Autowired
		operator_service service;
		
	@RequestMapping("index")
	protected String index(ModelMap mp,SearchInfo info ,Integer select ,String txt)  {
		String limit=info.getLimit();
	    if (select==null)select=0; 
		String where ="";
		Integer counts;
		if (txt!=null&&txt.length()>0) {
			switch (select) {
			case 1:
				where=" where name like '%"+txt+"%' ";
				System.out.println(where);
				break;
			case 2:
				where=" where tel = '"+txt+"' " ;
				System.out.println(where);
				System.out.println(select);
				break;
			case 3:
				where=" where comments = '"+txt+"' " ;
				System.out.println(where);
				System.out.println(select);
				break;
			case 4:
				where=" where sex = '"+txt+"' " ;
				System.out.println(where);
				break;
			case 5:
				where=" where power = '"+txt+"' " ;
				System.out.println(where);
				break;
			case 6:
				where=" where status = '"+txt+"' " ;
				System.out.println(where);
				break;
			
			default:
				where=" where nike like '%"+txt+"%' " ;
				System.out.println(where);
				break;
			}
		}
		
		mp.put("select", select);
		mp.put("txt",select!=null?"'"+txt+"'":txt);
		mp.put("gender", operator.getGenders());
		mp.put("power", operator.getPowers());
		mp.put("status", operator.getStatuses());
		info.setWhere(where);
//		counts=service.page(info).get(0).getCount();
//		System.out.println(counts);
		info.setMaxpage(8/info.getMax()+1);
		/*System.out.println(info.getMaxpage());
		System.out.println(info.getPageno()+"页");*/
		mp.put("search", info);
		mp.put("list", service.select(info));
		return "Operator/administrator";
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
	protected @ResponseBody JsonInfo  insert(ModelMap mp,operator us){
		service.insert(us);
		return new JsonInfo(1, "");
	}
	@RequestMapping("update")
	protected @ResponseBody JsonInfo update(operator us)  {
		service.update(us);
		return new JsonInfo(1, "");
	}
	
	@RequestMapping("status")
	protected @ResponseBody String status(@Param("status")Integer status,@Param("id") Integer id ,HttpServletRequest req)  {
		String result="";
		id=Integer.parseInt(req.getParameter("id"));
		status=Integer.parseInt(req.getParameter("status"));
		if(status==0) {
			status=1;
			result="正常";
		}else {
			status=0;
			result="离职";
		}
		service.status(status,id);
		return result;
	}
	
	@RequestMapping("reset")
	protected @ResponseBody String reset(Integer id ,HttpServletRequest req)  {
		service.reset(id);
		String result="重置成功";
		return result;
	}
		
	@RequestMapping("edit")
	protected String edit(int id,ModelMap mp)  {
		mp.put("info",service.edit(id));
		return add(mp);
	}

	@RequestMapping("add") 
	protected String  add(ModelMap mp) {
		System.out.println("add");
//		System.out.println(claservice.select());
		mp.put("gender",operator.getGenders());
		mp.put("power", operator.getPowers());
		mp.put("status", operator.getStatuses());
		return "Operator/edit";
		
	}
	
	@RequestMapping("login") 
	protected @ResponseBody String login(String nike,String password,String verificationCode,HttpSession session) {
		System.out.println(nike);
		System.out.println(password);
		System.out.println(verificationCode);
		System.out.println(session.getAttribute("randomCode").toString());
		String result="noUser";
		operator loginList=service.login(nike);
		if(verificationCode.equalsIgnoreCase(session.getAttribute("randomCode").toString())) {
			if(loginList==null){
				result="noUser";
			}else{
			   if(password.equals(loginList.getPassword()) ) {
				   session.setAttribute("nike",nike);
				   session.setMaxInactiveInterval(3600);
				   System.out.println(session.getAttribute("nike"));
			   result="success";
			     }else {
				result="noPwd";
			     }
		    }	
		}else {
			result="noCode";
		}
		
		return result;
	
	}
	
	@RequestMapping("passwordChange") 
	protected @ResponseBody String passwordChange(String nike, String password,String newPassword,String againPassword) {
		System.out.println(password);
		String result;
		operator loginList=service.login(nike);
		System.out.println(loginList.getPassword());
		if(!loginList.getPassword().equals(password)){
			result="pwdError";
		}else{
		   if(!newPassword.equals(loginList.getPassword())&& newPassword.equals(againPassword)){
			 service.pwdChange(againPassword, loginList.getId());
		     result="success";
		     }else if(!newPassword.equals(againPassword)){
			   result="againError";
		     }else{
		       result="pwdSameError";
		     }
	    }
		return result;
	}
	@RequestMapping("psChange")
	protected @ResponseBody String psChange(psOperator po,ModelMap mp)  {
		String result;
		operator loginList=service.login(po.getNike());
		po.setId(loginList.getId());
		service.psChange(po);
		result="success";
		mp.put("result", result);
		mp.put("personal",loginList);
		mp.put("gender",operator.getGenders());
		mp.put("status",operator.getStatuses());
		mp.put("power",operator.getPowers());
		
		return result;
	}
	
	@RequestMapping("exit")
	protected String exit(ModelMap mp,HttpServletRequest req)  {
		System.out.println(123);
		HttpSession session = req.getSession(); 
		session.invalidate();
		return "redirect:../login";
		
	}
	
	@RequestMapping("personal")
	protected String personal(String nike,ModelMap mp)  {
		operator loginList=service.login(nike);
		mp.put("personal",loginList);
		mp.put("gender",operator.getGenders());
		mp.put("status",operator.getStatuses());
		mp.put("power",operator.getPowers());
		return "admin_info";
	}


}