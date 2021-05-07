package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import controller.DBConnection;
import dto.MemberDto;
import dto.OrderDto;

public class OrderDao {
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
    // 리스트 호출
   public static ArrayList<OrderDto> orderlist() {
	   
	      ArrayList<OrderDto> simpleOrder = new ArrayList<OrderDto>();
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;  

	      try {
	         conn = DBConnection.getConnection();
	         System.out.println( "conn:" + conn );
	         
	         String query = "select * from p_order order by order_idx desc";
	         pstmt = conn.prepareStatement( query );
	         rs = pstmt.executeQuery();
	         
	         while( rs.next() ) {
	            String order_idx = rs.getString("order_idx");
	            String order_status = rs.getString("order_status");
	            Date order_date = rs.getTimestamp("order_date");
	            String order_p_name = rs.getString("order_p_name");
	            int order_p_price = rs.getInt("order_p_price");
	            String product_idx1 = rs.getString("product_idx1");
	            String product_idx2 = rs.getString("product_idx2");
	            String product_idx3 = rs.getString("product_idx3");
	            String member_name2 = rs.getString("member_name");
	            String member_id = rs.getString("member_id");
	            int member_grade = rs.getInt("member_grade");
	            String member_address = rs.getString("member_address");
	            String member_phone = rs.getString("member_phone");
	            String member_request = rs.getString("member_request");
	            
	            
	            System.out.println("order_idx: "+ order_idx);
	            
	            OrderDto dto = new OrderDto( order_idx, order_status, order_date, order_p_name, order_p_price,
	        			product_idx1, product_idx2, product_idx3, member_name2, member_id,
	        			member_grade, member_address, member_phone, member_request);
	            
	            simpleOrder.add(dto);
	         }
	      }
	      catch( Exception e) {
	         System.out.println("DB연결 오류!");
	      }
	      return simpleOrder;
	   }
   // 간편검색
   public static ArrayList<OrderDto> simpleSearch(String order_status) {
	   
      ArrayList<OrderDto> simpleOrder = new ArrayList<OrderDto>();
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;  
      
      
      
      try {
         conn = DBConnection.getConnection();
         System.out.println( "conn:" + conn );
         
         String query = "select * from p_order where order_status=? order by order_idx desc";
         pstmt = conn.prepareStatement( query );
         pstmt.setString(1, order_status);
         rs = pstmt.executeQuery();	 
         
         
         while( rs.next() ) {
	            String order_idx = rs.getString("order_idx");
	            String order_status2 = rs.getString("order_status");
	            Date order_date = rs.getTimestamp("order_date");
	            String order_p_name = rs.getString("order_p_name");
	            int order_p_price = rs.getInt("order_p_price");
	            String product_idx1 = rs.getString("product_idx1");
	            String product_idx2 = rs.getString("product_idx2");
	            String product_idx3 = rs.getString("product_idx3");
	            String member_name2 = rs.getString("member_name");
	            String member_id = rs.getString("member_id");
	            int member_grade = rs.getInt("member_grade");
	            String member_address = rs.getString("member_address");
	            String member_phone = rs.getString("member_phone");
	            String member_request = rs.getString("member_request");
            
            
            System.out.println("order_idx: "+ order_idx);
            
            
            OrderDto dto = new OrderDto( order_idx, order_status2, order_date, order_p_name, order_p_price,
        			product_idx1, product_idx2, product_idx3, member_name2, member_id,
        			member_grade, member_address, member_phone, member_request);
            
            simpleOrder.add(dto);
         }
      }
      catch( Exception e) {
         System.out.println("DB연결 오류!");
      }
      return simpleOrder;
   }
   
