<%@ page language="java" isELIgnored="false"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="/lib/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="/lib/assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="/lib/assets/css/ace.min.css" />
		<link rel="stylesheet" href="/lib/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="/lib/assets/css/ace-skins.min.css" />
        <link rel="stylesheet" href="/lib/css/style.css"/>
		<script src="/lib/assets/js/ace-extra.min.js"></script>
		<script src="/lib/js/jquery-1.9.1.min.js"></script>        
        <script src="/lib/assets/layer/layer.js" type="text/javascript"></script>
<title>登录</title>
<style type="text/css">
.inline{
margin-left:58px;
}
</style>
</head>
<body class="login-layout Reg_log_style">
<div class="logintop">    
    <span>欢迎后台管理界面平台</span>    
    <ul>
    <li><a href="#">返回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    <div class="loginbody">
<div class="login-container">
	<div class="center" >
	     <img style="width:20%;height:20%;"  src="/lib/images/MyHeart.jpg"/>
							</div>

						<div class="space-6"></div>
							<div class="position-relative">
								<div id="login-box" class="login-box widget-box no-border visible">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<!-- <i class="icon-coffee green"></i> -->
												管理员登录
											</h4>

											<div class="login_icon"><img src="/lib/images/login.png" /></div>

											<form id="login-form"  class="" action="" method="post">
												<fieldset>
										<ul>
   <li class="frame_style form_error"><label class="user_icon"></label><input name="nike" type="text"  id="username"/><i>用户名</i></li>
   <li class="frame_style form_error"><label class="password_icon"></label><input name="password" type="password"   id="userpwd"/><i>密码</i></li>
   <li class="frame_style form_error"><label class="Codes_icon"></label><input name="verificationCode" type="text"   id="Codes_text" value="" /><img  src="img"  onclick="this.src='img?a='+(a++) "/></div></li>
   
  </ul>
													<div class="space"></div>

													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" class="ace">
															<span class="lbl">保存密码</span>
														</label>

														<button type="button" class="width-35 pull-right btn btn-sm btn-primary" id="login_btn">
															<!-- <i class="icon-key"></i> -->
															登录
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>

											<div class="social-or-login center">
												<span class="bigger-110">通知</span>
											</div>

											<div class="social-login center">
											本网站系统不再对IE8以下浏览器支持，请见谅。
											</div>
										</div><!-- /widget-main -->

										<div class="toolbar clearfix">
											

											
										</div>
									</div><!-- /widget-body -->
								</div><!-- /login-box -->
							</div><!-- /position-relative -->
						</div>
                        </div>
                        <div class="loginbm">版权所有  2016  <a href="">南京思美软件系统有限公司</a> </div><strong></strong>


<script>
var a=0;
$('#login_btn').on('click', function(){
	     var num=0;
		 var str="";
     $("input[type$='text'],input[type$='password']").each(function(n){
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
        	 /*  var jsons={
      				"nike":$('#login-form input[name=nike]').val(),
      				"password":$('#login-form input[name=password]').val(),
      				"verificationCode":$('#login-form input[name=verificationCode]').val(),
      			           } */
        	  $.ajax({
                  type:'POST',  //提交方法是POST
                  url:'Operator/login', //请求的路径
                  data:$("#login-form").serialize(), //表单序列化         //以JSON字符串形式把 user 传到后台
                  dataType:"text", //后台返回的数据类型是html文本
                  timeout:3000,  //请求超时时间，毫秒
                  error:function(){  //请求失败的回调方法
                	  layer.msg('请求失败',{icon:1,time:1000});
                  },
                  success:function(result){ //请求成功的回调方法
                      if(result!= "" && result == "success"){
                    	  layer.msg('登陆成功',{icon:1,time:1000});
                          window.location.href='index.jsp';
                      }else if(result=="noUser"){
                    	  layer.msg('用户名不存在',{icon:1,time:1000});
                      }else if(result=="noPwd"){
                    	  layer.msg('密码不正确',{icon:1,time:1000});
                      }else{
                    	  layer.msg('验证码不正确',{icon:1,time:1000});
                      }
                  }
              });
			  /* layer.alert('登录成功！',{
               title: '提示框',				
			   icon:1,		
			  }); */
	          
			  /*  layer.close(index);	 */
		  }		 	     						
		
	});
  $(document).ready(function(){
	 $("input[type='text'],input[type='password']").blur(function(){
        var $el = $(this);
        var $parent = $el.parent();
        $parent.attr('class','frame_style').removeClass(' form_error');
        if($el.val()==''){
            $parent.attr('class','frame_style').addClass(' form_error');
        }
    });
	$("input[type='text'],input[type='password']").focus(function(){		
		var $el = $(this);
        var $parent = $el.parent();
        $parent.attr('class','frame_style').removeClass(' form_errors');
        if($el.val()==''){
            $parent.attr('class','frame_style').addClass(' form_errors');
        } else{
			 $parent.attr('class','frame_style').removeClass(' form_errors');
		}
		});
	  })

</script>
</body>
</html>
