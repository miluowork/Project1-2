<%@ page language="java" isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="../layui-v2.3.0/layui/css/layui.css"  media="all">
  <link rel="stylesheet" href="../lib/font/css/font-awesome.min.css" /> 
  <script src="../lib/js/jquery-1.9.1.min.js"></script>
  <script src="../layui-v2.3.0/layui/layui.js" charset="utf-8"></script>
  <script type="text/javascript" src="../fileupload/js/piclist.js"></script>
  <script type="text/javascript" src="../Uediter/ueditor.config.js"></script>
  <script type="text/javascript" src="../Uediter/ueditor.all.min.js"></script>
  <script type="text/javascript" src="../Uediter/ueditor.parse.min.js"></script>
<script type="text/javascript" >



function save() {
	
	$.post($(".f1").attr("action"),$(".f1").serialize(),function(json){
		if(json.status>0){
			parent.fresh();
			var index=parent.layer.getFrameIndex(window.name);
		parent.layer.close(Operator/index);
		
		}else{
			alert(json.text);
		}
			0
	},"json");
	}

</script>
<style type="text/css">
label{
font-family: "微软雅黑";
font-size: 16px;
}
input[type=text]{
                font-family: "微软雅黑";
                border: 1px #A3D3E9 solid; 
                border-radius: 5px;
}
 select{   
                font-family: "微软雅黑";
                background: rgba(0,0,0,0);
                width: 249px;
                height: 40px;
                font-size: 18px;
                text-align: center;
                border: 1px #70B347 solid;
                border-radius: 1px;
            }
            option{
                color: black;
                background: #fff;
                line-height: 20px;
            }
            select:focus{
                border: 2px #ECF5FA solid;
                box-shadow: 0 0 15px 1px #008080;
            }
            option:hover{
                background: #EBCCD1;
            }

</style>
</head>
<body>
<c:if test="${requestScope.info==null}">
  <form class="f1" action="insert" method="post">
</c:if>
 	<c:if test="${requestScope.info!=null}">
 	<form class="f1" action="update" method="post">	
	<input type="hidden" name="id" value="${requestScope.info.id}">	
</c:if>

<form class="layui-form layui-form-pane" action="">
  
  <div class="layui-form-item">
    <label class="layui-form-label">产品名称:</label>
    <div class="layui-input-inline">
      <input value="${requestScope.info.fullname}" name="fullname" type="text" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <%-- <div class="layui-form-item">
    <label class="layui-form-label">产品类型:</label>
    <div class="layui-input-inline">
      <input value="${requestScope.info.type_id}" name="type_id" type="text" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div> --%>
  
  <div class="layui-form-item">
    <label class="layui-form-label">产品类型:</label>
    <div class="layui-input-block select-div">
      <select name="type_id" class="s1" lay-filter="aihao">
        <c:forEach items="${requestScope.tpList}"  var="r" varStatus="v">
          <c:if test="${r.parentName!=null}">
	          <c:if test="${requestScope.info.type_id!=r.id}">
	               <option value="${r.id}">${r.name}</option>
	          </c:if>
	          <c:if test="${requestScope.info.type_id==r.id}">
	               <option selected="selected" value="${r.id}">${r.name}</option>
	          </c:if>
	      </c:if>
         </c:forEach>
      </select>
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">活动:</label>
    <div class="layui-input-inline">
      <input value="${requestScope.info.activity}" name="activity" type="text" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">提示信息:</label>
    <div class="layui-input-inline">
      <input value="${requestScope.info.tip}" name="tip" type="text" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">促销信息:</label>
    <div class="layui-input-inline">
      <input value="${requestScope.info.sale}" name="sale" type="text" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  
   <div class="layui-form-item">
    <label class="layui-form-label">原价:</label>
    <div class="layui-input-inline">
      <input value="${requestScope.info.price}" name="price" type="text" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">现价:</label>
    <div class="layui-input-inline">
      <input value="${requestScope.info.nowprice}" name="nowprice" type="text" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">收藏量:</label>
    <div class="layui-input-inline">
      <input value="${requestScope.info.collectcount}" name="collectcount" type="text" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  
   <div class="layui-form-item">
    <label class="layui-form-label">销量:</label>
    <div class="layui-input-inline">
      <input value="${requestScope.info.salecount}" name="salecount" type="text"  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">评论:</label>
    <div class="layui-input-inline">
      <input value="${requestScope.info.comments}" name="comments" type="text" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">优先级</label>
    <div class="layui-input-block select-div">
      <select name="priority" class="s1" lay-filter="aihao">
        <c:forEach items="${requestScope.priority}"  var="r" varStatus="v">
	          <c:if test="${requestScope.info.priority!=v.index}">
	               <option value="${v.index}">${r}</option>
	          </c:if>
	          <c:if test="${requestScope.info.priority==v.index}">
	               <option selected="selected" value="${v.index}">${r}</option>
	          </c:if>
         </c:forEach>
      </select>
    </div>
  </div>
  
  
  <div class="layui-form-item">
    <label class="layui-form-label">状态</label>
    <div class="layui-input-block select-div">
      <select name="status" class="s1" lay-filter="aihao">
        <c:forEach items="${requestScope.status}"  var="r" varStatus="v">
	          <c:if test="${requestScope.info.status!=v.index}">
	               <option value="${v.index}">${r}</option>
	          </c:if>
	          <c:if test="${requestScope.info.status==v.index}">
	               <option selected="selected" value="${v.index}">${r}</option>
	          </c:if>
         </c:forEach>
      </select>
    </div>
  </div>
  
  
  <div class="layui-form-item">
    <label class="layui-form-label">图片预览:</label>
    <div class="layui-input-inline">
       <div class="picList" name="pics"  width="500"  height="400" rows="3" cols="5" >
				<c:forEach items="${requestScope.info.piclist}" var="p">
				<item url="${p}" ></item>
				</c:forEach>
	   </div>
    </div>
  </div>
  
  
  <div class="layui-form-item">
    <label class="layui-form-label">详情</label>
    <div class="layui-input-inline">
      <script id="container" type="text/plain" style="width:1024px;height:500px;">
      </script>
    </div>
  </div>
    
  <div class="layui-form-item">
    <button type="button" onclick="save()" style="left:230px;top:200px"  class="layui-btn" lay-submit="" lay-filter="demo2">保存</button>
  </div>
