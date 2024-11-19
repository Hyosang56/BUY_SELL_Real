<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="member.dao.MemberDAO"%>
<%@ page import="member.bean.MemberDTO"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
    
<jsp:useBean id="user" class="member.bean.MemberDTO" scope="page"/>    <%--빈을 생성한다. --%>
<jsp:setProperty name="user" property="userid"/>     <%--빈에 값을 저장 --%>
<jsp:setProperty name="user" property="userpw" />
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Action</title>
</head>
<body>

	<%
	
		

		String userid = null;                             //사용자 아이디를 확인하여 넘김
		if(session.getAttribute("userid")!=null){
			userid=(String)session.getAttribute("userid");
		}
		if(userid!=null){//로그인이 된 사람은 또 다시 로그인 할 수 없도록 막아준다.
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href='MAIN.jsp'");
			script.println("</script>");
		}
		MemberDAO MemberDAO=new MemberDAO();//하나의 인스턴스
		int result = MemberDAO.login1(user.getuserid(), user.getuserpw());//페이지에 입력된 아이디와 비번을 login함수에 넣어줌
		if(result == 1){
			session.setAttribute("userid",user.getuserid());//세션부여
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='MAIN.jsp'");//로그인에 성공하면 main페이지로
			script.println("</script>");
		}
		
		else if(result == -2){
			PrintWriter script=response.getWriter();
			session.setAttribute("errMsg", "계정에 문제가 생겼습니다 관리자에 문의해주세요.");
			response.sendRedirect("loginForm.jsp");	
		}
		
		else if(result == 0) {
			session.setAttribute("errMsg", "로그인 정보가 올바르지 않습니다.");
			response.sendRedirect("loginForm.jsp");	
		}
		
		else if(result == -1){
			session.setAttribute("errMsg", "존재하지 않는 아이디 입니다.");
			response.sendRedirect("loginForm.jsp");	
		}
	
	
	%>

</body>
</html>