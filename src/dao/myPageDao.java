package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import controller.DBConnection;
import dto.InquiryDto;
import dto.MemberDto;
import dto.OrderDto;



public class myPageDao {

	// 주문목록 
	
	public static ArrayList<OrderDto> order_detail(HttpServletRequest request) throws Exception 
	{ 
	
		ArrayList<OrderDto> list = new ArrayList<OrderDto>();
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		
		HttpSession session = request.getSession();
		String order_member = (String)session.getAttribute("member_id");
		
		try 
		{		
			conn = DBConnection.getConnection();
			String query = "select * from p_order where member_id =?";
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, order_member);
	        
			rs = pstmt.executeQuery(); 
					
			while( rs.next() ) 
			{
				
			int      order_idx = rs.getInt("order_idx");        
			String   order_statuse  = rs.getString("order_status");       
			Date     order_date = rs.getDate("order_date");              
		    int      order_p_idx  = rs.getInt("order_p_idx");           
		    String   order_p_img   = rs.getString("order_p_img");          
			String   order_p_name  = rs.getString("order_p_name");           
			int      order_p_price  = rs.getInt("order_p_price");        
		    int      order_p_count  = rs.getInt("order_p_count");         
			String   order_o_name  = rs.getString("order_o_name");          
		    int      order_o_price  = rs.getInt("order_o_price");    
		    String   member_id    = rs.getString(" member_id");
		    
		    OrderDto dto = new OrderDto( order_idx, order_statuse,order_date,order_p_idx, order_p_img, order_p_name, order_p_price ,order_p_count,order_o_name, order_o_price,  member_id);
	            list.add(dto);
	        }
		}
		catch(Exception e) 
		{
			System.out.println("정보를 불러오지 못했습니다.");
		}
		return list;
	}
	
	// 1 : 1  문의 리스트
	
	public static ArrayList<InquiryDto> myInquiryList(HttpServletRequest request) throws Exception 
	{ 
	
		ArrayList<InquiryDto> list = new ArrayList<InquiryDto>();
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		
		HttpSession session = request.getSession();
		String inquiry_member = (String)session.getAttribute("member_id");
		
		try 
		{		
			conn = DBConnection.getConnection();
			String query = "select * from p_inquiry where member_id =?";
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, inquiry_member);
	        
			rs = pstmt.executeQuery(); 
					
			while( rs.next() ) 
			{
				
		    int inquiry_idx  = rs.getInt("inquiry_idx");  ;            
			int inquiry_category = rs.getInt("inquiry_category");       
			String inquiry_title = rs.getString("inquiry_title");          
			String inquiry_content = rs.getString("inquiry_content");         
			String inquiry_img = rs.getString("inquiry_img");            
			String inquiry_writer = rs.getString("inquiry_writer");          
			String inquiry_pw = rs.getString("inquiry_pw");            
			Date inquiry_date  = rs.getDate("inquiry_date");            
			String member_id  = rs.getString(" member_id");         
		
		    InquiryDto dto = new InquiryDto( inquiry_idx, inquiry_category,inquiry_title,inquiry_content, inquiry_img, inquiry_writer,inquiry_pw ,inquiry_date,member_id);
	            list.add(dto);
	        }
		}
		catch(Exception e) 
		{
			System.out.println("정보를 불러오지 못했습니다.");
		}
		return list;
	}
	
	// 1 : 1 문의 Content
	
	public static InquiryDto inquiryContent(String inquiryTitle) {
		InquiryDto dto = null;
		Connection conn = null;    
        PreparedStatement pstmt = null;    
        ResultSet rs = null;    
        try {
        	conn = DBConnection.getConnection();
        	String query = "select * from p_inquiry where inquiryTitle=?";
        	pstmt = conn.prepareStatement( query  );
        	pstmt.setString(1, inquiryTitle ); 
        	rs = pstmt.executeQuery();
        	
        	while( rs.next() ) {
        		
        		int inquiry_idx1  = rs.getInt("inquiry_idx");              
     			int inquiry_category = rs.getInt("inquiry_category");       
     			String inquiry_title = rs.getString("inquiry_title");          
     			String inquiry_content = rs.getString("inquiry_content");         
     			String inquiry_img = rs.getString("inquiry_img");            
     			String inquiry_writer = rs.getString("inquiry_writer");          
     			String inquiry_pw = rs.getString("inquiry_pw");            
     			Date inquiry_date  = rs.getDate("inquiry_date");            
     			String member_id  = rs.getString(" member_id");         
     			
     		    dto = new InquiryDto( inquiry_idx1, inquiry_category,inquiry_title,inquiry_content, inquiry_img, inquiry_writer,inquiry_pw ,inquiry_date,member_id);
        	}
        }
        catch( Exception e ) {
        }
		return dto;
	}
 
	// 비밀번호  확인 
	
	public static int check_pw(HttpServletRequest request )throws Exception {
		
		int result = 0; 
		Connection conn = null; //DB연결 클래스 
		ResultSet rs = null;  //검색결과을 담는 클래스 
		PreparedStatement pstmt = null; //쿼리를 날리는 클래스 
		 
		HttpSession session = request.getSession(); 
		
		String member_id = (String)session.getAttribute("member_id");
		String member_pw = request.getParameter("member_pw"); 
		 
		conn = DBConnection.getConnection(); 
		String query = "SELECT * FROM p_member WHERE member_id = ?"; 
		pstmt = conn.prepareStatement( query ); 
		pstmt.setString(1, member_id); 
	
		rs = pstmt.executeQuery();	 
		 
		try 
		{ 
			while(rs.next())  
			{ 
				String check_pw = rs.getString("member_pw"); 

	            
				if(member_pw.equals(check_pw))
				{
					System.out.println("로그인 성공");
					result = 1 ;
					session.setAttribute("member_pw",check_pw);
					
					request.setAttribute("alert", "로그인되었습니다.");
				}
				else 
				{
					System.out.println("로그인 실패");
					result = 2 ;
				}        
			}

		}
		catch(Exception e)
		{
			System.out.println("로그인 에러");
		}
		
		return result;
	}
		
	
	
	//회원정보 조회
	
		public static MemberDto memberInfo(String member_id) throws Exception {
			Connection conn = null; //DB연결 클래스
			ResultSet rs = null;  //검색결과을 담는 클래스
			PreparedStatement pstmt = null; //쿼리를 날리는 클래스
			MemberDto dto = new MemberDto();
			
			
			conn = DBConnection.getConnection();
			
			String query = "SELECT * FROM p_member WHERE member_id = ? ";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery(query);
			
			while(rs.next()) {
				
			int	member_idx  =   rs.getInt("member_idx");
			String	Smember_id  =  rs.getString("member_id");           
			String	member_pw  =  rs.getString("member_pw");          
			String	member_name = rs.getString("member_name");          
			String	member_address = rs.getString("member_address");       
			String	member_email =  rs.getString("member_email");       
			String	member_phone = rs.getString("member_phone");        
			String	member_gender = rs.getString("member_gender");     
			int	member_email_ad =  rs.getInt("member_email_ad");      
			int	member_grade =    rs.getInt("member_grade");        
			Timestamp member_date =      rs.getTimestamp("member_date");      
			int	member_purchase =  rs.getInt("member_purchase");     
			
				
				
			}
			
			return dto;
		}
		
		
		// 회원정보 수정 액션
		
		public static void updateMember(HttpServletRequest request) {
			Connection conn=null;
			ResultSet rs =null;
			PreparedStatement pstmt = null;
			
			try {
				conn = DBConnection.getConnection();
				String query = "UPDATE p_member SET ("					
						
						+ "member_pw = ?, "
				
						+ "member_email = ?, "
						+ "WHERE member_phone = ?,) ";
												
		        pstmt = conn.prepareStatement(query);

		      
		        pstmt.setString(1, request.getParameter("member_pw") );
		        pstmt.setString(2, request.getParameter("member_email") );
		        pstmt.setString(3, request.getParameter("member_phone") );
		       
		       			
				rs=pstmt.executeQuery(query);
				
			}catch (Exception e) {
				System.out.println("업데이트 에러");
			}
		}
		
		// 관리자 
		
		// 회원 목록 조회
		
		public static ArrayList<MemberDto> memberList() throws Exception {
			ArrayList<MemberDto> memberList = new ArrayList<MemberDto>();
			Connection conn = null;        
	        ResultSet rs = null;    
	        Statement stmt = null;
			
	        conn = DBConnection.getConnection();
	        stmt = conn.createStatement();
			
	        String query = "select * from p_member order by member_idx asc";
			rs = stmt.executeQuery(query);
			
			while( rs.next() ) {
				int	member_idx  =   rs.getInt("member_idx");
				String	member_id  =  rs.getString("member_id");           
				String	member_pw  =  rs.getString("member_pw");          
				String	member_name = rs.getString("member_name");          
				String	member_address = rs.getString("member_address");       
				String	member_email =  rs.getString("member_email");       
				String	member_phone = rs.getString("member_phone");        
				String	member_gender = rs.getString("member_gender");     
				int	member_email_ad =  rs.getInt("member_email_ad");      
				int	member_grade =    rs.getInt("member_grade");        
				Timestamp member_date =      rs.getTimestamp("member_date");      
				int	member_purchase =  rs.getInt("member_purchase");     
	            
	            
	            MemberDto dto = new MemberDto(member_idx, member_id, member_pw,member_name, member_address,member_email, member_phone,member_gender,member_email_ad,member_grade,member_date,member_purchase);
	            memberList.add(dto);
	        }
	        
			
			return memberList;
		}

		
		//회원 삭제
		
		public static void deleteMember(String member_id) {
			Connection conn=null;
			ResultSet rs=null;
			Statement stmt = null;
			
			try {
				conn=DBConnection.getConnection();
							String query = "DELETE from p_member"+ " where member_id="+member_id;
							
				stmt=conn.createStatement();
				
				System.out.println(query);
				
				rs=stmt.executeQuery(query);
			}catch (Exception e) {
				System.out.println("삭제 에러");
			}
		}

		
	}
	
	

