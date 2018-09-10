<%@ page language="java"  isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
        <link href="../lib/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../lib/css/style.css"/>       
        <link href="../lib/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="../lib/assets/css/ace.min.css" />
        <link rel="stylesheet" href="../lib/font/css/font-awesome.min.css" />
		<script src="../lib/js/jquery-1.9.1.min.js"></script>
        <script src="../lib/assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../lib/js/H-ui.js"></script>     
		<script src="../lib/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="../lib/assets/js/jquery.dataTables.min.js"></script>
		<script src="../lib/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="../lib/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="../lib/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="../lib/assets/js/jquery.easy-pie-chart.min.js"></script>
        <script src="../lib/js/lrtk.js" type="text/javascript" ></script>
<title>订单管理</title>
<style type="text/css">
.list_right_style{
margin-left: 0;
width:100% !important;
margin-right: 20px;

}
</style>
<script type="text/javascript">

$(document).ready(function(){
	
	 var num=$(".radius").size();
	 
	 for(var i=0;i<num;i++){
    /*  $(".btn-send").prop("display","none");
	 $(".btn-cancel").prop("display","none"); */
	/*  $(".btn-delete").prop("display","none"); */
		 
		if($(".radius").eq(i).text()=="已支付"){
			 $(".btn-send").eq(i).prop("class","btn btn-send btn-xs btn-success");
			 $(".i-send").eq(i).prop("class","fa i-send fa-cubes bigger-120");
		 }else if($(".radius").eq(i).text()=="已退货"){
			 $(".btn-cancel").eq(i).prop("class","btn btn-xs btn-cancel btn-success");
			 $(".i-cancel").eq(i).prop("class","fa i-cancel fa-i fa-close bigger-120");
		 }else{
			 //消除样式
			 $(".btn-send").prop("display","none");
			 $(".btn-cancel").prop("display","none");
			 $(".btn-delete").prop("display","none");
		 }
	}  
});


/* function infos(id){

	var jsons={
			"id":id,
		      }
	
	$.ajax({
		url : "../OrdersDetail/Detail",	
		type : "post",	//请求类型  post|get
		dataType : "text",  //返回数据的 类型 text|json|html
		data:jsons,
		success : function(result){	//回调函数 和 后台返回的 数据
		         if(result=="success"){
		        	 location.href="OrderDetail.jsp";
		         }else{
		        	 location.reload();
		         }
		}
	});
}; */

function  show(url,w,h){
	layer.open({
		  type: 2,
		  area: [w+'%', h+'%'],
		  fixed: false, //不固定
		  maxmin: true,
		  content:url
		});
	
};

function openwin(){
	show("add",80,80);
};
function openwin1(id){
	show("edit?id="+id,80,80);
};
function openwin2(id){
	show("info?id="+id,100,100);
};
function del(id){
	layer.confirm('确认要删除吗？',function(){
		
		/* window.setTimeout("window.location.href='delete?id='+id",3000);  */
		location.href="delete?id="+id;
		layer.msg('已删除!',{icon:1,time:3000});
	});
};
/* function search(){   	  
	      var d=document.getElementById("name").value;
	      if(d){
	    	  location.href="index?name="+d;
	    	  alert(d);
	      }else{
	    	  location.href="index";
	      }
	   }  
 */
function fresh(){
	location.href="index";
};

 /* $(function(){
	         var s=$(".sele").val();
			 $(".sinput").css("display","none").prop("disabled","disabled");
			 $($(".sinput")[s]).css("display","inline").removeAttr("disabled").val(txt);
			
}); */ 

/*  $(document).on("change",".sele",function(){
	 $(".sinput").css("display","none").prop("disabled","disabled");
		$($(".sinput")[$(".sele").val()]).css("display","inline").removeAttr("disabled");
});  */ 

  
 
 

layui.use('element', function(){
	
	  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
	  
	  //监听导航点击
	  element.on('nav(demo)', function(elem){
	    layer.msg(elem.text());
	  });
	});


	  

</script>
</head>

