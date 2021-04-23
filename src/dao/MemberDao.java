package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import controller.DBConnection;

public class MemberDao {
	public static void printSqlStatement(PreparedStatement preparedStatement, String sql) throws SQLException{
        String[] sqlArrya= new String[preparedStatement.getParameterMetaData().getParameterCount()];
        try {
               Pattern pattern = Pattern.compile("\\?");
               Matcher matcher = pattern.matcher(sql);
               StringBuffer sb = new StringBuffer();
               int indx = 1;  // Parameter begin with index 1
               while (matcher.find()) {
             matcher.appendReplacement(sb,String.valueOf(sqlArrya[indx]));
               }
               matcher.appendTail(sb);
              System.out.println("Executing Query [" + sb.toString() + "] with Database[" + "] ...");
               } catch (Exception ex) {
                   System.out.println("Executing Query [" + sql + "] with Database[" +  "] ...");
            }
	}
	
	public static void member_join(String member_id, String member_pw, String member_name, String member_email_left, String member_email_right, String member_email_receive,
				String member_phone_first, String member_phone_second, String member_phone_third, String member_gender, String member_purchase, String member_grade,
				String address1, String address2, String address3, String address4)
	{
		Connection conn = null;    
        PreparedStatement pstmt = null;
        
        try {
        	conn = DBConnection.getConnection();
        	String query = "insert into p_member(member_idx, member_id, member_pw, member_name, member_email, member_phone, member_gender, member_email_ad, member_address, member_date)"
        				+ "values (p_member_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
        	pstmt = conn.prepareStatement(query);
        	pstmt.setString(1, member_id);
        	System.out.println("가입아이디 : " + member_id);
        	pstmt.setString(2, member_pw);
        	pstmt.setString(3, member_name);
        	
        	String member_email_sum = member_email_left+"@"+member_email_right;
        	pstmt.setString(4, member_email_sum);
        	
        	String member_phone_sum = member_phone_first+"-"+member_phone_second+"-"+member_phone_third;
        	pstmt.setString(5, member_phone_sum);
        	
        	pstmt.setString(6, member_gender);
        	pstmt.setString(7, member_email_receive);
        	
        	String member_address = "도로명주소:"+address1+", 지번주소:"+address2+", 상세주소:"+address3+", 참고항목:"+address4;
        	pstmt.setString(8, member_address);
        	
        	System.out.println(query);
        	printSqlStatement(pstmt, query);
        	
        	int result = pstmt.executeUpdate();
        	System.out.println(result);
        }
        catch (Exception e) {
        	e.printStackTrace();
        }
		
	}
	
	public static int idCheck(HttpServletRequest request) throws Exception 
	{
		int result = 0;
		
		System.out.println("start check ID");
		Connection conn = null; //DB연결 클래스
		ResultSet rs = null;  //검색결과를 담는 클래스
		PreparedStatement pstmt = null; //쿼리를 날리는 클래스
		
		HttpSession session = request.getSession();
		
		String member_id = request.getParameter("member_id");
		System.out.println(member_id);
		
		conn = DBConnection.getConnection();
		String query = "SELECT * FROM p_member WHERE member_id = ?";
		pstmt = conn.prepareStatement( query );
		pstmt.setString(1, member_id);
		rs = pstmt.executeQuery();
	
		
		try
		{
			if(rs.next())
			{
				//아이디 중복
				result = 1;
				System.out.println("아이디가 이미 있음.");
			}
			else
			{
				//아이디 중복안됨
				result = 2;
				System.out.println("아이디를 사용할 수 있음.");
			}
			

		}
		catch(Exception e)
		{
			System.out.println("버그 발생");
		}
		
		return result;
	}
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
