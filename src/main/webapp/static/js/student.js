//删除学生成绩
function deletebyidAchievements(id){
	var bol = confirm("确定要删除此条信息吗?");
	if(bol == true){
		$.ajax({
			url 		:		"deletebyidAchievements",
			type		:		"post",
			data	:		{"id":id},
			success		:		function(data){
				var json = eval('('+data+')');
				if(json.status == 1){
					alert("删除成功");
					check1();
				}else{
					alert("删除失败!");
				}
			},
			error		:		function(){
				alert("删除出现异常!");
			}
		
		});
	}
}

//删除学生信息
function deletebyidScore(id){
	
	var bol = confirm("确定要删除此条信息吗?");
	if(bol == true){
		$.ajax({
			url 		:		"deletebyidScore",
			type		:		"post",
			data	:		{"id":id},
			success		:		function(data){
				var json = eval('('+data+')');
				if(json.status == 1){
					alert("删除成功");
					check2();
				}else{
					alert("删除失败!");
				}
			},
			error		:		function(){
				alert("删除出现异常!");
			}
		
		});
	}
}

//模糊查询学生信息
function findStudent(){
	var ise={
 	  		"student_name": $("#student_name").val(),
 	  		"class_id" :	$("#class_id").val()
 	  	}
 	  	$(".page-contents").removeClass();
 	  	$("#aa").load("findStudent .page-contents",ise);
}
function findStudent2(){
	var ise={
 	  		"student_name": $("#student_name").val(),
 	  		"class_id" :	$("#class_id").val()
 	  	}
 	  	$(".page-contents").removeClass();
 	  	$("#aa").load("findStudent2 .page-contents",ise);
}