   // 상세검색(제품명)
   public static ArrayList<OrderDto> detSearch1(String order_p_name) {
	   
	      ArrayList<OrderDto> simpleOrder = new ArrayList<OrderDto>();
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;  

	      try {
	         conn = DBConnection.getConnection();
	         System.out.println( "conn:" + conn );
	         
	         String query = "select * from p_order where order_p_name like ? order by order_idx desc";
	         pstmt = conn.prepareStatement( query );
	         pstmt.setString(1, "%"+order_p_name+"%");
	         
	         rs = pstmt.executeQuery();
	         
	         while( rs.next() ) {
		            String order_idx = rs.getString("order_idx");
		            String order_status2 = rs.getString("order_status");
		            Date order_date = rs.getTimestamp("order_date");
		            String order_p_name2 = rs.getString("order_p_name");
		            int order_p_price = rs.getInt("order_p_price");
		            String product_idx1 = rs.getString("product_idx1");
		            String product_idx2 = rs.getString("product_idx2");
		            String product_idx3 = rs.getString("product_idx3");
		            String member_name2 = rs.getString("member_name");
		            String member_id = rs.getString("member_id");
		            int member_grade = rs.getInt("member_grade");
		            String member_address = rs.getString("member_address");
		            String member_phone = rs.getString("member_phone");
		            String member_request = rs.getString("member_request");
	            
	            System.out.println("order_idx: "+ order_idx);
	            
	            
	            OrderDto dto = new OrderDto( order_idx, order_status2, order_date, order_p_name2, order_p_price,
	        			product_idx1, product_idx2, product_idx3, member_name2, member_id,
	        			member_grade, member_address, member_phone, member_request);
	            
	            simpleOrder.add(dto);
	         }
	      }
	      catch( Exception e) {
	         System.out.println("DB연결 오류!");
	      }
	      return simpleOrder;
	   }
   
