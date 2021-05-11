package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import controller.DBConnection;
import dto.ProductEnquiryAnswerDto;

public class ProductEnquiryAnswerDao {
	
	// 답변 view
	public static ProductEnquiryAnswerDto pInquiryAnswer( String product_i_idx ) {
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 ProductEnquiryAnswerDto answerDto = new ProductEnquiryAnswerDto();
		 
		 System.out.println("productidx:"+ product_i_idx);
		 try {
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_product_inquiry_answer WHERE product_i_idx=?";
			pstmt = conn.prepareStatement( query );
			pstmt.setInt(1, Integer.parseInt(product_i_idx));
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				
				
				 int product_i_a_idx= rs.getInt("product_i_a_idx");         
				 String product_i_a_title = rs.getString("product_i_a_title");      
				 String product_i_a_content = rs.getString("product_i_a_content"); 
				 Date product_i_a_date = rs.getTimestamp("product_i_a_date");    
				 int product_i_idx1 = rs.getInt("product_i_idx");        
				 System.out.println("product_i_a_content:"+ product_i_a_content);
		        
				 answerDto = new ProductEnquiryAnswerDto(product_i_a_idx, product_i_a_title,product_i_a_content,product_i_a_date,product_i_idx1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 return answerDto;
	 }
	
	//답변 등록 
	
	public static int pInquiryReply(HttpServletRequest request) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String product_i_a_content = request.getParameter("product_i_a_content");
		int product_i_idx = Integer.parseInt(request.getParameter("product_i_idx"));
		
		System.out.println("답변내용:" +product_i_a_content);
		System.out.println("product_i_idx:" +product_i_idx);
		try {
			conn = DBConnection.getConnection();
			String query = "UPDATE p_product_inquiry SET product_i_a_content =? WHERE product_i_idx=?";
					
			pstmt = conn.prepareStatement( query );
			pstmt.setString(1, product_i_a_content);
			pstmt.setInt(2,product_i_idx);
		
			result = pstmt.executeUpdate();
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		return result;
	}
	
	//답변 수정
	
	public static void pInquiryReplyUpdate( String product_i_a_content, String product_i_idx ) {

		Connection conn = null;    
		PreparedStatement pstmt = null;   
		try {
			conn = DBConnection.getConnection();
			String query = "UPDATE p_product_inquiry_answer SET  product_i_a_content=?,"
				+ "WHERE product_i_idx=?";       
			pstmt = conn.prepareStatement( query );
			pstmt.setString(1, product_i_a_content);
			
			pstmt.setInt(2, Integer.parseInt( product_i_idx ) );
			
			
			int result = pstmt.executeUpdate(); 
			System.out.println("update result:" + result);  
			                                      
		
		} catch (Exception e) {
		e.printStackTrace();
		}

	}
	
	// 답변 삭제 
	public static void pInquiryReply_delete(int product_i_a_idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.getConnection();
			String query = "DELETE FROM p_product_inquiry_answer WHERE product_i_a_idx=?";
			pstmt = conn.prepareStatement( query );
			pstmt.setInt(1, product_i_a_idx);
			int result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
