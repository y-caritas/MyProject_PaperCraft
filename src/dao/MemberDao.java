package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import controller.DBConnection;



public class MemberDao {
	
	public static String Login(HttpServletRequest request) throws Exception 
	{
		String result = null;
		Connection conn = null; //DB연결 클래스
		ResultSet rs = null;  //검색결과을 담는 클래스
		PreparedStatement pstmt = null; //쿼리를 날리는 클래스
		
		HttpSession session = request.getSession();
		
		String member_id = request.getParameter("member_id");                                                                       
		String member_pw = request.getParameter("member_pw");
		
		conn = DBConnection.getConnection();
		String query = "SELECT * FROM p_member WHERE member_id = ? AND member_pw = ?";
		pstmt = conn.prepareStatement( query );
		pstmt.setString(1, member_id);
		pstmt.setString(2, member_pw);
		
		rs = pstmt.executeQuery();	
		
		try
		{
			while(rs.next()) 
			{
				String check_id = rs.getString("member_id");
				System.out.println("check : "+check_id);
				String check_pw = rs.getString("member_pw");

	            System.out.println("index:"+member_id);
	            System.out.println("index:"+member_pw);
	            
				if(member_id.equals(check_id) && member_pw.equals(check_pw))
				{
					System.out.println("로그인 성공");
					result = member_id;
					session.setAttribute("member_id",member_id);
					
					request.setAttribute("alert", "로그인되었습니다.");
				}
				else 
				{
					System.out.println("로그인 실패");
					
				}        
			}

		}
		catch(Exception e)
		{
			System.out.println("로그인 에러");
		}
		
		return result;
	}
	
	//아이디 찾기
	
	public static String idFind(HttpServletRequest request) throws Exception 
	{
		String result = null;
		
		System.out.println("start find ID");
		Connection conn = null; //DB연결 클래스
		ResultSet rs = null;  //검색결과을 담는 클래스
		PreparedStatement pstmt = null; //쿼리를 날리는 클래스
		
		HttpSession session = request.getSession();
		
		String member_name = request.getParameter("member_name");
		String member_email = request.getParameter("member_email");
		System.out.println(member_name);
		System.out.println(member_email);
		
		conn = DBConnection.getConnection();
		String query = "SELECT * FROM p_member WHERE member_name=? AND member_email=?";
		pstmt = conn.prepareStatement( query );
		pstmt.setString(1, member_name);
		pstmt.setString(2, member_email);
		
		rs = pstmt.executeQuery();
		
		try
		{
			while(rs.next()) 
			{
				String member_id = rs.getString("member_id");
				session.setAttribute("member_id",member_id);
				result = member_id;
			}

		}
		catch(Exception e)
		{
			System.out.println("찾는 아이디가 없음");
		}
		
		System.out.println("ID : "+result);
		return result;
	}
	
	//비밀번호 찾기
	
	public static String pwFind(HttpServletRequest request) throws Exception 
	{
		String result = null;
		
		Connection conn = null; //DB연결 클래스
		ResultSet rs = null;  //검색결과을 담는 클래스
		PreparedStatement pstmt = null; //쿼리를 날리는 클래스
		
		HttpSession session = request.getSession();
		
		String member_id = request.getParameter("member_id");
		String member_email = request.getParameter("member_email");
		System.out.println(member_id);
		System.out.println(member_email);
		
		conn = DBConnection.getConnection();
		String query = "SELECT * FROM p_member WHERE member_id = ? AND member_email = ?";
		pstmt = conn.prepareStatement( query );
		pstmt.setString(1, member_id);
		pstmt.setString(2, member_email);
		rs = pstmt.executeQuery();
		
		try
		{
			while(rs.next()) 
			{
				String member_pw = rs.getString("member_pw");
				session.setAttribute("member_pw",member_pw);
				result = member_pw;
			}

		}
		catch(Exception e)
		{
			System.out.println("찾는 비밀번호가 없음");
		}
		
		System.out.println("PW : "+result);
		return result;
	}
	

}
