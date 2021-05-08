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
		    String   member_name    = rs.getString(" member_id");
		    int   member_grade    = rs.getInt("member_grade"); 
		    
		    OrderDto dto = new OrderDto( order_idx, order_statuse, order_p_img, order_date, order_p_idx,  order_p_count, order_p_name, order_p_price ,order_o_name, order_o_price, member_name,  member_id, member_grade);
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
	
		
		Connection conn = null;
		Statement stmt = null; 
		ResultSet rs = null; 
		ArrayList<InquiryDto> myInquiryList = new ArrayList<InquiryDto>();
		
		HttpSession session = request.getSession();
		String inquiry_member = (String)session.getAttribute("member_id");
		System.out.println("inquiry_member:"+inquiry_member);
		try 
		{		
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_inquiry WHERE member_id ='"+inquiry_member+"'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery( query );
					
			while( rs.next() ) {
				int inquiry_idx = rs.getInt("inquiry_idx");
		        int inquiry_category = rs.getInt("inquiry_category");
		        String inquiry_title = rs.getString("inquiry_title");
		        String inquiry_content = rs.getString("inquiry_content");
		        String inquiry_img = rs.getString("inquiry_img");
		        String inquiry_writer = rs.getString("inquiry_writer");
		        String inquiry_pw = rs.getString("inquiry_pw");
		        Date inquiry_date = rs.getTimestamp("inquiry_date");
		        String member_id = rs.getString("member_id");
		        
		
		   InquiryDto dto = new InquiryDto(inquiry_idx, inquiry_category, inquiry_title, inquiry_content, inquiry_img, inquiry_writer, inquiry_pw, inquiry_date, member_id);
		    myInquiryList.add(dto);
	        }
		}
		catch(Exception e) 
		{
			System.out.println("정보를 불러오지 못했습니다.");
		}
		return myInquiryList;
	}
	
	// 1 : 1 문의 Content
	
	public static InquiryDto myInquiryContent( int myInquiryIdx ) {
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 InquiryDto dto = new InquiryDto();
		 
		 try {
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_inquiry WHERE inquiry_idx=?";
			pstmt = conn.prepareStatement( query );
			pstmt.setInt(1, myInquiryIdx);
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				int inquiry_idx = rs.getInt("inquiry_idx");
		        int inquiry_category = rs.getInt("inquiry_category");
		        String inquiry_title = rs.getString("inquiry_title");
		        String inquiry_content = rs.getString("inquiry_content");
		        String inquiry_img = rs.getString("inquiry_img");
		        String inquiry_writer = rs.getString("inquiry_writer");
		        String inquiry_pw = rs.getString("inquiry_pw");
		        Date inquiry_date = rs.getTimestamp("inquiry_date");
		        String member_id = rs.getString("member_id");
		        
		        dto = new InquiryDto(inquiry_idx, inquiry_category, inquiry_title, inquiry_content, inquiry_img, inquiry_writer, inquiry_pw, inquiry_date, member_id);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	
		public static MemberDto memberInfo(String member_idx) throws Exception {
			Connection conn = null; //DB연결 클래스
			ResultSet rs = null;  //검색결과을 담는 클래스
			Statement stmt = null; //쿼리를 날리는 클래스
			MemberDto dto = new MemberDto();
					
			conn = DBConnection.getConnection();
			System.out.println("member_idx:"+member_idx);
			String query = "SELECT * FROM p_member WHERE member_idx ="+member_idx;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			
			while(rs.next()) {
				
			dto.setMember_idx(rs.getInt("member_idx"));
			dto.setMember_id (rs.getString("member_id"));           
			dto.setMember_pw (rs.getString("member_pw"));          
			dto.setMember_name (rs.getString("member_name"));          
			dto.setMember_address ( rs.getString("member_address"));       
			dto.setMember_email( rs.getString("member_email"));       
			dto.setMember_phone(rs.getString("member_phone"));        
			dto.setMember_gender(rs.getString("member_gender"));     
			dto.setMember_email_ad (rs.getInt("member_email_ad"));      
			dto.setMember_grade (rs.getInt("member_grade"));        
			dto.setMember_date(rs.getTimestamp("member_date"));      
			dto.setMember_purchase(rs.getInt("member_purchase"));     
			
				
				
			}
			
			return dto;
		}
		
		// 마이페이지 회원정보 조회
		
			public static MemberDto myPageInfo(String member_id) throws Exception {
				Connection conn = null; //DB연결 클래스
				ResultSet rs = null;  //검색결과을 담는 클래스
				Statement stmt = null; //쿼리를 날리는 클래스
				MemberDto dto = new MemberDto();
						
				conn = DBConnection.getConnection();
				System.out.println("member_id:"+member_id);
				String query = "SELECT * FROM p_member WHERE member_id ="+"'"+member_id+"'";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(query);
				
				
				while(rs.next()) {
					
				dto.setMember_idx(rs.getInt("member_idx"));
				dto.setMember_id (rs.getString("member_id"));           
				dto.setMember_pw (rs.getString("member_pw"));          
				dto.setMember_name (rs.getString("member_name"));          
				dto.setMember_address ( rs.getString("member_address"));       
				dto.setMember_email( rs.getString("member_email"));       
				dto.setMember_phone(rs.getString("member_phone"));        
				dto.setMember_gender(rs.getString("member_gender"));     
				dto.setMember_email_ad (rs.getInt("member_email_ad"));      
				dto.setMember_grade (rs.getInt("member_grade"));        
				dto.setMember_date(rs.getTimestamp("member_date"));      
				dto.setMember_purchase(rs.getInt("member_purchase"));     
				
					
					
				}
				
				return dto;
			}
			
		
		// 회원정보 수정 액션
		
		public static void updateMember(HttpServletRequest request) {
			
			Connection conn=null;
			ResultSet rs =null;
			Statement stmt = null;
			
			int member_idx = Integer.parseInt(request.getParameter("member_idx"));			
			String member_pw = request.getParameter("member_pw");
			String member_name = request.getParameter("member_name");
			String member_address = request.getParameter("member_address");
			String member_email = request.getParameter("member_email");
			String member_phone = request.getParameter("member_phone");
			System.out.println("member+pw:"+member_pw );
			System.out.println("member_name:"+member_name );
			System.out.println("member_address:"+member_address );
			System.out.println("member+pw:"+member_email );
			System.out.println("member+pw:"+member_phone );
			
			try {
								
				conn = DBConnection.getConnection();
				
				
			
				
				String query = "UPDATE p_member SET"+" member_pw='"+member_pw+"',member_name ='"
						+member_name+"', member_address ='"+member_address+"',  member_email='"+member_email+"',member_phone='"+member_phone+
						"' where member_idx="+member_idx;
				stmt=conn.createStatement();
				
				System.out.println(query);
				
				rs=stmt.executeQuery(query);
				
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
		
		public static void deleteMember(int member_idx) {
			Connection conn=null;
			ResultSet rs=null;
			Statement stmt = null;
			
			try {
				conn=DBConnection.getConnection();
							String query = "DELETE from p_member"+ " where member_idx="+member_idx;
							
				stmt=conn.createStatement();
				
				System.out.println(query);
				
				rs=stmt.executeQuery(query);
			}catch (Exception e) {
				System.out.println("삭제 에러");
			}
		}

		
	}
	
	

