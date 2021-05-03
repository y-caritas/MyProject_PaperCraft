package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import controller.DBConnection;
import dto.FaqDto;

public class FaqDao {
	
	// faqList
	public static ArrayList<FaqDto> adminFaqList(String category) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<FaqDto> faqList = new ArrayList<FaqDto>();
		
		try {
			conn = DBConnection.getConnection();
			String query = "";
			if(category == null) {
				query = "SELECT * FROM p_faq ORDER BY faq_date DESC";
				pstmt = conn.prepareStatement( query );
			} else if(category.equals("faqProduct") || category.equals("faqSwap") || category.equals("faqDelivery")) {
				query = "SELECT * FROM p_faq WHERE faq_category=? ORDER BY faq_date DESC";
				pstmt = conn.prepareStatement( query );
				pstmt.setString(1, category);
			}
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				int faq_idx = rs.getInt("faq_idx");
				String faq_title = rs.getString("faq_title");
				String faq_content = rs.getString("faq_content");
				String faq_category = rs.getString("faq_category");
				Date faq_date = rs.getTimestamp("faq_date");
				
				FaqDto dto = new FaqDto(faq_idx, faq_title, faq_content, faq_category, faq_date);
				faqList.add( dto );
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return faqList;
	}
	
	
	// faqWrite
	public static int adminFaqWrite(HttpServletRequest request) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int faqResult = 0;
		
		String faq_title = request.getParameter("faq_title");
		String faq_content = request.getParameter("faq_content");
		String faq_category = request.getParameter("faq_category");
		
		try {
			conn = DBConnection.getConnection();
			String query = "INSERT INTO p_faq (faq_idx, faq_title, faq_content, faq_category, faq_date)"
					+ "VALUES (p_faq_seq.nextval, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement( query );
			pstmt.setString(1, faq_title);
			pstmt.setString(2, faq_content);
			pstmt.setString(3, faq_category);
			faqResult = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return faqResult;
	}
	
	
	// faqDelete
	public static void adminFaqDelete(int faqIdx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.getConnection();
			String query = "DELETE FROM p_faq WHERE faq_idx=?";
			pstmt = conn.prepareStatement( query );
			pstmt.setInt(1, faqIdx);
			int result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	// 이용자 화면 faq

	public static ArrayList<FaqDto> faq_list() 
	{
		ArrayList<FaqDto> list = new ArrayList<FaqDto>();
		Connection conn = null; // 데이터 접근을 위한 객체
		PreparedStatement pstmt = null; //매개변수 입력을 고려한 State클래스
		ResultSet rs = null; // 데이터를 가져와 결과값을 얻기 위한 객체
		try 
		{
			conn = DBConnection.getConnection(); //DB커넥션 객체
			String query = "select * from p_faq  order by faq_idx desc";
	        pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery(); //쿼리문 실행
			while( rs.next() ) 
			{
	            int faq_idx = rs.getInt("faq_idx");
	            String faq_title = rs.getString("faq_title");
	            String faq_content = rs.getString("faq_content");
	            String faq_category = rs.getString("faq_category");
				Date faq_date = rs.getTimestamp("faq_date");
	     
	            FaqDto dto = new FaqDto(faq_idx, faq_title, faq_content, faq_category, faq_date);
	            list.add(dto);
	        }
		}
		catch(Exception e) 
		{
			System.out.println("FAQ bug");
		}
		return list;

}
}
 

