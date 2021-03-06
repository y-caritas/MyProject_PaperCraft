package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import controller.DBConnection;
import dto.ProductEnquiryDto;


public class ProductEnquiryDao {
	
	public static ArrayList<ProductEnquiryDto> pInquiryList() throws Exception 
	{ 
	
		ArrayList<ProductEnquiryDto> pInquiryList = new ArrayList<ProductEnquiryDto>();
		Connection conn = null;
		Statement stmt = null; 
		ResultSet rs = null; 
	
		
		try 
		{		
			conn = DBConnection.getConnection();
			String query = "select * from p_product_inquiry ORDER BY product_i_idx DESC";
			stmt = conn.createStatement();
			rs = stmt.executeQuery( query );
					
			while( rs.next() ) 
			{
				
				int product_i_idx = rs.getInt("product_i_idx");	
				System.out.println("product_i_idx:"+product_i_idx);
		        String product_i_title = rs.getString("product_i_title");
		        String product_i_content = rs.getString("product_i_content");
		        String product_i_img = rs.getString("product_i_img");
		        String product_i_category = rs.getString("product_i_category");
		        String product_i_name = rs.getString("product_i_name");
		        Date  product_i_date = rs.getTimestamp("product_i_date");
		        String member_id = rs.getString("member_id");
		        int product_idx = rs.getInt("product_idx");		        
		        String product_i_a_content = rs.getString("product_i_a_content");
		        
		        
		        System.out.println("product_i_title:"+product_i_title);
		        System.out.println("product_i_content:"+product_i_content);
		        System.out.println("product_i_img:"+product_i_img);
		        System.out.println("product_i_category:"+product_i_category	);
		        System.out.println("product_i_idx:"+product_i_idx);
		        System.out.println("product_i_idx:"+product_i_idx);
		        System.out.println("product_i_idx:"+product_i_idx);
		        
		    
		        ProductEnquiryDto dto = new ProductEnquiryDto(product_i_idx,  product_i_title, product_i_content, product_i_img,product_i_category, product_i_name, product_i_date, member_id,product_idx,product_i_a_content);
		        pInquiryList.add( dto );
		        
	        }
		}
		
	
		catch(Exception e) 
		{
			System.out.println("????????? ???????????? ???????????????.");
		}
		return pInquiryList;
	}
	

}
