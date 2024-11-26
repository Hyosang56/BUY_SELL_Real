package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.bean.MemberDTO;


public class MemberDAO {
	private String diver = "com.mysql.cj.jdbc.Driver";
	private String DBURL = "jdbc:mysql://localhost:3306/buynselldb";
	private String DBUser = "dbmgrid";
	private String DBPassword = "dbmgrpw";
	
	private Connection conn;
	private PreparedStatement pstmt;     //sql 인젝션 방지 
	private ResultSet rs;
	
	public MemberDAO(){
		try{
			String dbURL = "jdbc:mysql://localhost:3306/buynselldb";
			String dbID="dbmgrid";
			String dbPasseord="dbmgrpw";
			Class.forName(diver); //mysql드라이버를 찾는다.
			conn = DriverManager.getConnection(dbURL,dbID,dbPasseord);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	///////////////////////////////////
	
	public Connection getConnection(){
		try {
			conn = DriverManager.getConnection(DBURL, DBUser, DBPassword);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}	
	
	////////////////////////////
	
	public int write(MemberDTO memberDTO){           //회원가입
		int su = 0;
		conn = getConnection();
		String sql = "Insert into userdb values (?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getuserid());
			pstmt.setString(2, memberDTO.getuserpw());
			pstmt.setString(3, memberDTO.getusername());
			pstmt.setString(4, memberDTO.getusergender());
			pstmt.setString(5, memberDTO.getuseremail());
			pstmt.setString(6, memberDTO.getuserdob());
			pstmt.setString(7, memberDTO.getuserphone());
			su = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return su;
	}
	
	
	public String login(String userid, String userpw){     //로그인파트 
		String name="null";
		conn = getConnection();
		String sql = "select * from userdb where userid=? and userpw=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpw);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				name = rs.getString("username"); //rs.getString(1);
			}
			
		} catch(SQLException e){
			e.printStackTrace();
		}
		finally {
			// TODO: handle finally clause
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return name;
	}
	
	///////////////////////////////////////////////////
	public boolean isExistId(String userid){             //아이디 중복확인 
		boolean exist = false;
		conn = getConnection();
		String sql = "select * from userdb where userid=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				exist = true;
			}
			
		} catch(SQLException e){
			e.printStackTrace();
		}
		finally {
			// TODO: handle finally clause
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return exist;
	}
	///////////////////////////////////////////////////////////
	
	public String findId(String username, String userphone) {                         //아이디 DB에서 찾는 DAO
		conn = getConnection();
		String mid = null;
		String sql = "select userid from userdb where username=? and userphone=? ";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, userphone);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mid = rs.getString("userid");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mid;
	}
	//////////////////////////////////////////////
	
	public String findPW(String userid, String userphone) {                         //아이디 DB에서 찾는 DAO
		conn = getConnection();
		String mid = null;
		String sql = "select userpw from userdb where userid=? and userphone=? ";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userphone);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mid = rs.getString("userpw");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mid;
	}
	
	////////////////////////////////////////////////
	
	public MemberDTO getUser(String userid) {     //회원정보 수정을 위해 아이디의 정보 가져옴
		String SQL="SELECT * from userdb where userid = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);//물음표
			rs = pstmt.executeQuery();//select
			if(rs.next()) {//결과가 있다면
				MemberDTO user = new MemberDTO();
				user.setuserid(rs.getString(1));//첫 번째 결과 값
				user.setuserpw(rs.getString(2));
				user.setusername(rs.getString(3));
				user.setusergender(rs.getString(4));
				user.setuseremail(rs.getString(5));
				user.setuserdob(rs.getString(6));
				user.setuserphone(rs.getString(7));
				return user;//6개의 항목을 user인스턴스에 넣어 반환한다.
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
    ////////////////////////////////////////////////
	
	public int update(String userid, String userpw, String username, String usergender, String useremail, String userdob, String userphone ) {
		String SQL = "update userdb set userpw = ?, username = ?, usergender = ?, useremail = ? , userdob = ?, userphone = ? where userid = ?";//특정한 아이디에 해당하는 제목과 내용을 바꿔준다. 
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userpw);
			pstmt.setString(2, username);
			pstmt.setString(3, usergender);
			pstmt.setString(4, useremail);
			pstmt.setString(5, userdob);
			pstmt.setString(6, userphone);
			pstmt.setString(7, userid);
			return pstmt.executeUpdate();		
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
    ////////////////////////////////////////////////
	
	public int delete(String userid) {
		String SQL="Delete from userdb where userid = ?";//특정한 아이디에 해당하는 제목과 내용을 바꿔준다. 
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			return pstmt.executeUpdate();
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
	/////////////////////////////////////////////
	
	
	
/////////////////////////////////////////////
	
	public int login1(String userid, String userpw) {//로그인을 시도하는 함수
		String SQL = "SELECT userpw FROM userdb WHERE userid = ?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userid);//아이디가 일치하면 비밀번호를 가져온다.
			rs = pstmt.executeQuery();//rs에 실행한 결과를 넣어준다.
			
			if(rs.next()) {//결과가 존재한다면
				if(rs.getString(1).equals(userpw))//sql문장을 실행해서 나온 결과와 접속을 시도했던 passwd비교
					return 1;//로그인 성공
				else
					return 0; //비밀번호 불일치
			}
			return -1;//아이디가 없음,rs의 결과가 존재 하지 않음
		} 
		catch(SQLException e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}

	////////////////////////////////////////
	
	
	
}







