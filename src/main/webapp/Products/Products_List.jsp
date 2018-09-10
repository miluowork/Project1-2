<%@ page language="java" isELIgnored="false"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" /> 
        <link href="../lib/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../lib/css/style.css"/>       
        <link rel="stylesheet" href="../lib/assets/css/ace.min.css" />
        <link rel="stylesheet" href="../lib/assets/css/font-awesome.min.css" />
        <link rel="stylesheet" href="../lib/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
        <link href="../lib/Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />   
        <link rel="stylesheet" href="../layui-v2.3.0/layui/css/layui.css"/> 
        <link rel="stylesheet" href="../lib/font/css/font-awesome.min.css" />
	    <script src="../lib/js/jquery-1.9.1.min.js"></script>   
        <script src="../lib/assets/js/bootstrap.min.js"></script>
        <script src="../lib/assets/js/typeahead-bs2.min.js"></script>
		<script src="../lib/assets/js/jquery.dataTables.min.js"></script>
		<script src="../lib/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="../lib/js/H-ui.js"></script> 
        <script type="text/javascript" src="../lib/js/H-ui.admin.js"></script> 
        <script src="../lib/assets/layer/layer.js" type="text/javascript" ></script>
        <script src="../layui-v2.3.0/layui/layui.js" type="text/javascript" ></script>
        <script src="../lib/assets/laydate/laydate.js" type="text/javascript"></script>
        <script type="text/javascript" src="../lib/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script> 
        <script src="../lib/js/lrtk.js" type="text/javascript" ></script>
<title>产品列表</title>
<script type="text/javascript">
var select=${requestScope.select};
var txt=${requestScope.txt};

