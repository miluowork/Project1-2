package Filter;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class loginFilter implements Filter {
	
	private Set<String> prefixIignores = new HashSet<String>();
	public void init(FilterConfig c) throws ServletException {
		String ex= c.getInitParameter("ex");
		String[] ignoreArray=ex.split(",");
		for (String s : ignoreArray) {
			prefixIignores.add(s);
		}
		
	  }
private boolean CanIgnore(HttpServletRequest req) {
	String url= req.getRequestURI();
	
	for (String ignore : prefixIignores) {
		if (url.endsWith(ignore)) {
			return true;
		}
	}
	return false;
	
}
	
	
	 public void doFilter(ServletRequest request, ServletResponse response,
	                       FilterChain fc) throws IOException, ServletException {
	    HttpServletRequest req = (HttpServletRequest) request;
	    HttpServletResponse res = (HttpServletResponse) response;
	    
	   
	    
	    if (CanIgnore(req)) {
	    
			fc.doFilter(req, res);
			return;
		}
	    
	   
	     
	    //�ж����û��ȡ���û���Ϣ,����ת����½ҳ��
	    if (req.getSession().getAttribute("nike")!=null) {
	    	
	    	 fc.doFilter(req, res);
	    	
	    
	    }
	    else {
	    	
	    	System.out.println("δͨ��");
	    	 System.out.println(req.getRequestURI());
	    	res.sendRedirect("login.jsp");
	    	
	    	
	    }
	  }
	
	

	public void destroy() {
		
	}

	
	}


