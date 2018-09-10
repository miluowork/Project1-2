<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="../lib/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../lib/css/style.css"/>       
        <link href="../lib/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="../lib/assets/css/ace.min.css" />
        <link rel="stylesheet" href="../lib/assets/css/font-awesome.min.css" />

		<script type="text/javascript">
			window.jQuery || document.write("<script src='../lib/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>
		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='../lib/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="../lib/assets/js/bootstrap.min.js"></script>
		<script src="../lib/assets/js/typeahead-bs2.min.js"></script>
		<script src="../lib/assets/js/jquery.dataTables.min.js"></script>
		<script src="../lib/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="../lib/js/H-ui.js"></script> 
        <script type="text/javascript" src="../lib/js/H-ui.admin.js"></script> 
        <script src="../lib/assets/layer/layer.js" type="text/javascript" ></script>
        <script src="../lib/assets/laydate/laydate.js" type="text/javascript"></script>
        <script type="text/javascript" src="../lib/assets/js/user_list.js"></script>
<title>用户列表</title>
</head>

<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
      <div class="d_Confirm_Order_style">
    <div class="search_style">
     
      <ul class="search_content clearfix">
       <li><label class="l_f">会员名称</label><input name="" type="text"  class="text_add" placeholder="输入会员名称、电话、邮箱"  style=" width:400px"/></li>
       <li><label class="l_f">添加时间</label><input class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>
       <li style="width:90px;"><button type="button" class="btn_search"><i class="icon-search"></i>查询</button></li>
      </ul>
    </div>
     <!---->
     <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" onclick="openwin()" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加用户</a>
        <a href="javascript:ovid()" class="btn btn-danger"><i class="icon-trash"></i>批量删除</a>
       </span>
       <span class="r_f">共：<b>2345</b>条</span>
     </div>
     <!---->
     <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="80">昵称</th>
				<th width="100">姓名</th>
				<th width="80">性别</th>
				<th width="120">手机</th>
				<th width="150">权限</th>
				<th width="100">状态</th>
				<th width="180">评论</th>
                
			</tr>
		</thead>
	<tbody>
		<c:forEach items="${requestScope.list}" var="r">
        <tr>
          <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
          <td>${r.nike}</td>
          <td>${r.name}</td>
          <td>${r.sex}</td>
          <td>${r.tel}</td>
          <td>${r.power}</td>
          <td>${requestScope.genders[r.gender]}</td>
          <td>${r.comments}</td>
          <button title="停用" onClick="member_stop(this,'10001')" class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></button> 
          <button title="编辑" onclick="member_edit('310')"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></button> 
          <button title="删除" onclick="member_del(this,'1')" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></button>
          </td>
		</tr>
		</c:forEach>
         <tr>
          <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
          <td>3</td>
          <td><u style="cursor:pointer" class="text-primary" onclick="member_show('张小泉','member-show.html','10301','500','400')">张小泉</u></td>
          <td>男</td>
          <td>13000000000</td>
          <td>admin@mail.com</td>
          <td class="text-l">北京市 海淀区</td>
          <td>2014-6-11 11:11:42</td>
          <td>银牌用户</td>
          <td class="td-status"><span class="label label-success radius">已启用</span></td>
          <td class="td-manage">
          <a onClick="member_stop(this,'10001')"  href="javascript:;" title="停用"  class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a> 
          <a title="编辑" onclick="member_edit('410')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a> 
         
          <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>
          </td>
		</tr>
      </tbody>
	</table>
   </div>
  </div>
 </div>
</div>
<!--添加用户图层-->
<div class="add_menber" id="add_menber_style" style="display:none">
  
    <ul class=" page-content">
     <li><label class="label_name">用&nbsp;&nbsp;户 &nbsp;名：</label><span class="add_name"><input value="" name="用户名" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">真实姓名：</label><span class="add_name"><input name="真实姓名" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span class="add_name">
     <label><input name="form-field-radio" type="radio" checked="checked" class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">女</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">保密</span></label>
     </span>
     <div class="prompt r_f"></div>
     </li>
     <li><label class="label_name">固定电话：</label><span class="add_name"><input name="固定电话" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">移动电话：</label><span class="add_name"><input name="移动电话" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">电子邮箱：</label><span class="add_name"><input name="电子邮箱" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li class="adderss"><label class="label_name">家庭住址：</label><span class="add_name"><input name="家庭住址" type="text"  class="text_add" style=" width:350px"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="add_name">
     <label><input name="form-field-radio1" type="radio" checked="checked" class="ace"><span class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio1"type="radio" class="ace"><span class="lbl">关闭</span></label></span><div class="prompt r_f"></div></li>
    </ul>
 </div>
</body>
</html>
