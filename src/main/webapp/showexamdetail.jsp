<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,org.json.JSONObject" %>    

<%
	String exam=(String)request.getAttribute("exam");
	if(exam.equalsIgnoreCase("exam")){
		java.util.Set examlist = (java.util.HashSet)request.getAttribute("examlist");
		java.util.Iterator<String> it= examlist.iterator();
		StringBuffer display = new StringBuffer();
		display.append("<label for='examlist'>Select Exam :</label><select id='examlist' onchange='selectexamlist()'>");
		display.append("<option value=''>Select Exam</option>");
		while(it.hasNext()){
			exam = it.next();
			System.out.println(exam);
			display.append("<option value='"+exam+"'>"+exam+"</option>");
		}
		display.append("</select>");
  	  	JSONObject json = new JSONObject();
		json.put("examlist",display.toString());
		out.println(json);
		System.out.println(json);
	}else if(exam.equalsIgnoreCase("examid")){
		ArrayList<String> examidlist=(ArrayList<String>)request.getAttribute("examid");
		StringBuffer display = new StringBuffer();
		display.append("<label for='examidlist'>Select Exam :</label><select id='examidlist' onchange='selectexamidlist()'>");
		display.append("<option value=''>Select ExamId</option>");
		for(String examid:examidlist){
			System.out.println(examid);
			display.append("<option value='"+examid+"'>"+examid+"</option>");
		}
		display.append("</select>");
		JSONObject json = new JSONObject();
		json.put("examidlist",display.toString());
		out.println(json);
		System.out.println(json);
	}
%>