   		// 상세검색(사용자 아이디)
	   public static ArrayList<OrderDto> detSearch2(String member_id) {
		   
		      ArrayList<OrderDto> simpleOrder = new ArrayList<OrderDto>();
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;  
	
		      try {
		         conn = DBConnection.getConnection();
		         System.out.println( "conn:" + conn );
		         
		         String query = "select * from p_order where member_id like ? order by order_idx desc";
		         pstmt = conn.prepareStatement( query );
		         pstmt.setString(1, "%"+member_id+"%");
		         
		         rs = pstmt.executeQuery();
		         
		         while( rs.next() ) {
			            String order_idx = rs.getString("order_idx");
			            String order_status2 = rs.getString("order_status");
			            Date order_date = rs.getTimestamp("order_date");
			            String order_p_name = rs.getString("order_p_name");
			            int order_p_price = rs.getInt("order_p_price");
			            String product_idx1 = rs.getString("product_idx1");
			            String product_idx2 = rs.getString("product_idx2");
			            String product_idx3 = rs.getString("product_idx3");
			            String member_name = rs.getString("member_name");
			            String member_id2 = rs.getString("member_id");
			            int member_grade = rs.getInt("member_grade");
			            String member_address = rs.getString("member_address");
			            String member_phone = rs.getString("member_phone");
			            String member_request = rs.getString("member_request");
		            
		            System.out.println("order_idx: "+ order_idx);
		            
		            
		            OrderDto dto = new OrderDto( order_idx, order_status2, order_date, order_p_name, order_p_price,
		        			product_idx1, product_idx2, product_idx3, member_name, member_id2,
		        			member_grade, member_address, member_phone, member_request);
		            
		            simpleOrder.add(dto);
		         }
		      }
		      catch( Exception e) {
		         System.out.println("DB연결 오류!");
		      }
		      return simpleOrder;
		   }
  		// 상세검색(회원 등급)
	   public static ArrayList<OrderDto> detSearch3(String member_grade) {
		   
		      ArrayList<OrderDto> simpleOrder = new ArrayList<OrderDto>();
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;  
	
		      try {
		         conn = DBConnection.getConnection();
		         System.out.println( "conn:" + conn );
		         
		         String query = "select * from p_order where member_grade like ? order by order_idx desc";
		         pstmt = conn.prepareStatement( query );
		         pstmt.setInt(1, Integer.parseInt(member_grade));
		         
		         rs = pstmt.executeQuery();
		         
		         while( rs.next() ) {
		        	    String order_idx = rs.getString("order_idx");
			            String order_status2 = rs.getString("order_status");
			            Date order_date = rs.getTimestamp("order_date");
			            String order_p_name = rs.getString("order_p_name");
			            int order_p_price = rs.getInt("order_p_price");
			            String product_idx1 = rs.getString("product_idx1");
			            String product_idx2 = rs.getString("product_idx2");
			            String product_idx3 = rs.getString("product_idx3");
			            String member_name = rs.getString("member_name");
			            String member_id = rs.getString("member_id");
			            int member_grade2 = rs.getInt("member_grade");
			            String member_address = rs.getString("member_address");
			            String member_phone = rs.getString("member_phone");
			            String member_request = rs.getString("member_request");
		            
		            System.out.println("order_idx: "+ order_idx);
		            
		            
		            OrderDto dto = new OrderDto( order_idx, order_status2, order_date, order_p_name, order_p_price,
		        			product_idx1, product_idx2, product_idx3, member_name, member_id,
		        			member_grade2, member_address, member_phone, member_request);
		            
		            simpleOrder.add(dto);
		         }
		      }
		      catch( Exception e) {
		         System.out.println("DB연결 오류!");
		      }
		      return simpleOrder;
		   }
  		// 상세검색(사용자 아이디)
	   public static ArrayList<OrderDto> detSearch4(String member_name) {
		   
		      ArrayList<OrderDto> simpleOrder = new ArrayList<OrderDto>();
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;  
	
		      try {
		         conn = DBConnection.getConnection();
		         System.out.println( "conn:" + conn );
		         
		         String query = "select * from p_order where member_name like ? order by order_idx desc";
		         pstmt = conn.prepareStatement( query );
		         pstmt.setString(1, "%"+member_name+"%");
		         
		         rs = pstmt.executeQuery();
		         
		         while( rs.next() ) {
		        	    String order_idx = rs.getString("order_idx");
			            String order_status2 = rs.getString("order_status");
			            Date order_date = rs.getTimestamp("order_date");
			            String order_p_name = rs.getString("order_p_name");
			            int order_p_price = rs.getInt("order_p_price");
			            String product_idx1 = rs.getString("product_idx1");
			            String product_idx2 = rs.getString("product_idx2");
			            String product_idx3 = rs.getString("product_idx3");
			            String member_name2 = rs.getString("member_name");
			            String member_id = rs.getString("member_id");
			            int member_grade = rs.getInt("member_grade");
			            String member_address = rs.getString("member_address");
			            String member_phone = rs.getString("member_phone");
			            String member_request = rs.getString("member_request");
		            
		            System.out.println("order_idx: "+ order_idx);
		            
		            
		            OrderDto dto = new OrderDto( order_idx, order_status2, order_date, order_p_name, order_p_price,
		        			product_idx1, product_idx2, product_idx3, member_name2, member_id,
		        			member_grade, member_address, member_phone, member_request);
		            
		            simpleOrder.add(dto);
		         }
		      }
		      catch( Exception e) {
		         System.out.println("DB연결 오류!");
		      }
		      return simpleOrder;
		   }
 		// 상세검색(구매 금액)
	   public static ArrayList<OrderDto> detSearch5(String p_price1, String p_price2) {
		   
		      ArrayList<OrderDto> simpleOrder = new ArrayList<OrderDto>();
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;  
	
		      try {
		         conn = DBConnection.getConnection();
		         System.out.println( "conn:" + conn );
		         
		         System.out.println("p_price1: "+p_price1);
		         System.out.println("p_price2: "+p_price2);
		         // 첫번째 값이 없을때(두번째 적은 값 이하로 조회)
		         if( p_price1 == "" ) {
			         String query = "select * from p_order where order_p_price <=? order by order_idx desc";
			         pstmt = conn.prepareStatement( query );
			         pstmt.setInt(1, Integer.parseInt(p_price2));
			         
			         rs = pstmt.executeQuery();
		         }
		         // 두번째 값이 없을때(첫번째 적은 값 이상으로 조회)
		         else if ( p_price2 == "") {
			         String query = "select * from p_order where order_p_price >=? order by order_idx desc";
			         pstmt = conn.prepareStatement( query );
			         pstmt.setInt(1, Integer.parseInt(p_price1));
			         
			         rs = pstmt.executeQuery();
		         }
		         // 값이 둘다 있을때(두 가격 사이)
		         else if (p_price1 != null && p_price2 != null ) {
			         String query = "select * from p_order where order_p_price between ? and ? order by order_idx desc";
			         pstmt = conn.prepareStatement( query );
			         pstmt.setInt(1, Integer.parseInt(p_price1));
			         pstmt.setInt(2, Integer.parseInt(p_price2));
			         
			         rs = pstmt.executeQuery();
		         }

		         
		         while( rs.next() ) {
		        	 String order_idx = rs.getString("order_idx");
			            String order_status2 = rs.getString("order_status");
			            Date order_date = rs.getTimestamp("order_date");
			            String order_p_name = rs.getString("order_p_name");
			            int order_p_price = rs.getInt("order_p_price");
			            String product_idx1 = rs.getString("product_idx1");
			            String product_idx2 = rs.getString("product_idx2");
			            String product_idx3 = rs.getString("product_idx3");
			            String member_name = rs.getString("member_name");
			            String member_id = rs.getString("member_id");
			            int member_grade = rs.getInt("member_grade");
			            String member_address = rs.getString("member_address");
			            String member_phone = rs.getString("member_phone");
			            String member_request = rs.getString("member_request");
		            
		            
		            OrderDto dto = new OrderDto( order_idx, order_status2, order_date, order_p_name, order_p_price,
		        			product_idx1, product_idx2, product_idx3, member_name, member_id,
		        			member_grade, member_address, member_phone, member_request);
		            
		            simpleOrder.add(dto);
		         }
		      }
		      catch( Exception e) {
		         System.out.println("DB연결 오류!");
		      }
		      return simpleOrder;
		   }
	   		// 주문수정화면 컨텐츠 뷰
			public static OrderDto orderModify(String order_idx) {
				
				OrderDto dto = null;
				Connection conn = null;    
		        PreparedStatement pstmt = null;
		        ResultSet rs = null;    
		        
		        try {
		        	conn = DBConnection.getConnection();
		        	String query = "select * from p_order where order_idx=?";
		        	pstmt = conn.prepareStatement( query );
		        	pstmt.setString(1, order_idx );
		        	System.out.println("점검");
		        	rs = pstmt.executeQuery();
		        	
		        	while( rs.next() ) {
			            String order_idx2 = rs.getString("order_idx");
			            String order_status = rs.getString("order_status");
			            Date order_date = rs.getTimestamp("order_date");
			            String order_p_name = rs.getString("order_p_name");
			            int order_p_price = rs.getInt("order_p_price");
			            String product_idx1 = rs.getString("product_idx1");
			            String product_idx2 = rs.getString("product_idx2");
			            String product_idx3 = rs.getString("product_idx3");
			            String member_name = rs.getString("member_name");
			            String member_id = rs.getString("member_id");
			            int member_grade = rs.getInt("member_grade");
			            String member_address = rs.getString("member_address");
			            String member_phone = rs.getString("member_phone");
			            String member_request = rs.getString("member_request");
			            
			            System.out.println(order_idx2);
			            
			            dto = new OrderDto( order_idx2, order_status, order_date, order_p_name, order_p_price,
			        			product_idx1, product_idx2, product_idx3, member_name, member_id,
			        			member_grade, member_address, member_phone, member_request);
			            
		        		
		        	}
		        }
		        catch( Exception e ) {
		        	System.out.println("DB 에러!");
		        }
				
				return dto;
			}
			// 공지사항 글 수정
			public static void orderModifyDo( String order_idx, String member_grade, String order_status ) {

				Connection conn = null;    
				PreparedStatement pstmt = null;   
				try {
					conn = DBConnection.getConnection();
					String query = "UPDATE p_order SET member_grade=?, "
						+ "order_status=? WHERE order_idx=?";       
					pstmt = conn.prepareStatement( query );
					pstmt.setString(1, member_grade);
					pstmt.setString(2, order_status);
					pstmt.setInt(3, Integer.parseInt( order_idx ) );
					
					int result = pstmt.executeUpdate(); //insert, update, delete
					System.out.println("update result:" + result); //0 결과없음 
				
				} catch (Exception e) {
				e.printStackTrace();
				}

			}
			
