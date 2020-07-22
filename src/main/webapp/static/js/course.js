//显示班级课程
function allCourse(){
		$(".page-contents").removeClass();
	  	$("#aa").load("course/allCourse .page-contents");
}
//回显课程
function modifyCourse(id){
	var ise={"id":id}
	$(".page-contents").removeClass();
  	$("#aa").load("course/modifyCourse .page-contents",ise);
}
//修改课程
function updataCourse(id){
	var monday = $("#monday").val();
	var tuesday = $("#tuesday").val();
	var wednesday = $("#wednesday").val();
	var thursday = $("#thursday").val();
	var friday = $("#friday").val();
	if(monday==null ||monday==""){
		alert("课程不能为空!");
	}else if(tuesday==null ||tuesday==""){
		alert("课程不能为空!");
	}else if(wednesday==null ||wednesday==""){
		alert("课程不能为空!");
	}else if(thursday==null ||thursday==""){
		alert("课程不能为空!");
	}else if(friday==null ||friday==""){
		alert("课程不能为空!");
	}else{
		$.ajax({
			url			:			"course/updateCourse",
			type		:			"post",
			data		:	{
				"monday"		:		monday,
				"tuesday"		:		tuesday,
				"wednesday"		:		wednesday,
				"thursday"		:		thursday,
				"friday"		:		friday,
				"id"			:		id
			},
			success		:			function(data){
				var json = eval('('+data+')');
				if(json.status ==1){
					alert("修改成功!");
					allCourse();
				}else{
					alert("修改失败!");
				}
			},
			error				:	function(){
				alert("修改异常!");
			}
		})
	}
}
//模糊
function findCourse(){
	var ise = {id:$("#class_id").val()}
	$(".page-contents").removeClass();
  	$("#aa").load("course/findCourse .page-contents",ise);
  	
}