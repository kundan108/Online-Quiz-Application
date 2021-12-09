let examid,exam,tot_ques,tot_marks,userid;
let correct_ans=0;
let wrong_ans=0;
let unattemp=0;
$("#exam").click(function(){
	console.log("show_question_details");
	$(".box").css("display","none");
	$(".show_exam").css("display","block");
	let data={
		exam:"exam"
	}
	let xhr=$.post("ShowExamDetailControllerServlet",data,function(responseText){
		console.log("Hello How are you");
		let str=JSON.parse(responseText);
		console.log(str.examlist);
		$(".show_exam").html(str.examlist);
	});
	xhr.fail(handleError);
});
function selectexamlist(){
		exam=$("#examlist").find(":selected").val();
		console.log(exam);
		console.log("examlist selected!!");
		data={
			exam:"examid",
			langugage:exam
		}
		let xhr=$.post("ShowExamDetailControllerServlet",data,function(responseText){
		str=JSON.parse(responseText);
		$(".show_exam").append('<span></span>');
		$(".show_exam span").html(str.examidlist);
	});
	xhr.fail(handleError);

}

function selectexamidlist(){
	examid=$("#examidlist").find(":selected").val();
	console.log("selectexamidlist");
	console.log(examid);
	console.log(exam);
	$(".mycontainer").css("display","block");
	$(".show_exam").css("display","none");
	$(".show_ques").css("display","block");
	let data={
		examid:examid
	}
	let xhr=$.post("ShowQuestionControllerServlet",data,function(responseText){
		let ques=JSON.parse(responseText.trim());
		console.log(ques);
		let i=0;
		let obj=JSON.parse(ques[i++]);
		let qno=1;
		let tot_ques=ques.length;
		$("#exam_name").html(`${exam} (${examid})`);
		$("#show_exam_ques").html(`(${qno} of ${tot_ques} )`);
		$("#show_question").html(obj.question);
		$("#option1").html(obj.option1);
		$("#option2").html(obj.option2);
		$("#option3").html(obj.option3);
		$("#option4").html(obj.option4);
		let ch=obj.ans;
		qno++;
		$("#show_next").click(function(){
			let chosenAnswer = $("input[name='answer']:checked").val() || 'u';
			console.log(chosenAnswer);
			if(ch==chosenAnswer)
				correct_ans++;
			else if(chosenAnswer == 'u')
				unattemp++;
			else
				wrong_ans++;
			if(qno > tot_ques){
				swal("You have attend all the question\n\n\tDo you want to submit").then((value)=>{
					swal("you have successfully submitted the exam\n\nCorrect Ans: "+correct_ans+"\nWrong Ans: "+wrong_ans+"\nUnattemp: "+unattemp).then((value)=>{
						let data={
							userid:userid,
							examid:examid,
							right:correct_ans,
							wrong:wrong_ans,
							unattemp:unattemp,
							language:exam
						};
						console.log("Add Performance Controller Servlet");
						let xhr =$.post("PerformanceControllerServlet",data,processResponse);						
						xhr.fail(handleError);
					});
				});
				
			}else{
				$("input[name='answer']").prop('checked', false);
				obj=JSON.parse(ques[i++]);
				$("#show_exam_ques").html(`(${qno} of ${tot_ques} )`);
				$("#show_question").html(obj.question);
				$("#option1").html(obj.option1);
				$("#option2").html(obj.option2);
				$("#option3").html(obj.option3);
				$("#option4").html(obj.option4);
				ch=obj.ans;
				
				qno++;
			}
					
		});
		
	});	
}

$("#add_question_details").click(function(){
	console.log("Hello kundan");
	$(".box").css("display","block");
});

function examDetails(){
	examid=$("#examid").val();
	exam=$("#exam").val();
	tot_ques=$("#tot_ques").val();
	tot_marks=$("#tot_marks").val();
	if(isValidate()===true){
		let data={
			examid:examid,
			exam:exam,
			tot_ques:tot_ques,
			tot_marks:tot_marks	
		};
		console.log(`${examid} ${exam} ${tot_ques} ${tot_marks}`);
		let xhr=$.post("ExamDetailControllerServlet",data,processResponse);
		xhr.fail(handleError);
	}
}
function isValidate(){
	if(examid.trim()==="" || exam.trim()==="" || tot_ques.trim()==="" || tot_marks.trim()===""){
		swal("Error","All field are mendatory!!","error");
		return false;
	}
	return true;
}

function processResponse(responseText, textStatus, xhr) {
    let str = responseText.trim();
    if (str === "success") {
        swal("Success", "Performance added successfully", "success");
        setTimeout(function(){
			window.location="studentframe.jsp";
			}, 3000);
    }
    else
        swal("Error", "Registration failed", "error");
}

function handleError(xhr) {
    swal("Error", "Problem in server communicaion:" + xhr.statusText, "error");
}