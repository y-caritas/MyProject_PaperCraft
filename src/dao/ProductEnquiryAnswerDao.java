package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import controller.DBConnection;


public class ProductEnquiryAnswerDao {
	
	
	
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
	


}
