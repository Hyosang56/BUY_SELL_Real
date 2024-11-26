<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO"%>
<%@ page import="member.bean.MemberDTO"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateaction</title>
</head>
<body>

<%		
		String userid = null;
		if(session.getAttribute("userid")!=null){
			userid=(String)session.getAttribute("userid");
		}
		if(userid == null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='../login/loginForm.jsp'");
			script.println("</script>");
		}
		
		MemberDTO user = new MemberDAO().getUser(userid);
			if(request.getParameter("userid")==null || request.getParameter("userpw")==null || request.getParameter("username")==null
			|| request.getParameter("usergender")==null || request.getParameter("useremail")==null || request.getParameter("userdob")==null || request.getParameter("userphone")==null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
			else
			{
			MemberDAO MemberDAO = new MemberDAO();//하나의 인스턴스
			int result = MemberDAO.update(userid,request.getParameter("userpw"),request.getParameter("username"),request.getParameter("usergender"),request.getParameter("useremail")
					,request.getParameter("userdob"),request.getParameter("userphone"));
			if(result == -1){//데이터 베이스 오류가 날 때
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('회원정보 수정에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				//script.println("alert('회원정보 수정에 성공했습니다.')");
				script.println("location.href='../login/MAIN.jsp'");
				script.println("</script>");
			}
		
		}
	%>

</body>
</html>