</form>


<script>
var ue = UE.getEditor('container');
ue.ready(function() {
    //设置编辑器的内容
    ue.setContent("${requestScope.info.info}");
    //获取html内容，返回: <p>hello</p>
    var html = ue.getContent();
    //获取纯文本内容，返回: hello
    var txt = ue.getContentTxt();
});

layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  //日期
  laydate.render({
    elem: '#date'
  });
  laydate.render({
    elem: '#date1'
  });
  
  /* //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor'); */
 
  //自定义验证规则
  form.verify({
    title: function(value){
      if(value.length < 5){
        return '标题至少得5个字符啊';
      }
    }
    ,pass: [/(.+){6,12}$/, '密码必须6到12位']
    ,content: function(value){
      layedit.sync(editIndex);
    }
  });
  
  //监听指定开关
  form.on('switch(switchTest)', function(data){
    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
      offset: '6px'
    });
    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
  });
  
  //监听提交
  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    return false;
  });
 
  //表单初始赋值
  form.val('example', {
    "username": "贤心" // "name": "value"
    ,"password": "123456"
    ,"interest": 1
    ,"like[write]": true //复选框选中状态
    ,"close": true //开关状态
    ,"sex": "女"
    ,"desc": "我爱 layui"
  })
  
  
});


</script>















<%-- <div class="add_menber" id="add_menber_style" >
    <ul class=" page-content">
     <li><label class="label_name">产品名称：</label><span class="add_name"><input value="${requestScope.info.fullname}" name="fullname" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">产品类型:</label><span class="add_name"><input value="${requestScope.info.type_id}" name="type_id" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">活动:</label><span class="add_name"><input value="${requestScope.info.activity}" name="activity" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">提示信息:</label><span class="add_name"><input value="${requestScope.info.tip}" name="tip" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">促销信息:</label><span class="add_name"><input value="${requestScope.info.sale}" name="sale" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">原价:</label><span class="add_name"><input value="${requestScope.info.price}" name="price" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">现价:</label><span class="add_name"><input value="${requestScope.info.nowprice}" name="nowprice" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">库存:</label><span class="add_name"><input value="${requestScope.info.collectcount}" name="collectcount" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">销量:</label><span class="add_name"><input value="${requestScope.info.salecount}" name="salecount" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">评论:</label><span class="add_name"><input value="${requestScope.info.comments}" name="comments" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
    
     
     <li><label class="label_name">优先级:</label><span class="add_name">
     <select name="priority" class="inputselect"  >
          <c:forEach items="${requestScope.priority}"  var="r" varStatus="v">
	          <c:if test="${requestScope.info.priority!=v.index}">
	               <option value="${v.index}">${r}</option>
	          </c:if>
	          <c:if test="${requestScope.info.priority==v.index}">
	               <option selected="selected" value="${v.index}">${r}</option>
	          </c:if>
         </c:forEach>
     </select>
     </span><div class="prompt r_f"></div>
     </li>
     
     <li><label class="label_name">状态：</label><span class="add_name">
        <select name="status" class="inputselect"  >
          <c:forEach items="${requestScope.status}"  var="r" varStatus="v">
	          <c:if test="${requestScope.info.status!=v.index}">
	               <option value="${v.index}">${r}</option>
	          </c:if>
	          <c:if test="${requestScope.info.status==v.index}">
	               <option selected="selected" value="${v.index}">${r}</option>
	          </c:if>
         </c:forEach>
       </select>
     </span><div class="prompt r_f"></div>
     </li>
     <li><label class="label_name">图片:</label>
     <span class="add_name">
            <div class="picList" name="pics"  width="300"  height="200+" rows="2" cols="5" >
				<c:forEach items="${requestScope.info.piclist}" var="p">
				<item url="${p}" ></item>
				</c:forEach>
			</div>
     </span><div class="prompt r_f"></div></li>
     <li>
      <script id="container" type="text/plain" >
       
      </script>
     </li>     
			
		
	
    </ul>
 </div>
 <div class="add_menber" id="add_menber_style">
		<button class="btn" type="button" onclick="save()" style="left:230px"  >保存</button>
</div>
</form>
<script type="text/javascript">
        var ue = UE.getEditor('container');ue.ready(function() {
            //设置编辑器的内容
            ue.setContent("${requestScope.info.info}");
            //获取html内容，返回: <p>hello</p>
            var html = ue.getContent();
            //获取纯文本内容，返回: hello
            var txt = ue.getContentTxt();
        });
        
        
</script> --%>
</body>
</html>