$(document).ready(function(){
	
	 var num=$(".radius").size();
	 for(var i=0;i<num;i++){
		if($(".radius").eq(i).text()=="售卖中"){
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
	show("add",100,100);
};
function openwin1(id){
	show("edit?id="+id,100,100);
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

function fresh(){
	location.href="index";
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

  
 
 

layui.use('element', function(){
	
	  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
	  
	  //监听导航点击
	  element.on('nav(demo)', function(elem){
	    layer.msg(elem.text());
	  });
	});


	  
</script>

<style type="text/css">
#products_list .table_menu_list{
margin-left: 0;
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
<div class=" page-content clearfix">
 <div id="products_style">
    <div class="search_style">
     
     <form action="index" method="post" >
       <ul class="search_content clearfix">
       
       <li>
       <select class="sele" name="select">
       <option value="0">商品名称</option>
       <option value="1">商品类型</option>
       <option value="2">商品状态</option>
       </select>
       </li>
       
       <li><input name="txt" type="text"  class="text_add inputselect sinput" placeholder=""  style=" width:320px;"/></li>
       <li>
       <select  name="txt" class="inputselect sinput" style="height:30px;display:none">
      
			<c:forEach items="${requestScope.tpList}" var="r" varStatus="v">
				<c:if test="${requestScope.info.type_id!=r.id}">
					<option value="${r.id}">${r.name}</option>
				</c:if>
				<c:if test="${requestScope.info.status==r.id}">
					<option selected="selected" value="${r.id}">${r.name}</option>
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
     <div class="border clearfix">
       <span class="l_f">
        <a onclick="openwin();" title="添加商品" class="btn btn-warning Order_form"><i class="icon-plus"></i>添加商品</a>
        <!-- <a href="javascript:ovid()" class="btn btn-danger"><i class="icon-trash"></i>批量删除</a> -->
       </span>
     </div>
     <!--产品列表展示-->
     <div class="h_products_list clearfix" id="products_list">
       <div id="scrollsidebar" class="left_Treeview">
        <!-- <div class="show_btn" id="rightArrow"><span></span></div> -->
        <div class="widget-box side_content" >
         <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
         <div class="side_list"><div class="widget-header header-color-green2"><h4 class="lighter smaller">产品类型列表</h4></div>
        
       </div>
      </div>  
     </div>
         <div class="table_menu_list" id="testIframe">
      <table class="layui-hide" id="LAY_table_user" lay-filter="user"></table>
        <table class=" table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th width="80px">产品名称</th>
				<th width="80px">产品类型</th>
				<th width="80px">图片</th>
				<th width="100px">活动</th>
				<th width="100px">提示信息</th>
                <th width="100px">促销信息</th>				
				<th width="80px">详情</th>
                <th width="80px">原价</th>
				<th width="70px">现价</th>                
				<th width="80px">库存</th>               
				<th width="100px">优先级</th>
				<th width="70px">评论</th>                
				<th width="50px">状态</th>
				<th width="80px">操作</th>
			</tr>
		</thead>
	<tbody style="height:300px;border:1px solid red">
	
     <c:forEach items="${requestScope.list}" var="r">
     
         <tr>
          <td>${r.fullname}</td>
          <td>${r.typename}</td>
          <td>
				<c:if test="${r.pic!=null}">
				<img src="${r.pic}" width="60" height="90"/>
				</c:if>
		  </td>
          <td>${r.activity}</td>
          <td>${r.tip}</td>
          <td>${r.sale}</td>
          <td><a onclick="openwin2(${r.id})" href="javascript:;" >商品详情</a></td>
          <td>${r.price}</td>
          <td>${r.nowprice}</td>
          <td>${r.collectcount}</td>
          <td>${r.priority}</td>
          
          <td>${r.comments}</td>
          <td class="td-status"><span class="label radius">${requestScope.status[r.status]}</span></td>
          <td class="td-manage">
           <!--  <a href="javascript:;" title="停用"  class=" btn btn-xs btn-change  btn-success"><i class="ss fa  fa-i fa-check  bigger-120"></i></a>  -->
            <a title="编辑" onclick="openwin1(${r.id})" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a> 
            <a title="删除" href="javascript:;"   onclick="del(${r.id})" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>
         </td>
	    </tr>
	  </c:forEach>
    </tbody>
   </table>
        
    </div>     
  </div>
 </div>
</div>
</body>
</html>
<script>
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,8,9]}// 制定列不参与排序
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
 laydate({
    elem: '#start',
    event: 'focus' 
});
$(function() { 
	$("#products_style").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:30,//设置隐藏时的距离
	    spacingh:260,//设置显示时间距
	});
});
</script>
<script type="text/javascript">
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
 
/*******树状图*******/
var setting = {
	view: {
		dblClickExpand: false,
		showLine: false,
		selectedMulti: false
	},
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: ""
		}
	},
	callback: {
		beforeClick: function(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			if (treeNode.isParent) {
				zTree.expandNode(treeNode);
				return false;
			} else {
				demoIframe.attr("src",treeNode.file + ".html");
				return true;
			}
		}
	}
};

var zNodes =[
	{ id:1, pId:0, name:"商城分类列表", open:true},
	{ id:11, pId:1, name:"蔬菜水果"},
	{ id:111, pId:11, name:"蔬菜"},
	{ id:112, pId:11, name:"苹果"},
	{ id:113, pId:11, name:"大蒜"},
	{ id:114, pId:11, name:"白菜"},
	{ id:115, pId:11, name:"青菜"},
	{ id:12, pId:1, name:"手机数码"},
	{ id:121, pId:12, name:"手机 "},
	{ id:122, pId:12, name:"照相机 "},
	{ id:13, pId:1, name:"电脑配件"},
	{ id:131, pId:13, name:"手机 "},
	{ id:122, pId:13, name:"照相机 "},
	{ id:14, pId:1, name:"服装鞋帽"},
	{ id:141, pId:14, name:"手机 "},
	{ id:42, pId:14, name:"照相机 "},
];
		
var code;
		
function showCode(str) {
	if (!code) code = $("#code");
	code.empty();
	code.append("<li>"+str+"</li>");
}
		
$(document).ready(function(){
	var t = $("#treeDemo");
	t = $.fn.zTree.init(t, setting, zNodes);
	demoIframe = $("#testIframe");
	demoIframe.bind("load", loadReady);
	var zTree = $.fn.zTree.getZTreeObj("tree");
	zTree.selectNode(zTree.getNodeByParam("id",'11'));
});	
/*产品-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*产品-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
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
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Order_form').on('click', function(){
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
</script>