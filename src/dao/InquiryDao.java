package dao;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import controller.DBConnection;
import dto.InquiryDto;

public class InquiryDao {
	
	private static final String SAVE_DIR = "upload";
	//파일업로드 + inquiry 테이블 저장
	public static void inquiryFileUpload(HttpServletRequest request) throws IOException, ServletException {
		
        String appPath  = request.getServletContext().getRealPath("");
        String savePath = appPath +  SAVE_DIR;
        String inquiryFilename = null;
        String newFilename = null;
        
        File fileSaveDir = new File(savePath);
        if( !fileSaveDir.exists() ) {
            fileSaveDir.mkdir();
        }

        for (Part part : request.getParts()) {
            String fileName = extractFileName(part.getHeader("Content-Disposition"));
            if(fileName != null) {
            	
            	System.out.println("fileName:"+fileName);
                System.out.println("savePath:"+savePath);
                inquiryFilename = savePath + File.separator + fileName;
                
                part.write( inquiryFilename );
                
                int idx = fileName.lastIndexOf(".");
                String fileFormat = fileName.substring(idx);
                
                SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
                Date time = new Date();
                String uploadTime = format.format(time); 
                
                File file = new File(inquiryFilename);
                file.renameTo( new File(savePath + File.separator + uploadTime + fileFormat) );
                
                part.write(savePath + File.separator + uploadTime + fileFormat);
                
    			String ContextPath = request.getContextPath();
    	        System.out.println("ContextPath:"+ContextPath);
    	        
    	        newFilename = ContextPath + "/" + SAVE_DIR + "/"+ uploadTime + fileFormat;
            }     
        }
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        String inquiry_title = request.getParameter("inquiry_title");
        int inquiry_category = Integer.parseInt(request.getParameter("inquiry_category"));
        String inquiry_writer = request.getParameter("inquiry_writer");
        String inquiry_pw = request.getParameter("inquiry_pw");
        String inquiry_content = request.getParameter("inquiry_content");
        String inquiry_img = newFilename;
        String member_id = request.getParameter("member_id");
        
        try {
			conn = DBConnection.getConnection();
			String query = "INSERT INTO p_inquiry(inquiry_idx, inquiry_category, inquiry_title,"
					+ "inquiry_content, inquiry_img, inquiry_writer, inquiry_pw, inquiry_date, member_id)"
					+ "VALUES(p_inquiry_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate, ?)";
			pstmt = conn.prepareStatement( query );
			pstmt.setInt(1, inquiry_category);
			pstmt.setString(2, inquiry_title);
			pstmt.setString(3, inquiry_content);
			pstmt.setString(4, inquiry_img);
			pstmt.setString(5, inquiry_writer);
			pstmt.setString(6, inquiry_pw);
			pstmt.setString(7, member_id);
			
			int result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	// 업로드 파일명
	 private static String extractFileName(String partHeader) {
	    	System.out.println(partHeader);
	        for (String cd : partHeader.split(";")) {
	            if (cd.trim().startsWith("filename")) {
	                String fileName = cd.substring(cd.indexOf("=") +  1).trim().replace("\"", "");
	                int index = fileName.lastIndexOf(File.separator);
	                if(fileName.substring(index + 1).equals("")) {
	                	return null;
	                } else {
	                	return fileName.substring(index + 1);
	                }
	            }
	        }
	        return null;
	    }
	 
	 
	 // inquiry 목록
	 public static ArrayList<InquiryDto> inquiryList() {
		 Connection conn = null;
		 Statement stmt = null;
		 ResultSet rs = null;
		 ArrayList<InquiryDto> inquiryList = new ArrayList<InquiryDto>();
		 
		 try {
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_inquiry ORDER BY inquiry_date DESC";
			stmt = conn.createStatement();
			rs = stmt.executeQuery( query );
			
			while( rs.next() ) {
				int inquiry_idx = rs.getInt("inquiry_idx");
		        int inquiry_category = rs.getInt("inquiry_category");
		        String inquiry_title = rs.getString("inquiry_title");
		        String inquiry_content = rs.getString("inquiry_content");
		        String inquiry_img = rs.getString("inquiry_img");
		        String inquiry_writer = rs.getString("inquiry_writer");
		        String inquiry_pw = rs.getString("inquiry_pw");
		        Date inquiry_date = rs.getTimestamp("inquiry_date");
		        String member_id = rs.getString("member_id");
		        
		        InquiryDto dto = new InquiryDto(inquiry_idx, inquiry_category, inquiry_title, inquiry_content, inquiry_img, inquiry_writer, inquiry_pw, inquiry_date, member_id);
		        inquiryList.add( dto );
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 return inquiryList;
	 }
	 
	 
	 // inquiry content
	 public static InquiryDto inquiryContent( int inquiryIdx ) {
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 InquiryDto dto = new InquiryDto();
		 
		 try {
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_inquiry WHERE inquiry_idx=?";
			pstmt = conn.prepareStatement( query );
			pstmt.setInt(1, inquiryIdx);
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				int inquiry_idx = rs.getInt("inquiry_idx");
		        int inquiry_category = rs.getInt("inquiry_category");
		        String inquiry_title = rs.getString("inquiry_title");
		        String inquiry_content = rs.getString("inquiry_content");
		        String inquiry_img = rs.getString("inquiry_img");
		        String inquiry_writer = rs.getString("inquiry_writer");
		        String inquiry_pw = rs.getString("inquiry_pw");
		        Date inquiry_date = rs.getTimestamp("inquiry_date");
		        String member_id = rs.getString("member_id");
		        
		        dto = new InquiryDto(inquiry_idx, inquiry_category, inquiry_title, inquiry_content, inquiry_img, inquiry_writer, inquiry_pw, inquiry_date, member_id);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 return dto;
	 }
	 
	 
	 // inquiry 비밀번호 확인
	 public static int inquiryComparePW(int inquiryIdx, String inquiryPW) {
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 int compareResult = 0;
		 
		 try {
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_inquiry WHERE inquiry_idx=?";
			pstmt = conn.prepareStatement( query );
			pstmt.setInt(1, inquiryIdx);
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				String inquiry_pw = rs.getString("inquiry_pw");
				
				if(inquiry_pw.equals( inquiryPW )) {
					compareResult = 1;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 return compareResult;
	 }
	 
	 
	 // 주문제작/문의 글 삭제
	 public static void inquiryDelete( int inquiryIdx ) {
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 
		 try {
			conn = DBConnection.getConnection();
			String query = "DELETE FROM p_inquiry WHERE inquiry_idx=?";
			pstmt = conn.prepareStatement( query );
			pstmt.setInt(1, inquiryIdx);
			int result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 
	 
	 // admin_inquiry 선택 목록
	 public static ArrayList<InquiryDto> adminInquirySelect(int inquiryCategory) {
		 Connection conn = null;
		 Statement stmt = null;
		 ResultSet rs = null;
		 ArrayList<InquiryDto> inquirySelectList = new ArrayList<InquiryDto>();
		 
		 try {
			conn = DBConnection.getConnection();
			String query = "";
			if(inquiryCategory == 1 || inquiryCategory == 2) {
				query = "SELECT * FROM p_inquiry WHERE inquiry_category="+inquiryCategory+"ORDER BY inquiry_date DESC";
			} else if(inquiryCategory == 0) {
				query = "SELECT * FROM p_inquiry ORDER BY inquiry_date DESC";
			}
			stmt = conn.createStatement();
			rs = stmt.executeQuery( query );
			
			while( rs.next() ) {
				int inquiry_idx = rs.getInt("inquiry_idx");
		        int inquiry_category = rs.getInt("inquiry_category");
		        String inquiry_title = rs.getString("inquiry_title");
		        String inquiry_content = rs.getString("inquiry_content");
		        String inquiry_img = rs.getString("inquiry_img");
		        String inquiry_writer = rs.getString("inquiry_writer");
		        String inquiry_pw = rs.getString("inquiry_pw");
		        Date inquiry_date = rs.getTimestamp("inquiry_date");
		        String member_id = rs.getString("member_id");
		        
		        InquiryDto dto = new InquiryDto(inquiry_idx, inquiry_category, inquiry_title, inquiry_content, inquiry_img, inquiry_writer, inquiry_pw, inquiry_date, member_id);
		        inquirySelectList.add( dto );
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 return inquirySelectList;
	 }
	 
	 
	 // admin_inquiry 검색 목록
	 public static ArrayList<InquiryDto> adminInquirySearch(String searchCategory, String searchContent) {
		 Connection conn = null;
		 Statement stmt = null;
		 ResultSet rs = null;
		 ArrayList<InquiryDto> inquiryList = new ArrayList<InquiryDto>();
		 
		 try {
			conn = DBConnection.getConnection();
			String query = "";
			if(searchCategory.equals("titleAndContent")) {
				query = "SELECT * FROM p_inquiry WHERE inquiry_title LIKE '%" + searchContent + "%' OR inquiry_content LIKE '%" + searchContent + "%' ORDER BY inquiry_date DESC";
			} else if(searchCategory.equals("title")) {
				query = "SELECT * FROM p_inquiry WHERE inquiry_title LIKE '%" + searchContent + "%' ORDER BY inquiry_date DESC";
			} else if(searchCategory.equals("content")) {
				query = "SELECT * FROM p_inquiry WHERE inquiry_content LIKE '%" + searchContent + "%' ORDER BY inquiry_date DESC";
			}
			stmt = conn.createStatement();
			rs = stmt.executeQuery( query );
			
			while( rs.next() ) {
				int inquiry_idx = rs.getInt("inquiry_idx");
		        int inquiry_category = rs.getInt("inquiry_category");
		        String inquiry_title = rs.getString("inquiry_title");
		        String inquiry_content = rs.getString("inquiry_content");
		        String inquiry_img = rs.getString("inquiry_img");
		        String inquiry_writer = rs.getString("inquiry_writer");
		        String inquiry_pw = rs.getString("inquiry_pw");
		        Date inquiry_date = rs.getTimestamp("inquiry_date");
		        String member_id = rs.getString("member_id");
		        
		        InquiryDto dto = new InquiryDto(inquiry_idx, inquiry_category, inquiry_title, inquiry_content, inquiry_img, inquiry_writer, inquiry_pw, inquiry_date, member_id);
		        inquiryList.add( dto );
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 return inquiryList;
	 }

}
