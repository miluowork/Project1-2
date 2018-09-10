<%@ page language="java"  isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
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
        <script src="../lib/assets/laydate/laydate.js" type="text/javascript"></script>
<title>管理员</title>
<script type="text/javascript">
var select=${requestScope.select};
var txt=${requestScope.txt}; 

$(document).ready(function(){
	 var num=$(".radius").size();
	 for(var i=0;i<num;i++){
		if($(".radius").eq(i).text()=="正常"){
			 $(".radius").eq(i).prop("class","label label-success radius");
			 $(".btn-change").eq(i).prop("class","btn btn-xs btn-change btn-success");
			 $(".fa-i").eq(i).prop("class","fa fa-i fa-check  bigger-120");
		 }else{
			 $(".radius").eq(i).prop("class","label label-defaunt radius");
			 $(".btn-change").eq(i).prop("class","btn btn-change btn-xs");
			 $(".fa-i").eq(i).prop("class","fa fa-i fa-close bigger-120");
		 }
	}  
});


function stachange(o,id,status){

	var jsons={
			"id":id,
			"status":status
		      }
	
	$.ajax({
		url : "status",	//请求url
		type : "post",	//请求类型  post|get
	 // data : "key=value&key1=value2",	//后台用 request.getParameter("key");
		dataType : "text",  //返回数据的 类型 text|json|html
		data:jsons,
		success : function(result){	//回调函数 和 后台返回的 数据
		
		    	 /*   $(o).parents("tr").find(".td-status").childern(".btn-change").text(result); */
		    	   window.location.reload(); 
		
		}
	});
};


function reset(id){

	var jsons={
			"id":id,
		      }
	
	$.ajax({
		url : "reset",	//请求url
		type : "post",	//请求类型  post|get
	 // data : "key=value&key1=value2",	//后台用 request.getParameter("key");
		dataType : "text",  //返回数据的 类型 text|json|html
		data:jsons,
		success : function(result){	//回调函数 和 后台返回的 数据
			layer.msg('重置成功',{icon:1,time:2000});
		   /*  window.location.reload(); */
		
		}
	});
};


function  show(url,w,h){
	layer.open({
		  type: 2,
		  area: [w+'px', h+'px'],
		  fixed: false, //不固定
		  maxmin: true,
		  content:url
		});
	
}
function openwin(){
	
	show("add",600,350);
};
function openwin1(id){
	show("edit?id="+id,600,350);
};

function del(id){
	layer.confirm('确认要删除吗？',function(){
		
		/* window.setTimeout("window.location.href='delete?id='+id",3000);  */
		location.href="delete?id="+id;
		layer.msg('已删除!',{icon:1,time:3000});
	});
};


function fresh(){
	location.href="Operator/index";
};

$(function(){
	         var s=$(".sele").val();
			 $(".sinput").css("display","none").prop("disabled","disabled");
			 $($(".sinput")[s]).css("display","inline").removeAttr("disabled").val(txt);
	 
			
});

$(document).on("change",".sele",function(){
	 $(".sinput").css("display","none").prop("disabled","disabled");
		$($(".sinput")[$(".sele").val()]).css("display","inline").removeAttr("disabled");
}); 

</script>
<style>
#products_list .table_menu_list{
margin-left: 0;
padding:0!important;
}
.table_menu_list{
width:100% !important;
}
.sorting_asc{
width:80px !important;
}
.dataTable{
margin-right: 20px;
}
.widget-box{
width:0 !important;
}
.table_menu_list{
padding-left: 0 !important;
}

</style>
</head>

