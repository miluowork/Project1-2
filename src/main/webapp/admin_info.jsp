<%@page language="java" isELIgnored="false"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta http-equiv="Cache-Control" content="no-siteapp" />
        <link href="${pageContext.request.contextPath }/lib/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath }/lib/css/style.css"/>       
        <link href="${pageContext.request.contextPath }/lib/assets/css/codemirror.css" rel="stylesheet"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/lib/assets/css/ace.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath }/lib/font/css/font-awesome.min.css" />
		<script src="${pageContext.request.contextPath }/lib/js/jquery-1.9.1.min.js"></script>
		<script src="${pageContext.request.contextPath }/lib/assets/layer/layer.js" type="text/javascript" ></script>
        <script src="${pageContext.request.contextPath }/lib/assets/laydate/laydate.js" type="text/javascript"></script>  
        <script src="${pageContext.request.contextPath }/lib/assets/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath }/lib/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="${pageContext.request.contextPath }/lib/assets/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath }/lib/assets/js/jquery.dataTables.bootstrap.js"></script>
                      
<title>个人信息管理</title>
</head>

<body>
<div class="clearfix">
 <div class="admin_info_style">
   <div class="admin_modify_style" id="Personal">
     <div class="type_title">管理员信息</div>
      <div class="xinxi">
      
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">用户名:</label>
          <div class="col-sm-9"><input id="nike" type="text"  value="${requestScope.personal.nike}" class="col-xs-7 text_info" disabled="disabled">
          &nbsp;&nbsp;&nbsp;<a href="javascript:ovid()" onclick="change_Password()" class="btn btn-warning btn-xs">修改密码</a></div>
          </div>
          
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">性别: </label>
          <div class="col-sm-9">
             <span class="sex" >${requestScope.gender[requestScope.personal.sex]}</span>
             <input class="sex-hidden" type="hidden" value="${requestScope.personal.sex}"></input>
             <div class="add_sex" id="gender">
                <label><input name="form-field-radio" type="radio" class="ace" value="0"><span class="lbl">男</span></label>&nbsp;&nbsp;
                <label><input name="form-field-radio" type="radio" class="ace" value="1"><span class="lbl">女</span></label>
             </div>
           </div>
           
          </div>
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">移动电话: </label>
          <div class="col-sm-9"><input type="text" id="tel" value="${requestScope.personal.tel}" class="col-xs-7 text_info" disabled="disabled"></div>
          </div>
          
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">备注:</label>
          <div class="col-sm-9" ><input id="comments" type="text"  value="${requestScope.personal.comments}" class="col-xs-7 text_info" disabled="disabled"></div>
          </div>
          
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">权限: </label>
          <div class="col-sm-9" > <span>${requestScope.power[requestScope.personal.power]}</span></div>
          </div>
          
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">状态: </label>
          <div class="col-sm-9" > <span>${requestScope.status[requestScope.personal.status]}</span></div>
          </div>
          
          <div class="Button_operation clearfix"> 
				<button onclick="modify();" class="btn btn-danger radius" type="submit">修改信息</button>				
				<button onclick="save_info();" class="btn btn-success radius" type="button">保存修改</button>              
		  </div>
			
      </div>
    </div>
    
 </div>
</div>
 <!--修改密码样式-->
         <div class="change_Pass_style" id="change_Pass">
            <ul class="xg_style">
             <li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input name="password" type="password" class="" id="password"></li>
             <li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input name="newPassword" type="password" class="" id="Nes_pas"></li>
             <li><label class="label_name">确认密码</label><input name="againPassword" type="password" class="" id="c_mew_pas"></li>
            </ul>
         </div>
</body>
</html>
<script>

 //按钮点击事件
function modify(){
	 $('.text_info').attr("disabled", false);
	 $('.text_info').addClass("add");
	  $('#Personal').find('.xinxi').addClass("hover");
	  $('#Personal').find('.btn-success').css({'display':'block'});
	  
	   var num=$(".ace").size();
		 for(var i=0;i<num;i++){
			 if($('.ace').eq(i).val()==$('.sex-hidden').val()){
				 $(".ace").eq(i).prop("checked",true);
			 }
		 } 
	};