			// 주문양식 주문자 정보
			public static MemberDto memberInfo(String memberId) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				MemberDto memberDto = null;
				
				try {
					conn = DBConnection.getConnection();
					String query = "SELECT * FROM p_member WHERE member_id=?";
					pstmt = conn.prepareStatement( query );
					pstmt.setString(1, memberId);
					rs = pstmt.executeQuery();
					
					while( rs.next() ) {
						int member_idx = rs.getInt("member_idx");
						String member_id = rs.getString("member_id");
						String member_pw = rs.getString("member_pw");
						String member_name = rs.getString("member_name");
						String member_address = rs.getString("member_address");
						String member_email = rs.getString("member_email");
						String member_phone = rs.getString("member_phone");
						String member_gender = rs.getString("member_gender");
						int member_email_ad = rs.getInt("member_email_ad");
						int member_grade = rs.getInt("member_grade");
						Date member_date = rs.getTimestamp("member_date");
						int member_purchase = rs.getInt("member_purchase");
						
						memberDto = new MemberDto(member_idx, member_id, member_pw, member_name, member_address, member_email, member_phone, member_gender, member_email_ad, member_grade, member_date, member_purchase);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return memberDto;
			}
			
			// 주문완료
			public static void orderCompletion(String orderIdx, String memberName, String memberAddress, String memberPhone, String memberRequest,
					int memberGrade, String productIdx1, String productIdx2, String productIdx3, int orderPPrice, String paymentoption,
					String Escrow, String memberId, String orderPName) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				System.out.println("주문완료 진입");
				
				try {
					conn = DBConnection.getConnection();
					String query = "INSERT INTO p_order(order_idx, order_status, order_date, order_p_name, order_p_price, product_idx1, product_idx2, product_idx3, member_name, member_id, member_grade, member_address, member_phone, member_request, paymentoption, escrow)"
							+ "VALUES(?, '주문확인중', sysdate, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, orderIdx);
					pstmt.setString(2, orderPName);
					pstmt.setInt(3, orderPPrice);
					pstmt.setString(4, productIdx1);
					pstmt.setString(5, productIdx2);
					pstmt.setString(6, productIdx3);
					pstmt.setString(7, memberName);
					pstmt.setString(8, memberId);
					pstmt.setInt(9, memberGrade);
					pstmt.setString(10, memberAddress);
					pstmt.setString(11, memberPhone);
					pstmt.setString(12, memberRequest);
					pstmt.setString(13, paymentoption);
					pstmt.setString(14, Escrow);
					rs = pstmt.executeQuery();
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
			
			// order 테이블 불러오기
			public static OrderDto orderInfo(String orderIdx) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				OrderDto orderDto = null;
				
				try {
					conn = DBConnection.getConnection();
					String query = "SELECT * FROM p_order WHERE order_idx=?";
					pstmt = conn.prepareStatement( query );
					pstmt.setString(1, orderIdx);
					rs = pstmt.executeQuery();
					
					while( rs.next() ) {
						String order_idx = rs.getString("order_idx");
						String order_status = rs.getString("order_status");
						Date order_date = rs.getTimestamp("order_date");
						String order_p_name = rs.getString("order_p_name");
						int order_p_price = rs.getInt("order_p_price");
						String product_idx1 = rs.getString("product_idx1");
						String product_idx2 = rs.getString("product_idx2");
						String product_idx3 = rs.getString("product_idx3");
						String member_name = rs.getString("member_name");
						String member_id = rs.getString("member_id");
						int member_grade = rs.getInt("member_grade");
						String member_address = rs.getString("member_address");
						String member_phone = rs.getString("member_phone");
						String member_request = rs.getString("member_request");
						String paymentOption = rs.getString("paymentoption");
						String escrow = rs.getString("escrow");
						
						orderDto = new OrderDto(order_idx, order_status, order_date, order_p_name, order_p_price,
								product_idx1, product_idx2, product_idx3, member_name, member_id,
								member_grade, member_address, member_phone, member_request, paymentOption, escrow);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return orderDto;
			}
			
}