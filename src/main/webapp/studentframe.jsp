<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/4930e02a36.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/studentframe.css">
    <script async type="text/javascript" src="js/studentframe.js"></script>
     <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <title>Document</title>
</head>
<body>

<%
	String userid=(String) session.getAttribute("userid");
	String username=(String) session.getAttribute("username");
	if(userid==null) {
	   	session.invalidate();
	   	response.sendRedirect("accessdenied.html");
	   	return;
	}
%>
    <div class="mycontainer">
        <div class="sidenav">
            <a href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            <a id="exam" href="#"><i class="fas fa-user-graduate "></i>Exam</a>
            <a href="#"><i class="fas fa-chalkboard-teacher"></i> Result</a> 
        </div>    
        <div class="nav">
            <div class="ham"><i class="fas fa-bars"></i>
            
                <div class="user">Hello <%=username%></div>
            </div>
            
        </div>
    </div>
    
    
    
    <div class="show_exam h5"></div>
    <div class="show_ques" style="display: none;">
    <div class="container mt-5">
		  <div class="d-flex justify-content-center row">
		      <div class="col-md-10 col-lg-10">
		          <div class="border myborder">
		              <div class="question bg-white p-3 border-bottom">
		                  <div class="d-flex flex-row justify-content-between align-items-center mcq">
		                      <h4 id="exam_name">MCQ Quiz</h4><span id="show_exam_ques">(5 of 20)</span>
		                  </div>
		              </div>
		              <div class="question bg-white p-3 border-bottom">
                        <div class="d-flex flex-row align-items-center question-title">
                            <h3 class="text-danger">Q.</h3>
                            <h5  id="show_question" class="mt-1 ml-2">Which of the following country has largest population?</h5>
                        </div>
                        <div class="ans ml-2">
                            <label class="radio"> <input id="ans1" type="radio" name="answer" value="a"> <span id="option1">Brazil</span>
                            </label>
                        </div>
                        <div class="ans ml-2">
                            <label class="radio"> <input id="ans2" type="radio" name="answer" value="b"> <span id="option2">Germany</span>
                            </label>
                        </div>
                        <div class="ans ml-2">
                            <label class="radio"> <input id="ans3" type="radio" name="answer" value="c"> <span id="option3">Indonesia</span>
                            </label>
                        </div>
                        <div class="ans ml-2">
                            <label class="radio"> <input id="ans4" type="radio" name="answer" value="d"> <span id="option4">Russia</span>
                            </label>
                        </div>
                    </div>
		              <div class="d-flex flex-row justify-content-between align-items-center p-3 bg-white"><button id="show_prev" class="btn btn-primary d-flex align-items-center btn-danger" type="button"><i class="fa fa-angle-left mt-1 mr-1"></i>&nbsp;previous</button><button id="show_next" class="btn btn-primary border-success align-items-center btn-success" type="button">Next<i class="fa fa-angle-right ml-2"></i></button></div>
		          </div>
		      </div>
		  </div>
	</div>
	</div>
    
    
    
    
    
    <script>
        /* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
        var dropdown = document.getElementsByClassName("dropdown-btn");
        var i;
        
        for (i = 0; i < dropdown.length; i++) {
          dropdown[i].addEventListener("click", function() {
          this.classList.toggle("active");
          var dropdownContent = this.nextElementSibling;
          if (dropdownContent.style.display === "block") {
          dropdownContent.style.display = "none";
          } else {
          dropdownContent.style.display = "block";
          }
          });
        }
        </script>
</body>
</html>