function updateStudent(id){
    			var student_name=$("#student_name").val();
    			var student_gender=$('input[type="radio"]:checked').val();
    			var student_age = $("#student_age").val();
    			var studnet_phone=$("#student_phone").val();
    			var student_card = $("#student_card").val();
    			var class_id = $("#class_id").val();
    			var state_id = $('input[name="state_id"]:checked').val();
    			var address_name =$("#address_name").val();
    			var premissions_id=$('input[name="premissions_id"]:checked').val();
    			if(student_name =="" || student_name ==null){
    				alert("请填写姓名!");
    			}else if(student_age == "" || student_age == null){
    				alert("请填写年龄!");
    			}else if(student_phone =="" || student_phone == null){
    				alert("请填写手机号码!");
    			}else if(student_card == "" || student_card == null){
    				alert("请填写身份证号!");
    			}else{
    				$.ajax({
    					url			:		"updateStudent",
    					type		:		"post",
    					data		:		{
    					
    						"student_name"		:		student_name,
    						"student_gender"	:		student_gender,
    						"student_age"		:		student_age,
    						"student_phone"		:		studnet_phone,
    						"student_card"		:		student_card,
    						"class_id"			:		class_id,
    						"id"				:		id,
    						"state_id"			:		state_id,
    						"address_name"		:		address_name,
    						"premissions_id"	:		premissions_id
    					},
    					success		:		function(data){
    							var json = eval('('+data+')');
    							if(json.status ==1){
    							alert("修改成功!");
    							check2();
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
    		//显示成绩排行
     	  function check1(){
     	  	$(".page-contents").removeClass();
     	  	
     	  	$("#aa").load("login2 .page-contents");
     	  }
     	  
     	  
     	  //显示全部学生信息
     	  function check2(){
     	  	$(".page-contents").removeClass();
     	  	$("#aa").load("detailedStudent .page-contents");
     	  }
     	  //模糊查询
     	  function check3(){
     	  	var ise={
     	  		"student_name": $("#student_name").val(),
     	  		"class_id" :	$("#class_id").val()
     	  	}
     	  	$(".page-contents").removeClass();
     	  	$("#aa").load("findscoreStudent .page-contents",ise);
     	  }
     	  
     	  //根据id显示 学生的详细信息
     	  function detailedStudentid(id){
     	   var ise ={
     	   	"id":id
     	   }
     	  	$(".page-contents").removeClass();
     	  	
     	  	$("#aa").load("detailedStudentid .page-contents",ise);
     	  }
     	  
     	  //根据学生id 显示学生的成绩信息
     	  function byidScore(idzzb){
     	  	var ise={"idzzb":idzzb}
     	  	$(".page-contents").removeClass();
     	  	$("#aa").load("byidScore .page-contents",ise);
     	  }
     	  //修改学生成绩
     	  function updatebyidScore(id){
     		 	var chinese = $("#chinese").val();
	     		var mathematice = $("#mathematice").val();
	     		var english = $("#english").val();
	     		var physics = $("#physics").val();
	     		var chemistry = $("#chemistry").val();
	     		var biology = $("#biology").val();
	     		if(chinese =="" || chinese==null){
	     			alert("语文成绩不能为空!");
	     		}else if(mathematice =="" || mathematice==null){
	     			alert("数学成绩不能为空!");
	     		}else if(english =="" || english==null){
	     			alert("英语成绩不能为空!");
	     		}else if(physics =="" || physics==null){
	     			alert("物理成绩不能为空!");
	     		}else if(chemistry =="" || chemistry==null){
	     			alert("化学成绩不呢为空!");
	     		}else if(biology =="" || biology==null){
	     			alert("生物成绩不能为空!");
	     		}else{
	     			$.ajax({
	     				url  	:		"updatebyidScore",
	     				type	:		"post",
	     				data	:		{
	     					"chinese" 		: chinese,
	     					"mathematics" 	: mathematice,
	     					"english" 		: english,
	     					"physics" 		: physics,
	     					"chemistry" 	: chemistry,
	     					"biology" 		: biology,
	     					"student_id" 	: id
	     					
	     				},
	     				success	:		function(data){
	     					var json = eval('('+data+')');
	     					if(json.status == 1){
	     						alert("修改成功!");
	     						check1();
	     					}else{
	     						alert("修改失败!");
	     					}
	     				},
	     				error 	:		function(){
	     					alert("修改出现异常!");
	     				}
	     				
	     			});
	     		}
     		}	
    //查询没有成绩的学生的信息
 function noScore(){
		$(".page-contents").removeClass();
	  	$("#aa").load("noScore .page-contents");
 }
 //跳转至添加成绩的jsp页面 
 function addScore(id){
	
	 var ise ={
			 "id":id

	 }
	 $(".page-contents").removeClass();
	 $("#aa").load("addScore .page-contents",ise);
 }
 //想成绩表中添加数据
 function addScore2(id){
	 	var chinese = $("#chinese").val();
		var mathematice = $("#mathematice").val();
		var english = $("#english").val();
		var physics = $("#physics").val();
		var chemistry = $("#chemistry").val();
		var biology = $("#biology").val();
		$.ajax({
				url  	:		"addScore2",
				type	:		"post",
				data	:		{
					"chinese" 		: chinese,
					"mathematics" 	: mathematice,
					"english" 		: english,
					"physics" 		: physics,
					"chemistry" 	: chemistry,
					"biology" 		: biology,
					"student_id" 	: id
				},
				success	:		function(data){
					var json = eval('('+data+')');
					if(json.status == 1){
						alert("添加成功!");
						check1();
					}else{
						alert("添加失败!");
					}
				},
				error 	:		function(){
					alert("添加出现异常!");
				}
				
			});
	 
 }
 //添加请假信息
 function addLeave(id){
	 var bol=confirm("确定添加请假信息吗?");
	 if(bol==true){
		 $.ajax({
			 url 		:		"addLeave",
			 type		:		"post",
			 data		:		"id="+id,
			 success	:		function(data){
				 var json = eval('('+data+')');
					if(json.status == 1){
						alert("添加成功!");
						check2();
					}else{
						alert("添加失败!");
						
					}
			 },
			 error 	:		function(){
					alert("添加出现异常!");
			}
		 })
	 }
	 
 }
 //跳转至注册
 function addStudent(){
	 location.href="addStudent"
 }
 
 //注册
 function addStudent2(){
	 var student_name = $("#student_name").val();
	 var student_password = $("#student_password").val();
	 var student_gender=$('input[type="radio"]:checked').val();
	 var student_age = $("#student_age").val();
	 var student_phone = $("#student_phone").val();
	 var student_card = $("#student_card").val();
	 var class_id = $("#class_id").val();
	 var premission_id = $('input[name="premission_id"]:checked').val();
	 var address_name = $("#address_name").val();
	 if(student_name == null || student_name==""){
		 alert("请填写姓名!");
	 }else if(student_password == null || student_password==""){
		 alert("请填写密码!");
	 }else if(student_age == null || student_age==""){
		 alert("请填写年龄!");
	 }else if(student_phone == null || student_phone==""){
		 alert("请填写电话!");
	 }else if(student_card == null || student_card==""){
		 alert("请填写身份证号!");
	 }else if(class_id == null || class_id==""){
		 alert("请选择班级!");
	 }else if(address_name == null || address_name==""){
		 alert("请填写地址!");
	 }else {
		 $.ajax({
			url		:		"addStudent2",
			type	:		"post",
			data	:		{
				"student_name"			:		student_name,
				"student_password"		:		student_password,
				"student_age"			:		student_age,
				"student_phone"			:		student_phone,
				"student_gender"		:		student_gender,
				"student_card"			:		student_card,
				"class_id"				:		class_id,
				"premissions_id"			:		premission_id,
				"address_name"			:		address_name
			},
			success	:		function(data){
				var json = eval('('+data+')');
				if(json.status == 1){
					alert("添加成功!");
					location.href="index";
				}else{
					alert("添加失败!");
					location.href="addStudent";
				}
			},
			error 	:		function(){
				alert("添加出现异常!");
			}
		 })
		 
	 }
	 
	 
	
 }