<body>
<div class="margin clearfix ">
 <div class="cover_style " id="cover_style">
  <div class="row" id="centent_style">
   <div id="covar_list" class="order_list">
    <div class="list_right_style row">
     <div class="search_style">
      <form action="index" method="post" >
	      <ul class="search_content clearfix">
	       <li>
		       <select class="sele" name="select">
		       <option value="0">商品编号</option>
		       <option value="1">日期范围</option>
		       </select>
           </li>
           <li><input name="txt" type="text"  class="text_add inputselect sinput" placeholder="" style=" width:320px;"/></li>
           <li>
	       <select  name="txt" class="inputselect sinput" style="height:30px;display:none">
			<c:forEach items="${requestScope.dateRange}" var="r" varStatus="v">
					<option value="${v.index}">${r}</option>
			</c:forEach>
           </select>
	       </li>
	       <li style="width:90px;"><button type="submit" class="btn_search"><i class="fa fa-search"></i>查询</button></li>
	      </ul>
	  </form>
	 </div>
      <!--订单列表展示-->
       <table class="table table-striped table-bordered table-hover " id="sample-table">
		<thead>
		
		 <tr>
				<th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="80px">订单编号</th>
				<th width="100px">订单日期</th>
				<th width="70px">原金额</th>
				<th width="80px">实际金额</th>
                <th width="100px">地址</th>				
				<th width="100px">用户</th>
				<th width="70px">备注</th>
                <th width="80px">评论状态</th>
				<th width="70px">状态</th>
				<th width="200px">操作</th>
			</tr>
		</thead>
	<tbody>
	<c:forEach items="${requestScope.list}" var="r">
	     <tr>
		     <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
		     <td>${r.code}</td>
		     <td>${r.date}</td>
		     <td>${r.amount}</td>
		     <td>${r.nowamount}</td>
		     <td>${r.address}</td>
		     <td>${r.email}</td>
		     <td>${r.comments}</td>
		     <td>${requestScope.assessStatus[r.assessStatus]}</td>
		     <td class="td-status">
		     <span class="label label-success radius">${requestScope.status[r.status]}</span></td>
		     <td>
			     
			     <a onClick="Delivery_stop(this,${r.id},${r.status})"  href="javascript:;" title="发货"  class="btn-send"><i class="i-send"></i></a> 
			     <a onClick="product_stop(this,${r.id},${r.status})" href="javascript:;" title="取消发货" style="text-decoration:none" class="btn-cancel" ><i class="i-cancel"></i></a>
			     <a title="订单详细"  href="../OrdersDetail/Detail?id=${r.id}"  class="btn btn-xs btn-info order_detailed" ><i class="fa fa-list bigger-120"></i></a> 
			     <a title="删除" href="javascript:;"  onclick="Order_form_del(this,${r.id})" class="btn-delete" ><i class="i-delete"></i></a>    
			</td>
	     </tr>
     </c:forEach>
     </tbody>
     </table>
     </div>
   </div>
 </div>
</div>
</div>
 <!--发货-->
 <div id="Delivery_stop" style=" display:none">
  <div class="">
    <div class="content_style">
  <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">快递公司 </label>
       <div class="col-sm-9"><select class="form-control" id="form-field-select-1">
																<option value="">--选择快递--</option>
																<option value="1">天天快递</option>
																<option value="2">圆通快递</option>
																<option value="3">中通快递</option>
																<option value="4">顺丰快递</option>
																<option value="5">申通快递</option>
																<option value="6">邮政EMS</option>
																<option value="7">邮政小包</option>
																<option value="8">韵达快递</option>
															</select></div>
	</div>
   <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 快递号 </label>
    <div class="col-sm-9"><input type="text" id="form-field-1" placeholder="快递号" class="col-xs-10 col-sm-5" style="margin-left:0px;"></div>
	</div>
    <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">货到付款 </label>
     <div class="col-sm-9"><label><input name="checkbox" type="checkbox" class="ace" id="checkbox"><span class="lbl"></span></label></div>
	</div>
 </div>
  </div>
 </div>