function save_info(){
	    var num=0;
		 var str="";
     $(".xinxi input[type$='text']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	 	
          else{
        	  var jsons={
					    "nike":$('#nike').val(),
	      				"tel":$('#tel').val(),
	      				"sex":$('#gender label input[name="form-field-radio"]:checked').val(),
	      				"comments":$('#comments').val(),
	      			      }
	        	  $.ajax({
	                  type:'POST',  //提交方法是POST
	                  url:'psChange', //请求的路径
	                  data:jsons, //以JSON字符串形式把 user 传到后台
	                  dataType:"text", //后台返回的数据类型是html文本
	                  timeout:3000,  //请求超时时间，毫秒
	                  error:function(){  //请求失败的回调方法
	                	  layer.msg('请求失败',{icon:1,time:1000});
	                  },
	                  success:function(result){ //请求成功的回调方法
	                      if(result!= "" && result == "success"){
	                    	  layer.msg('修改成功',{icon:1,time:1000});
	                      }
	                  }
	              });
			   /* layer.alert('修改成功！',{
               title: '提示框',				
			   icon:1,			   		
			  }); */
			  $('#Personal').find('.xinxi').removeClass("hover");
			  $('#Personal').find('.text_info').removeClass("add").attr("disabled", true);
			  $('#Personal').find('.btn-success').css({'display':'none'});
			   layer.close(index);
			
		  }		  		
	};	
 //初始化宽度、高度    
    $(".admin_modify_style").height($(window).height()); 
	$(".recording_style").width($(window).width()-400); 
    //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".admin_modify_style").height($(window).height()); 
	$(".recording_style").width($(window).width()-400); 
  });
  //修改密码
  function change_Password(nike){
	   layer.open({
    type: 1,
	title:'修改密码',
	area: ['300px','300px'],
	shadeClose: true,
	content: $('#change_Pass'),
	btn:['确认修改'],
	yes:function(index, layero){		
		   if ($("#password").val()==""){
			  layer.alert('原密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 
		  if ($("#Nes_pas").val()==""){
			  layer.alert('新密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 
		   
		  if ($("#c_mew_pas").val()==""){
			  layer.alert('确认新密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          }
		    if(!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val() )
        {
            layer.alert('密码不一致!',{
              title: '提示框',				
				icon:0,
			    
			 });
			 return false;
        }   
		 else{		
			 var jsons={
					    "nike":$('#nike').val(),
	      				"password":$('li input[name=password]').val(),
	      				"newPassword":$('li input[name=newPassword]').val(),
	      				"againPassword":$('li input[name=againPassword]').val(),
	      			      }
	        	  $.ajax({
	                  type:'POST',  //提交方法是POST
	                  url:'passwordChange', //请求的路径
	                  data:jsons, //以JSON字符串形式把 user 传到后台
	                  dataType:"text", //后台返回的数据类型是html文本
	                  timeout:3000,  //请求超时时间，毫秒
	                  error:function(){  //请求失败的回调方法
	                	  layer.msg('请求失败',{icon:1,time:1000});
	                  },
	                  success:function(result){ //请求成功的回调方法
	                      if(result!= "" && result == "success"){
	                    	  layer.msg('修改成功',{icon:1,time:1000});
	                          /* window.location.href='index.jsp'; */
	                      }else if(result=="pwdError"){
	                    	  layer.msg('原密码输入错误',{icon:1,time:1000});
	                      }else if(result=="againError"){
	                    	  layer.msg('新密码输入不一致',{icon:1,time:1000});
	                      }else{
	                    	  layer.msg('新密码不能和原密码相同',{icon:1,time:1000});
	                      }
	                  }
	              });
			  /* layer.alert('修改成功！',{
               title: '提示框',				
			icon:1,		
			  }); */
			  layer.close(index);       
		  }	 
	}
    });
	  }
</script>
<script>
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,6]}// 制定列不参与排序
		] } );
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
});</script>
