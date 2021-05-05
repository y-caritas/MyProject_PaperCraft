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
import dto.NoticeDto;
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
	            int order_idx = rs.getInt("order_idx");
	            String order_status = rs.getString("order_status");
	            Date order_date = rs.getTimestamp("order_date");
	            int order_p_price = rs.getInt("order_p_price");
	            int order_o_price = rs.getInt("order_o_price");
	            String order_o_name = rs.getString("order_o_name");
	            String member_name2 = rs.getString("member_name");
	            String member_id = rs.getString("member_id");
	            int member_grade = rs.getInt("member_grade");
	            String order_p_name = rs.getString("order_p_name");
	            
	            System.out.println("order_idx: "+ order_idx);
	            
	            
	            OrderDto dto = new OrderDto( order_idx,  order_status,  order_date,  order_p_name,  order_p_price,
				 order_o_name,  order_o_price,  member_name2,  member_id,  member_grade);
	            
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
            int order_idx = rs.getInt("order_idx");
            String order_p_name = rs.getString("order_p_name");
            Date order_date = rs.getTimestamp("order_date");
            int order_p_price = rs.getInt("order_p_price");
            int order_o_price = rs.getInt("order_o_price");
            String order_o_name = rs.getString("order_o_name");
            String member_name = rs.getString("member_name");
            String member_id = rs.getString("member_id");
            int member_grade = rs.getInt("member_grade");
            
            
            System.out.println("order_idx: "+ order_idx);
            
            
            OrderDto dto = new OrderDto( order_idx,  order_status,  order_date,  order_p_name,  order_p_price,
			 order_o_name,  order_o_price,  member_name,  member_id,  member_grade);
            
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
	            int order_idx = rs.getInt("order_idx");
	            String order_status = rs.getString("order_status");
	            Date order_date = rs.getTimestamp("order_date");
	            int order_p_price = rs.getInt("order_p_price");
	            int order_o_price = rs.getInt("order_o_price");
	            String order_o_name = rs.getString("order_o_name");
	            String member_name = rs.getString("member_name");
	            String member_id = rs.getString("member_id");
	            int member_grade = rs.getInt("member_grade");
	            String order_p_name2 = rs.getString("order_p_name");
	            
	            System.out.println("order_idx: "+ order_idx);
	            
	            
	            OrderDto dto = new OrderDto( order_idx,  order_status,  order_date,  order_p_name2,  order_p_price,
				 order_o_name,  order_o_price,  member_name,  member_id,  member_grade);
	            
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
		            int order_idx = rs.getInt("order_idx");
		            String order_status = rs.getString("order_status");
		            Date order_date = rs.getTimestamp("order_date");
		            int order_p_price = rs.getInt("order_p_price");
		            int order_o_price = rs.getInt("order_o_price");
		            String order_o_name = rs.getString("order_o_name");
		            String member_name = rs.getString("member_name");
		            String member_id2 = rs.getString("member_id");
		            int member_grade = rs.getInt("member_grade");
		            String order_p_name = rs.getString("order_p_name");
		            
		            System.out.println("order_idx: "+ order_idx);
		            
		            
		            OrderDto dto = new OrderDto( order_idx,  order_status,  order_date,  order_p_name,  order_p_price,
					 order_o_name,  order_o_price,  member_name,  member_id2,  member_grade);
		            
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
		            int order_idx = rs.getInt("order_idx");
		            String order_status = rs.getString("order_status");
		            Date order_date = rs.getTimestamp("order_date");
		            int order_p_price = rs.getInt("order_p_price");
		            int order_o_price = rs.getInt("order_o_price");
		            String order_o_name = rs.getString("order_o_name");
		            String member_name = rs.getString("member_name");
		            String member_id = rs.getString("member_id");
		            int member_grade2 = rs.getInt("member_grade");
		            String order_p_name = rs.getString("order_p_name");
		            
		            System.out.println("order_idx: "+ order_idx);
		            
		            
		            OrderDto dto = new OrderDto( order_idx,  order_status,  order_date,  order_p_name,  order_p_price,
					 order_o_name,  order_o_price,  member_name,  member_id,  member_grade2);
		            
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
		            int order_idx = rs.getInt("order_idx");
		            String order_status = rs.getString("order_status");
		            Date order_date = rs.getTimestamp("order_date");
		            int order_p_price = rs.getInt("order_p_price");
		            int order_o_price = rs.getInt("order_o_price");
		            String order_o_name = rs.getString("order_o_name");
		            String member_name2 = rs.getString("member_name");
		            String member_id = rs.getString("member_id");
		            int member_grade = rs.getInt("member_grade");
		            String order_p_name = rs.getString("order_p_name");
		            
		            System.out.println("order_idx: "+ order_idx);
		            
		            
		            OrderDto dto = new OrderDto( order_idx,  order_status,  order_date,  order_p_name,  order_p_price,
					 order_o_name,  order_o_price,  member_name2,  member_id,  member_grade);
		            
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
		            int order_idx = rs.getInt("order_idx");
		            String order_status = rs.getString("order_status");
		            Date order_date = rs.getTimestamp("order_date");
		            int order_p_price = rs.getInt("order_p_price");
		            int order_o_price = rs.getInt("order_o_price");
		            String order_o_name = rs.getString("order_o_name");
		            String member_name = rs.getString("member_name");
		            String member_id = rs.getString("member_id");
		            int member_grade = rs.getInt("member_grade");
		            String order_p_name = rs.getString("order_p_name");
		            
		            
		            OrderDto dto = new OrderDto( order_idx,  order_status,  order_date,  order_p_name,  order_p_price,
					 order_o_name,  order_o_price,  member_name,  member_id,  member_grade);
		            
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
		        	pstmt.setInt(1, Integer.parseInt( order_idx ));
		        	System.out.println("점검");
		        	rs = pstmt.executeQuery();
		        	
		        	while( rs.next() ) {
			            int order_idx2 = rs.getInt("order_idx");
			            String order_status = rs.getString("order_status");
			            Date order_date = rs.getTimestamp("order_date");
			            int order_p_price = rs.getInt("order_p_price");
			            int order_o_price = rs.getInt("order_o_price");
			            String order_o_name = rs.getString("order_o_name");
			            String member_name = rs.getString("member_name");
			            String member_id = rs.getString("member_id");
			            int member_grade = rs.getInt("member_grade");
			            String order_p_name = rs.getString("order_p_name");
			            
			            System.out.println(order_idx2);
			            
			            dto = new OrderDto( order_idx2,  order_status,  order_date,  order_p_name,  order_p_price,
								 order_o_name,  order_o_price,  member_name,  member_id,  member_grade);
			            
		        		
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
}