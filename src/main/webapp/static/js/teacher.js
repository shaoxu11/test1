//显示老师的全部信息
function allTeacher(){
	$(".page-contents").removeClass();
	  	$("#aa").load("teacher/index .page-contents");
}

//模糊查询老师的信息
function findTeacher(){
	var ise={
 	  		"student_name": $("#student_name").val(),
 	  		"class_id" :	$("#class_id").val()
 	  	}
 	  	$(".page-contents").removeClass();
 	  	$("#aa").load("teacher/findTeacher .page-contents",ise);
}
//回显老师的信息
function modifyTeacher(id){
	var ise = {"id":id}
	$(".page-contents").removeClass();
	$("#aa").load("teacher/modifyTeacher .page-contents",ise);
}
//修改老师的信息
function updateTeacher(id){
	var student_name=$("#student_name").val();
	var student_gender=$('input[type="radio"]:checked').val();
	var student_age = $("#student_age").val();
	var studnet_phone=$("#student_phone").val();
	var student_card = $("#student_card").val();
	var class_id = $("#class_id").val();
	var address_name =$("#address_name").val();
	if(student_name =="" || student_name ==null){
		alert("请填写姓名!");
	}else if(student_age == "" || student_age == null){
		alert("请填写年龄!");
	}else if(student_phone =="" || student_phone == null){
		alert("请填写手机号码!");
	}else if(student_card == "" || student_card == null){
		alert("请填写身份证号!");
	}else if(address_name =="" || address_name==null)	{
		alert("请填写地址");
	}else{
		$.ajax({
			url			:		"teacher/updateTeacher",
			type		:		"post",
			data		:		{
			
				"student_name"		:		student_name,
				"student_gender"	:		student_gender,
				"student_age"		:		student_age,
				"student_phone"		:		studnet_phone,
				"student_card"		:		student_card,
				"class_id"			:		class_id,
				"id"				:		id,
				"address_name"		:		address_name
			},
			success		:		function(data){
					var json = eval('('+data+')');
					if(json.status ==1){
					alert("修改成功!");
					allTeacher();
					}else{
					alert("修改失败!");
					}
			},
			
			error		:		function(){
				alert("修改出现异常!");
			}
			
		});
	}
}
//删除老师的信息
function deleteTeacher(id){
	var bol = confirm("确定要删除吗?");
	if(bol == true){
		$.ajax({
			url			:			"teacher/deleteTeacher",
			type		:			"post",
			data		:			"id="+id,
			success		:			function(data){
				var json = eval('('+data+')');
				if(json.status ==1){
					alert("删除成功!");
					allTeacher();
					}else{
					alert("删除失败!");
					}
			}
		})
	}
}
//查询请假信息
function selectLeave(){
	$(".page-contents").removeClass();
	$("#aa").load("teacher/selectLeave .page-contents");
}
//删除请假信息
function deleteLeave(id){
	var bol = confirm("确定要删除吗?");
	if(bol == true){
		$.ajax({
			url			:			"teacher/deleteLeave",
			type		:			"post",
			data		:			"id="+id,
			success		:			function(data){
				var json = eval('('+data+')');
				if(json.status ==1){
					alert("删除成功!");
					selectLeave()
					}else{
					alert("删除失败!");
					}
			}
		})
	}
}
//模糊查询请假表中的信息
function findLeave(){
	var ise={
 	  		"student_name": $("#student_name").val(),
 	  		"class_id" :	$("#class_id").val()
 	  	}
 	  	$(".page-contents").removeClass();
 	  	$("#aa").load("teacher/findLeave .page-contents",ise);
}
//清空请假信息
function alldeleteLeave(id){
	var bol = confirm("确定要清空吗?");
	if(bol == true){
		$.ajax({
			url			:			"teacher/alldeleteLeave",
			type		:			"post",
			data		:			"id="+id,
			success		:			function(data){
				var json = eval('('+data+')');
				if(json.status ==1){
					alert("清空成功!");
					selectLeave()
					}else{
					alert("清空失败!");
					}
			}
		})
	}
}
//跳转至修改密码界面
function updatePass(){
	$(".page-contents").removeClass();
	  	$("#aa").load("teacher/updatePass .page-contents");
}
//修改面膜
function updatePasswrod(id){
	var password = $("#password").val();
	var repassword = $("#repassword").val();
	var repasswords = $("#repasswords").val();
	var pass =$("#pass").val();
	if(password == null || password =="" || password != pass){
		alert("原密码错误!");
	}else if(repassword ==null || repassword==""){
		alert("新密码不能为为空!");
	}else if(repasswords ==null || repasswords=="" || repasswords!=repassword){
		alert("两次密码输入不一样!");
	}else{
		$.ajax({
			url			:			"teacher/updatePassword",
			type		:			"post",
			data		:			"id="+id+"&student_password="+repassword,
			success		:			function(data){
				var json = eval('('+data+')');
				if(json.status ==1){
					alert("修改成功!");
						/*selectLeave()*/
					location.href="index";
					}else{
					alert("修改失败!");
					}
			},
			error		: 		function(){
				alert("修改出现异常!");
			}
		})
	}
}

