<%@ page language="java" isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
        <link href="../lib/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../lib/css/style.css"/>       
        <link href="../lib/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="../lib/assets/css/ace.min.css" />
        <link rel="stylesheet" href="../lib/font/css/font-awesome.min.css" />
        <link rel="stylesheet" href="../lib/assets/css/layer.css" />
		<script src="../lib/js/jquery-1.9.1.min.js"></script>
        <script src="../lib/assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../lib/Widget/Validform/5.3.2/Validform.min.js"></script>
		<script src="../lib/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="../lib/assets/js/jquery.dataTables.min.js"></script>
		<script src="../lib/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="../lib/assets/layer/layer.js" type="text/javascript" ></script>          
		<script src="../lib/js/lrtk.js" type="text/javascript" ></script>
        <script src="../lib/assets/layer/layer.js" type="text/javascript"></script>	
        <script src="../lib/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="../lib/assets/laydate/laydate.js" type="text/javascript"></script>

<script type="text/javascript" >



function save() {
	
	$.post($(".f1").attr("action"),$(".f1").serialize(),function(json){
		if(json.status>0){
			parent.fresh();
			var index=parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
		
		}else{
			alert(json.text);
		}
	},"json");
	}

</script>
</head>
<body>
<c:if test="${requestScope.info==null}">
  <form class="f1" action="insert" method="post">
</c:if>
 	<c:if test="${requestScope.info!=null}">
 	<form class="f1" action="update" method="post">	
	<input type="hidden" name="id" value="${requestScope.info.id}">	
</c:if>
<div class="add_menber" id="add_menber_style" >
    <ul class=" page-content">
     <li><label class="label_name">昵称：</label><span class="add_name"><input value="${requestScope.info.nike}" name="nike" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <%-- <li><label class="label_name">密码：</label><span class="add_name"><input value="${requestScope.info.password}" name="password" type="password"  class="text_add"/></span><div class="prompt r_f"></div></li> --%>
     <li><label class="label_name">真实姓名：</label><span class="add_name"><input value="${requestScope.info.name}" name="name" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">移动电话：</label><span class="add_name"><input value="${requestScope.info.tel}" name="tel" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">备注：</label><span class="add_name"><input value="${requestScope.info.comments}" name="comments" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">性别：</label><span class="add_name">
     <select name="sex" class="inputselect"  >
          <c:forEach items="${requestScope.gender}"  var="r" varStatus="v">
	          <c:if test="${requestScope.info.sex!=v.index}">
	               <option value="${v.index}">${r}</option>
	          </c:if>
	          <c:if test="${requestScope.info.sex==v.index}">
	               <option selected="selected" value="${v.index}">${r}</option>
	          </c:if>
         </c:forEach>
     </select>
     </span><div class="prompt r_f"></div>
     </li>
     
     <li><label class="label_name">权限：</label><span class="add_name">
     <select name="power" class="inputselect"  >
          <c:forEach items="${requestScope.power}"  var="r" varStatus="v">
	          <c:if test="${requestScope.info.power!=v.index}">
	               <option value="${v.index}">${r}</option>
	          </c:if>
	          <c:if test="${requestScope.info.power==v.index}">
	               <option selected="selected" value="${v.index}">${r}</option>
	          </c:if>
         </c:forEach>
    </select>
     </span><div class="prompt r_f"></div></li>
     <li><label class="label_name">状态：</label><span class="add_name">
     <select name="status" class="inputselect"  >
          <c:forEach items="${requestScope.status}" var="r" varStatus="v">
	          <c:if test="${requestScope.info.status!=v.index}">
	               <option value="${v.index}">${r}</option>
	          </c:if>
	          <c:if test="${requestScope.info.status==v.index}">
	               <option selected="selected" value="${v.index}">${r}</option>
	          </c:if>
         </c:forEach>
    </select>
     </span><div class="prompt r_f"></div></li>
    </ul>
 </div>
 <div class="add_menber" id="add_menber_style">
		<button class="btn" type="button" onclick="save()" style="left:50px"  >保存</button>
</div>
</form>
</body>
</html>