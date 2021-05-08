package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import controller.DBConnection;
import dto.ProductEnquiryAnswerDto;

public class ProductEnquiryAnswerDao {
	
	public static ProductEnquiryAnswerDto pInquiryAnswer( String product_i_idx ) {
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 ProductEnquiryAnswerDto dto = new ProductEnquiryAnswerDto();
		 
		 try {
			conn = DBConnection.getConnection();
			String query = "SELECT * FROMp_product_inquiry_answer WHERE product_i_idx=?";
			pstmt = conn.prepareStatement( query );
			pstmt.setInt(1, Integer.parseInt( product_i_idx ));
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				
				
				 int product_i_a_idx= rs.getInt("product_i_a_idx");         
				 String product_i_a_title = rs.getString("product_i_a_title");      
				 String product_i_a_content = rs.getString("product_i_a_content"); 
				 Date product_i_a_date = rs.getDate("product_i_a_date");    
				 int product_i_idx1 = rs.getInt("product_i_idx");        
				
		        
				 dto = new ProductEnquiryAnswerDto(product_i_a_idx, product_i_a_title,product_i_a_content,product_i_a_date,product_i_idx1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 return dto;
	 }

}