</body>
</html>
<script>
 $(function() { 
	$("#cover_style").fix({
		float : 'top',
		minStatue : false,
		skin : 'green',	
		durationTime :false,
		window_height:30,//设置浏览器与div的高度值差
		spacingw:0,//
		spacingh:0,//
		close_btn:'.yingchan_btn',
		show_btn:'.xianshi_btn',
		side_list:'.hide_style',
		widgetbox:'.top_style',
		close_btn_width:60,	
		da_height:'#centent_style,.left_Treeview,.list_right_style',	
		side_title:'.b_n_btn',		
		content:null,
		left_css:'.left_Treeview,.list_right_style'
		
		
	});
});
//左侧显示隐藏
$(function() { 
	$("#covar_list").fix({
		float : 'left',
		minStatue : false,
		skin:false,	
		//durationTime :false,
		spacingw:50,//设置隐藏时的距离
	    spacingh:270,//设置显示时间距
		stylewidth:'220',
		close_btn:'.close_btn',
		show_btn:'.show_btn',
		side_list:'.side_list',
		content:'.side_content',
		widgetbox:'.widget-box',
		da_height:null,
		table_menu:'.list_right_style'
	});
});
//时间选择
 laydate({
    elem: '#start',
    event: 'focus' 
});
/*订单-删除*/
function Order_form_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		var jsons={
				"id":id,
			      }
		$.ajax({
			url : "delete",	//请求url
			type : "get",	//请求类型  post|get
			dataType : "json",  //返回数据的 类型 text|json|html
			data:jsons,
			success : function(){	//回调函数 和 后台返回的 数据
				$(obj).parents("tr").remove();
			}
		});
		
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
/**发货**/
function Delivery_stop(obj,id,status){
	layer.open({
        type: 1,
        title: '发货',
		maxmin: true, 
		shadeClose:false,
        area : ['500px' , ''],
        content:$('#Delivery_stop'),
		btn:['确定','取消'],
		yes: function(index, layero){		
		if($('#form-field-1').val()==""){
			layer.alert('快递号不能为空！',{
               title: '提示框',				
			  icon:0,		
			  }) 
			
			}else{			
			 layer.confirm('提交成功！',function(index){
				$(obj).remove;
		//ajax传值 id status
		var jsons={
				"id":id,
				"status":status
			      }
		$.ajax({
			url : "status",	//请求url
			type : "get",	//请求类型  post|get
			dataType : "json",  //返回数据的 类型 text|json|html
			data:jsons,
			success : function(){	//回调函数 和 后台返回的 数据
				
			    console.log($(obj));
			    $(obj).parents("tr").find(".td-manage").prepend('<a style=" display:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="已发货"><i class="fa fa-cubes bigger-120"></i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发货</span>');
			}
		});
		//
		layer.msg('已发货!',{icon: 6,time:1000});
			});  
			layer.close(index);    		  
		  }
		
		}
	})
};
//取消钮
function product_stop(obj,id,status){
	
	layer.confirm('确认要取消吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style=" display:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="已发货"><i class="fa fa-cubes bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已取消</span>');
		$(obj).remove();
		var jsons={
				"id":id,
				"status":status
			      }
		$.ajax({
			url : "status",	//请求url
			type : "get",	//请求类型  post|get
			dataType : "json",  //返回数据的 类型 text|json|html
			data:jsons,
			success : function(){	//回调函数 和 后台返回的 数据
			       
			}
		});
		layer.msg('已取消订单!',function(){
			console.log(obj);			
			$(obj).parents("tr").children("td:last-child").find("a:last-child").prop("class","btn btn-delete btn-xs btn-warning");
			$(obj).parents("tr").children("td:last-child").find("a:last-child i").prop("class","fa fa-trash i-delete bigger-120");
		});
		
	});
	
};
//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Order_form,.order_detailed').on('click', function(){
	var cname = $(this).attr("title");
	var chref = $(this).attr("href");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe').html(cname);
    parent.$('#iframe').attr("src",chref).ready();;
	parent.$('#parentIframe').css("display","inline-block");
	parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
    parent.layer.close(index);
	
});

//初始化宽度、高度  
  var heights=$(".top_style").outerHeight()+47; 
 $(".centent_style").height($(window).height()-heights); 
 $(".page_right_style").width($(window).width()-220);
 $(".left_Treeview,.list_right_style").height($(window).height()-heights-2); 
 $(".list_right_style").width($(window).width()-250);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".centent_style").height($(window).height()-heights); 
	 $(".page_right_style").width($(window).width()-220);
	 $(".left_Treeview,.list_right_style").height($(window).height()-heights-2);  
	 $(".list_right_style").width($(window).width()-250);
	}) 
//比例
var oldie = /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase());
			$('.easy-pie-chart.percentage').each(function(){
				$(this).easyPieChart({
					barColor: $(this).data('color'),
					trackColor: '#EEEEEE',
					scaleColor: false,
					lineCap: 'butt',
					lineWidth: 10,
					animate: oldie ? false : 1000,
					size:103
				}).css('color', $(this).data('color'));
			});
		
			$('[data-rel=tooltip]').tooltip();
			$('[data-rel=popover]').popover({html:true});
</script>
<script>
//订单列表
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,1,2,3,4,5,6,7,8,9]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			
			
			
			});
</script>