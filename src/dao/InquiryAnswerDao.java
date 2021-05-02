package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import controller.DBConnection;
import dto.InquiryAnswerDto;

public class InquiryAnswerDao {
	// admin inquiry content
	public static InquiryAnswerDto inquiryAnswerContent(int inquiryIdx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		InquiryAnswerDto answerDto = new InquiryAnswerDto();
		
		try {
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_inquiry_answer WHERE inquiry_idx=?";
			pstmt = conn.prepareStatement( query );
			pstmt.setInt(1, inquiryIdx);
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				int inquiry_a_idx = rs.getInt("inquiry_a_idx");
				String inquiry_a_title = rs.getString("inquiry_a_title");
				String inquiry_a_content = rs.getString("inquiry_a_content");
				Date inquiry_a_date = rs.getTimestamp("inquiry_a_date");
				int inquiry_idx = rs.getInt("inquiry_idx");
				
				answerDto = new InquiryAnswerDto(inquiry_a_idx, inquiry_a_title, inquiry_a_content, inquiry_a_date, inquiry_idx);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return answerDto;
	}
	
	
	// inquiry 답변 등록
	public static int adminInquiryAnswerWrite(String inquiryATitle, String inquiryAContent, int inquiryIdx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			conn = DBConnection.getConnection();
			String query = "INSERT INTO p_inquiry_answer (inquiry_a_idx, inquiry_a_title, inquiry_a_content, inquiry_a_date, inquiry_idx)"
					+ "VALUES(p_inquiry_answer_seq.nextval, ?, ?, sysdate, ?)";
			pstmt = conn.prepareStatement( query );
			pstmt.setString(1, inquiryATitle);
			pstmt.setString(2, inquiryAContent);
			pstmt.setInt(3, inquiryIdx);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	
	// inquiry 답변 삭제
	public static void adminInquiryAnswerDelete(int inquiryIdx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.getConnection();
			String query = "DELETE FROM p_inquiry_answer WHERE inquiry_idx=?";
			pstmt = conn.prepareStatement( query );
			pstmt.setInt(1, inquiryIdx);
			int result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
