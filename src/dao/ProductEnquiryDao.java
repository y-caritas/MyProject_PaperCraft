package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import controller.DBConnection;
import dto.ProductEnquiryDto;

public class ProductEnquiryDao {
	
	public static ArrayList<ProductEnquiryDto> pEnquiry_list() throws Exception 
	{ 
	
		ArrayList<ProductEnquiryDto> list = new ArrayList<ProductEnquiryDto>();
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
	
		
		try 
		{		
			conn = DBConnection.getConnection();
			String query = "select * from p_product_inquiry by product_i_idx desc";
	        pstmt = conn.prepareStatement(query);		        
			rs = pstmt.executeQuery(); 
					
			while( rs.next() ) 
			{
				
				int product_i_idx = rs.getInt("product_i_idx");
		        String product_i_writer = rs.getString("product_i_writer");
		        String product_i_title = rs.getString("product_i_title");
		        String product_i_content = rs.getString("product_i_content");
		        String product_i_img = rs.getString("product_i_img");
		        String product_i_category = rs.getString("product_i_category");
		        String product_i_name = rs.getString("product_i_name");
		        Date  product_i_date = rs.getDate("product_i_date");
		        String member_id = rs.getString("member_id");
		        int product_idx = rs.getInt("product_idx");
		        
		    
		        ProductEnquiryDto dto = new ProductEnquiryDto(product_i_idx, product_i_writer, product_i_title, product_i_content, product_i_img,product_i_category, product_i_name, product_i_date, member_id,product_idx);
		       list.add( dto );
	        }
		}
		catch(Exception e) 
		{
			System.out.println("정보를 불러오지 못했습니다.");
		}
		return list;
	}
	
	 // 상품문의 검색 목록
	
	 public static ArrayList<ProductEnquiryDto> pInquirySearch(String productInquirySearch) {
		 Connection conn = null;
		 Statement stmt = null;
		 ResultSet rs = null;
		 ArrayList<ProductEnquiryDto> pInquiryList = new ArrayList<ProductEnquiryDto>();
		 
		 try {
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_product_inquiry WHERE product_i_title LIKE '%" +productInquirySearch + "%' OR product_i_content LIKE '%" + productInquirySearch + "%' ORDER BY product_i_date DESC";
		
			stmt = conn.createStatement();
			rs = stmt.executeQuery( query );
			
			while( rs.next() ) {
				int product_i_idx = rs.getInt("product_i_idx");
		        String product_i_writer = rs.getString("product_i_writer");
		        String product_i_title = rs.getString("product_i_title");
		        String product_i_content = rs.getString("product_i_content");
		        String product_i_img = rs.getString("product_i_img");
		        String product_i_category = rs.getString("product_i_category");
		        String product_i_name = rs.getString("product_i_name");
		        Date  product_i_date = rs.getDate("product_i_date");
		        String member_id = rs.getString("member_id");
		        int product_idx = rs.getInt("product_idx");
		        
		        ProductEnquiryDto dto = new ProductEnquiryDto(product_i_idx, product_i_writer, product_i_title, product_i_content, product_i_img,product_i_category, product_i_name, product_i_date, member_id,product_idx);
		        pInquiryList.add( dto );
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 return pInquiryList;
	 }

}