<body>
<div class="page-content clearfix">
  <div class="administrator">
       <div class="d_Confirm_Order_style">
    <div class="search_style">
      
    <form action="index" method="post" >
       <ul class="search_content clearfix">
       
       <li>
       <select class="sele" name="select">
       <option value="0">管理员昵称</option>
       <option value="1">管理员姓名</option>
       <option value="2">手机号</option>
       <option value="3">管理员备注</option>
       <option value="4">管理员性别</option>
       <option value="5">管理员权限</option>
       <option value="6">管理员状态</option>
       </select>
       </li>
       
       <li><input name="txt" type="text"  class="text_add inputselect sinput" placeholder=""  style=" width:320px;"/></li>
       <li><input name="txt" type="text"  class="text_add inputselect sinput" placeholder=""  style=" width:320px;display:none"/></li>
       <li><input name="txt" type="text"  class="text_add inputselect sinput" placeholder=""  style=" width:320px;display:none"/></li>
       <li><input name="txt" type="text"  class="text_add inputselect sinput" placeholder=""  style=" width:320px;display:none"/></li>
      
       <li>
       <select  name="txt" class="inputselect sinput" style="height:30px;display:none">
			<c:forEach items="${requestScope.gender}" var="r" varStatus="v">
				<c:if test="${requestScope.info.sex!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.info.sex==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
			</c:forEach>
       </select>
       </li>
       <li>
       <select  name="txt" class="inputselect sinput" style="height:30px;display:none">
			<c:forEach items="${requestScope.power}" var="r" varStatus="v">
				<c:if test="${requestScope.info.power!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.info.power==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
			</c:forEach>
       </select>
       </li>
       <li>
       <select  name="txt" class="inputselect sinput" style="height:30px;display:none">
			<c:forEach items="${requestScope.status}" var="r" varStatus="v">
				<c:if test="${requestScope.info.status!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.info.status==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
			</c:forEach>
       </select>
       </li>
       <li style="width:90px;"><button type="submit" class="btn_search"><i class="fa fa-search"></i>查询</button></li>
       </ul>
    </form>
     
    </div>
    <!--操作-->
     <div class="border clearfix">
       <span class="l_f">
        <button  class="btn btn-warning"  onclick="openwin();"><i class="fa fa-plus"></i> 添加管理员</button> 
       </span>
     </div>
     <!--管理员列表-->
     <div class="h_products_list clearfix" id="products_list">
       <div id="scrollsidebar" class="left_Treeview">
        <!-- <div class="show_btn" id="rightArrow"><span></span></div> -->
        <div class="widget-box side_content" >
         <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
         <div class="side_list"><div class="widget-header header-color-green2"><h4 class="lighter smaller">产品类型列表</h4></div>
        
       </div>
      </div>  
     </div>
    <div class="table_menu_list"  id="testIframe">
    <!-- <div  class="dataTables_filter">
    <label>搜索:<input type="search" class="" placeholder="" aria-controls="sample_table">
    </label>
    </div> -->
    
       <table class="table table-striped table-bordered table-hover" id="sample_table">
		<thead>
		 <tr>
				<th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="80">昵称</th>
				<th width="100">姓名</th>
				<th width="80">性别</th>
				<th width="120">手机</th>
				<th width="150">权限</th>
				<th width="180">备注</th> 
				<th width="100">状态</th>
				<th width="180"></th>
		 </tr>
	    </thead>
	<tbody>
         <c:forEach items="${requestScope.list}" var="r">
         <tr>
          <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
          <td>${r.nike}</td>
          <td>${r.name}</td>
          <td>${requestScope.gender[r.sex]}</td>
          <td>${r.tel}</td>
          <td>${requestScope.power[r.power]}</td>
          <td>${r.comments}</td>
          <td class="td-status"><span class="label radius">${requestScope.status[r.status]}</span></td>
          <%-- <td>${requestScope.status[r.status]}</td> --%>
          <td class="td-manage">
            <a href="javascript:;"  title="停用"  onclick="stachange(this,${r.id},${r.status})" class=" btn btn-xs btn-change  btn-success"><i class="ss fa  fa-i fa-check  bigger-120"></i></a>  
            <a title="编辑" onclick="openwin1(${r.id})" href="javascript:;"  class="btn btn-xs btn-info" ><i class="fa fa-edit bigger-120"></i></a>       
            <a title="重置密码" onclick="reset(${r.id})" href="javascript:;"   class="btn btn-xs btn-success" ><i class="fa fa-check  bigger-120"></i></a>
          </td>
		</tr>
		</c:forEach>
    </tbody>
    </table>
    
<!-- <div class="row" >  -->  
<div class="col-sm-6">
<div class="dataTables_paginate paging_bootstrap" >
<ul class="pagination">
<li>
<%-- <button type="button" class="btn" onclick="location.href='Operator/index?pageno=${requestScope.search.prev}' "
value="prev">上一页</button>
</li>
<li class="active">
<button type="button" class="btn">${requestScope.search.pageno}</button>
</li>
<li>
<button type="button" class="btn" onclick="location.href='Operator/index?pageno=${requestScope.search.next}' "
value="next">下一页</button> --%>
</li>
</ul>
</div>
</div>
<!-- </div>  -->   
    
   
   
   
   
      </div>
     </div>
  </div>
</div>
 </div>
</body>
<script type="text/javascript">



jQuery(function($) {
		var oTable1 = $('#sample_table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,7,8,]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
					var off2 = $source.offset();
					var w2 = $source.width();
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			});

</script>
<script type="text/javascript">
$(function() { 
	 
	
	
	
	
	
	$("#administrator").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:50,//设置隐藏时的距离
	    spacingh:270,//设置显示时间距
	});
});
//字数限制
function checkLength(which) {
	var maxChars = 100; //
	if(which.value.length > maxChars){
	   layer.open({
	   icon:2,
	   title:'提示框',
	   content:'您输入的字数超过限制!',	
    });
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; //250 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
};
//初始化宽度、高度  
 $(".widget-box").height($(window).height()-215); 
$(".table_menu_list").width($(window).width()-260);
 $(".table_menu_list").height($(window).height()-215);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height()-215);
	 $(".table_menu_list").width($(window).width()-260);
	  $(".table_menu_list").height($(window).height()-215);
	})
 laydate({
    elem: '#start',
    event: 'focus' 
});

/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="fa fa-close bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}
/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="fa fa-check  bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});
	});
}
/*产品-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}

/*产品-删除*/
/* function del(int id){
	layer.confirm('确认要删除吗？',function(index){
		 location.href="delete?id="+id;
		layer.msg('已删除!',{icon:1,time:1000});
	});
} */
/*添加管理员*/
$('#administrator_add').on('click', function(){
	layer.open({
    type: 1,
	title:'添加管理员',
	area: ['700px',''],
	shadeClose: false,
	content: $('#add_administrator_style'),
	
	});
})
	//表单验证提交
$("#form-admin-add").Validform({
		
		 tiptype:2,
	
		callback:function(data){
		//form[0].submit();
		if(data.status==1){ 
                layer.msg(data.info, {icon: data.status,time: 1000}, function(){ 
                    location.reload();//刷新页面 
                    });   
            } 
            else{ 
                layer.msg(data.info, {icon: data.status,time: 3000}); 
            } 		  
			var index =parent.$("#iframe").attr("src");
			parent.layer.close(index);
			//
		}
		
		
	});	
</script>
</html>






