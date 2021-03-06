package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import controller.DBConnection;
import dto.NoticeDto;


public class NoticeDao {

	public static ArrayList<NoticeDto> noticelist() {
		ArrayList<NoticeDto> noticelist = new ArrayList<NoticeDto>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			
			String query = "select * from p_notice order by notice_pin, notice_idx desc";
			rs = stmt.executeQuery(query);
			
			while( rs.next() ) {
				int notice_idx = rs.getInt("notice_idx");
				String notice_title = rs.getString("notice_title");
				String notice_content = rs.getString("notice_content");
				Date notice_date = rs.getTimestamp("notice_date");
				int notice_hit = rs.getInt("notice_hit");
				int notice_pin = rs.getInt("notice_pin");
				
				
				System.out.println("notice_idx: "+ notice_idx);
				
				NoticeDto dto = new NoticeDto(notice_idx, notice_title, notice_content, notice_date,
						notice_hit, notice_pin);
				
				noticelist.add(dto);
			}
		}
		catch( Exception e) {
			
		}
		return noticelist;
	}
	// 조회수
	public static void hit(String notice_idx) {
		
		Connection conn = null;    
        PreparedStatement pstmt = null;    //매개변수 입력 편하게 함. 
        
        try {
			conn = DBConnection.getConnection();
			String query = "UPDATE p_notice SET notice_hit=notice_hit+1 WHERE notice_idx=?";       
			pstmt = conn.prepareStatement( query );
			pstmt.setInt(1, Integer.parseInt(notice_idx) );
			
			int result = pstmt.executeUpdate(); //insert, update, delete
			System.out.println("update hit result:" + result); //0 결과없음 
			                                               //1이상 수정된 열갯수
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 공지사항 컨텐츠뷰
	public static NoticeDto contentView(String notice_idx) {
		NoticeDto dto = null;
		
		Connection conn = null;    
        PreparedStatement pstmt = null;
        ResultSet rs = null;    
        
        try {
        	conn = DBConnection.getConnection();
        	String query = "select * from p_notice where notice_idx=?";
        	pstmt = conn.prepareStatement( query  );
        	pstmt.setInt(1, Integer.parseInt( notice_idx )); //첫번째 인자(물음표)
        	rs = pstmt.executeQuery(); //select
        	System.out.println("콘텐츠뷰 작동");
        	
        	while( rs.next() ) {
        		int notice_idx_int = rs.getInt("notice_idx");
	            String notice_title = rs.getString("notice_title");
	            String notice_content = rs.getString("notice_content");
	            Date notice_date = rs.getTimestamp("notice_date");
	            int notice_hit = rs.getInt("notice_hit");
	            int notice_pin = rs.getInt("notice_pin");
	            
	            
	            dto = new NoticeDto(notice_idx_int, notice_title, notice_content, notice_date, notice_hit, notice_pin);
	            
        		
        	}
        }
        catch( Exception e ) {
        	
        }
		
		return dto;
	}
	// 공지사항 삭제버튼
	public static void noticedelete(String notice_idx) {
		Connection conn = null;    
        PreparedStatement pstmt = null;    //매개변수 입력 편하게 함. 
        
        try {
			conn = DBConnection.getConnection();
			String query = "DELETE FROM p_notice where notice_idx=?";
			pstmt = conn.prepareStatement( query );
			pstmt.setInt(1, Integer.parseInt( notice_idx ) );
			
			int result = pstmt.executeUpdate(); //insert, update, delete
			System.out.println("delete result:" + result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 공지사항 글 수정
	public static void notice_modify( String notice_idx, String notice_title, String notice_content, String notice_pin ) {

		Connection conn = null;    
		PreparedStatement pstmt = null;   
		try {
			conn = DBConnection.getConnection();
			String query = "UPDATE p_notice SET notice_title=?, "
				+ "notice_content=?, notice_pin=? WHERE notice_idx=?";       
			pstmt = conn.prepareStatement( query );
			pstmt.setString(1, notice_title);
			pstmt.setString(2, notice_content);
			pstmt.setInt(3, Integer.parseInt( notice_pin ) );
			pstmt.setInt(4, Integer.parseInt( notice_idx ) );
			
			int result = pstmt.executeUpdate(); //insert, update, delete
			System.out.println("update result:" + result); //0 결과없음 
			                                        //1이상 수정된 열갯수
		
		} catch (Exception e) {
		e.printStackTrace();
		}

	}
	
	public static void write(String notice_title, String notice_content, String notice_pin) {
		Connection conn = null;    
        PreparedStatement pstmt = null;
        
        try {
        	conn = DBConnection.getConnection();
			
			String query = "INSERT INTO p_notice (notice_idx, notice_title, notice_content, notice_pin) VALUES (p_notice_seq.nextval, ?, ?, ?)";
			pstmt = conn.prepareStatement( query );
			pstmt.setString(1, notice_title);
			pstmt.setString(2, notice_content);
			pstmt.setInt(3, Integer.parseInt(notice_pin));
			
			int result = pstmt.executeUpdate();
			System.out.println("insert result: " + result);
        }catch (Exception e) {
        	e.printStackTrace();
        }
	}
	
}
