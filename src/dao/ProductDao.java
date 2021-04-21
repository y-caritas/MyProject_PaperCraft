package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import controller.DBConnection;
import dto.OptionDto;
import dto.ProductDto;
import dto.ProductEnquiryDto;
import dto.ProductReviewDto;


public class ProductDao {

	public static ArrayList<ProductDto> listview(String product_category) {
		ArrayList<ProductDto> product_list = new ArrayList<ProductDto>();
		Connection conn = null; // 데이터 접근을 위한 객체
		PreparedStatement pstmt = null; //매개변수 입력을 고려한 State클래스
		ResultSet rs = null; // 데이터를 가져와 결과값을 얻기 위한 객체
		try 
		{
			conn = DBConnection.getConnection(); //DB커넥션 객체
			String query = "SELECT * FROM p_product WHERE product_category=?";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt( product_category ));
			rs = pstmt.executeQuery(); 
			while( rs.next() ) 
			{
	            String product_name = rs.getString("product_name");
	            String product_price = rs.getString("product_price");
	            String product_note = rs.getString("product_note");
	            String product_listImg = rs.getString("product_listImg");
	            System.out.println("product_name"+product_name);
	            System.out.println("product_price"+product_price);
	            System.out.println("product_note"+product_note);
	            System.out.println("product_listImg"+product_listImg);
	            
	            ProductDto dto = new ProductDto(product_name, product_price, product_note, product_listImg);
	            product_list.add(dto);
	        }
		}
		catch(Exception e) 
		{
			System.out.println("listview bug");
		}
		return product_list;
	}

	//최신순
	public static ArrayList<ProductDto> listview_date(String product_category) {
		ArrayList<ProductDto> product_list = new ArrayList<ProductDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_product WHERE product_category=? ORDER BY product_record DESC";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt( product_category ));
			rs = pstmt.executeQuery();
			while( rs.next() ) 
			{
	            String product_name = rs.getString("product_name");
	            String product_price = rs.getString("product_price");
	            String product_note = rs.getString("product_note");
	            String product_listImg = rs.getString("product_listImg");
	            System.out.println("product_name"+product_name);
	            System.out.println("product_price"+product_price);
	            System.out.println("product_note"+product_note);
	            System.out.println("product_listImg"+product_listImg);
	            
	            ProductDto dto = new ProductDto(product_name, product_price, product_note, product_listImg);
	            product_list.add(dto);
	        }
		}
		catch(Exception e) 
		{
			System.out.println("listview_date bug");
		}
		return product_list;
	}

	//높은 가격순
	public static ArrayList<ProductDto> listview_desc(String product_category) {
		ArrayList<ProductDto> product_list = new ArrayList<ProductDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		try 
		{
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_product WHERE product_category=? ORDER BY product_price DESC";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt( product_category ));
			rs = pstmt.executeQuery();
			while( rs.next() ) 
			{
	            String product_name = rs.getString("product_name");
	            String product_price = rs.getString("product_price");
	            String product_note = rs.getString("product_note");
	            String product_listImg = rs.getString("product_listImg");
	            System.out.println("product_name"+product_name);
	            System.out.println("product_price"+product_price);
	            System.out.println("product_note"+product_note);
	            System.out.println("product_listImg"+product_listImg);
	            
	            ProductDto dto = new ProductDto(product_name, product_price, product_note, product_listImg);
	            product_list.add(dto);
	        }
		}
		catch(Exception e) 
		{
			System.out.println("listview_desc bug");
		}
		return product_list;
	}
	
	//낮은 가격순
	public static ArrayList<ProductDto> listview_asc(String product_category) {
		ArrayList<ProductDto> product_list = new ArrayList<ProductDto>();
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		try 
		{
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_product WHERE product_category=? ORDER BY product_price ASC";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt( product_category ));
			rs = pstmt.executeQuery();
			while( rs.next() ) 
			{
	            String product_name = rs.getString("product_name");
	            String product_price = rs.getString("product_price");
	            String product_note = rs.getString("product_note");
	            String product_listImg = rs.getString("product_listImg");
	            System.out.println("product_name"+product_name);
	            System.out.println("product_price"+product_price);
	            System.out.println("product_note"+product_note);
	            System.out.println("product_listImg"+product_listImg);
	            
	            ProductDto dto = new ProductDto(product_name, product_price, product_note, product_listImg);
	            product_list.add(dto);
	        }
		}
		catch(Exception e) 
		{
			System.out.println("listview_asc bug");
		}
		return product_list;
	}
	//검색 페이지
	public static ArrayList<ProductDto> listview_search(String product_category, String search_name) {
		ArrayList<ProductDto> product_list = new ArrayList<ProductDto>();
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		try 
		{
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_product WHERE product_category=? and product_name LIKE ?";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt( product_category ));
	        pstmt.setString(2, search_name);	        
			rs = pstmt.executeQuery(); 
			while( rs.next() ) 
			{
	            String product_name = rs.getString("product_name");
	            String product_price = rs.getString("product_price");
	            String product_note = rs.getString("product_note");
	            String product_listImg = rs.getString("product_listImg");
	            System.out.println("product_name"+product_name);
	            System.out.println("product_price"+product_price);
	            System.out.println("product_note"+product_note);
	            System.out.println("product_listImg"+product_listImg);
	            
	            ProductDto dto = new ProductDto(product_name, product_price, product_note, product_listImg);
	            product_list.add(dto);
	        }
		}
		catch(Exception e) 
		{
			System.out.println("listview_search bug");
		}
		return product_list;
	}
	
	//검색 최신순
	public static ArrayList<ProductDto> listview_search_date(String product_category, String search_name) {
		ArrayList<ProductDto> product_list = new ArrayList<ProductDto>();
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		try 
		{
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_product WHERE product_category=? and product_name LIKE ? ORDER BY product_record DESC";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt( product_category ));
	        pstmt.setString(2, search_name);
			rs = pstmt.executeQuery(); 
			while( rs.next() ) 
			{
	            String product_name = rs.getString("product_name");
	            String product_price = rs.getString("product_price");
	            String product_note = rs.getString("product_note");
	            String product_listImg = rs.getString("product_listImg");
	            System.out.println("product_name"+product_name);
	            System.out.println("product_price"+product_price);
	            System.out.println("product_note"+product_note);
	            System.out.println("product_listImg"+product_listImg);
	            
	            ProductDto dto = new ProductDto(product_name, product_price, product_note, product_listImg);
	            product_list.add(dto);
	        }
		}
		catch(Exception e) 
		{
			System.out.println("listview_search bug");
		}
		return product_list;
	}
	
	//검색 높은가격순
	public static ArrayList<ProductDto> listview_search_desc(String product_category, String search_name) {
		ArrayList<ProductDto> product_list = new ArrayList<ProductDto>();
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		try 
		{
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_product WHERE product_category=? and product_name LIKE ? ORDER BY product_price DESC";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt( product_category ));
	        pstmt.setString(2, search_name);
			rs = pstmt.executeQuery(); 
			while( rs.next() ) 
			{
	            String product_name = rs.getString("product_name");
	            String product_price = rs.getString("product_price");
	            String product_note = rs.getString("product_note");
	            String product_listImg = rs.getString("product_listImg");
	            System.out.println("product_name"+product_name);
	            System.out.println("product_price"+product_price);
	            System.out.println("product_note"+product_note);
	            System.out.println("product_listImg"+product_listImg);
	            
	            ProductDto dto = new ProductDto(product_name, product_price, product_note, product_listImg);
	            product_list.add(dto);
	        }
		}
		catch(Exception e) 
		{
			System.out.println("listview_search bug");
		}
		return product_list;
	}
	
	//검색 낮은가격순
	public static ArrayList<ProductDto> listview_search_asc(String product_category, String search_name) {
		ArrayList<ProductDto> product_list = new ArrayList<ProductDto>();
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		try 
		{
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_product WHERE product_category=? and product_name LIKE ? ORDER BY product_price ASC";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt( product_category ));
	        pstmt.setString(2, search_name);
			rs = pstmt.executeQuery(); 
			while( rs.next() ) 
			{
	            String product_name = rs.getString("product_name");
	            String product_price = rs.getString("product_price");
	            String product_note = rs.getString("product_note");
	            String product_listImg = rs.getString("product_listImg");
	            System.out.println("product_name"+product_name);
	            System.out.println("product_price"+product_price);
	            System.out.println("product_note"+product_note);
	            System.out.println("product_listImg"+product_listImg);
	            
	            ProductDto dto = new ProductDto(product_name, product_price, product_note, product_listImg);
	            product_list.add(dto);
	        }
		}
		catch(Exception e) 
		{
			System.out.println("listview_search bug");
		}
		return product_list;
	}
	
	// detail_page.jsp 기본기능
	public static ProductDto detailview(String product_idx) {
		ProductDto productDto = new ProductDto();
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		try 
		{
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_product WHERE product_idx=?";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt( product_idx ));
	        
			rs = pstmt.executeQuery(); 
			while( rs.next() ) 
			{				
				//DB에 배송비 컬럼이 없음 논의				
				String product_name = rs.getString("product_name");
	            int product_price = rs.getInt("product_price");
	            String product_introImg = rs.getString("product_introImg");
	            String product_introduction = rs.getString("product_introduction");
	            String product_delivery_policy = rs.getString("product_delivery_policy");
	            String product_swap_policy = rs.getString("product_swap_policy");
	            System.out.println("product_name"+product_name);
	            System.out.println("product_price"+product_price);
	            System.out.println("product_introImg"+product_introImg);
	            System.out.println("product_introduction"+product_introduction);
	            System.out.println("product_delivery_policy"+product_delivery_policy);
	            System.out.println("product_swap_policy"+product_swap_policy);	            
	            productDto.setProduct_name(product_name);
	            productDto.setProduct_price(product_price);
	            productDto.setProduct_introImg(product_introImg);
	            productDto.setProduct_introduction(product_introduction);
	            productDto.setProduct_delivery_policy(product_delivery_policy);
	            productDto.setProduct_swap_policy(product_swap_policy);	            
	            
	        }
		}
		catch(Exception e) 
		{
			System.out.println("detail_page bug");
		}
		return productDto;

}
	// detail_page.jsp 옵션 가져오기
	public static OptionDto detailview_option(String product_idx) {
		OptionDto optionDto = new OptionDto();
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		try 
		{
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_option WHERE product_idx=?";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt( product_idx ));
	        
			rs = pstmt.executeQuery(); 
			while( rs.next() ) 
			{				
				String option_category = rs.getString("option_category");
	            String option_detail = rs.getString("option_detail");
	            int option_price = rs.getInt("option_price");
	            optionDto.setOption_category(option_category);
	            optionDto.setOption_detail(option_detail);
	            optionDto.setOption_price(option_price);
	            
	        }
		}
		catch(Exception e) 
		{
			System.out.println("detail_page_option bug");
		}
		return optionDto;
}
	//상품평
	public static ProductReviewDto review(String product_idx) {
		ProductReviewDto productReviewDto = new ProductReviewDto();
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		try 
		{
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_product_review WHERE product_idx=?";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt( product_idx ));
	        
			rs = pstmt.executeQuery(); 
			while( rs.next() ) 
			{	
				int product_r_idx = rs.getInt("product_r_idx");
				String product_r_content = rs.getString("product_r_content");
				String product_r_img = rs.getString("product_r_img");
	            String product_r_grade = rs.getString("product_r_grade");
	            productReviewDto.setProduct_r_idx(product_r_idx);
	            productReviewDto.setProduct_r_content(product_r_content);
	            productReviewDto.setProduct_r_img(product_r_img);
	            productReviewDto.setProduct_r_grade(product_r_grade);
	            
	        }
		}
		catch(Exception e) 
		{
			System.out.println("review bug");
		}
		return productReviewDto;
	}
	
	//상품 문의
	public static ProductEnquiryDto enquiry(String product_idx) {
		ProductEnquiryDto productEnquiryDto = new ProductEnquiryDto();
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		try 
		{
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_product_inquiry WHERE product_idx=?";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt( product_idx ));
	        
			rs = pstmt.executeQuery(); 
			while( rs.next() ) 
			{	
				
				int product_i_idx = rs.getInt("product_i_idx");
				String product_i_content = rs.getString("product_i_content");
				Date product_i_date = rs.getDate("product_i_date");
	            String product_i_writer = rs.getString("product_i_writer");
	            productEnquiryDto.setProduct_i_idx(product_i_idx);
	            productEnquiryDto.setProduct_i_content(product_i_content);
	            productEnquiryDto.setProduct_i_date(product_i_date);
	            productEnquiryDto.setProduct_i_writer(product_i_writer);
	            
	        }
		}
		catch(Exception e) 
		{
			System.out.println("review bug");
		}
		return productEnquiryDto;
	}

	public static int reviewInsert(HttpServletRequest request) {		
		Connection conn = null; 
		PreparedStatement pstmt = null;
		int result = 0;
		try 
		{
			conn = DBConnection.getConnection();
			String query = "INSERT INTO p_product_review values (p_product_review_seq.nextval, ?, ?, ? sysdate, ?, ?)";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, request.getParameter("product_r_content") );
	        pstmt.setString(2, request.getParameter("product_r_img") );
	        pstmt.setString(3, request.getParameter("product_r_grade") );
	        pstmt.setString(4, request.getParameter("member_id") );
	        pstmt.setInt(5, Integer.parseInt(request.getParameter("product_idx")));
	        
	        
			result = pstmt.executeUpdate();
			
		}
		catch(Exception e) 
		{
			System.out.println("reviewInsert bug");
		}
		
		return result;
	}

	public static int cart(HttpServletRequest request) {
		Connection conn = null; 
		PreparedStatement pstmt = null;
		int result = 0;
		try 
		{
			conn = DBConnection.getConnection();
			String query = "INSERT INTO p_cart values (p_cart_seq.nextval, sysdate, ?, ?, ?, ?, ?, ?, ?, ?)";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt(request.getParameter("cart_p_idx")));
	        pstmt.setString(2, request.getParameter("cart_p_img") );
	        pstmt.setString(3, request.getParameter("cart_p_name") );
	        pstmt.setInt(4, Integer.parseInt(request.getParameter("cart_p_price")));
	        pstmt.setInt(5, Integer.parseInt(request.getParameter("cart_p_count")));
	        pstmt.setString(6, request.getParameter("cart_o_name") );
	        pstmt.setInt(7, Integer.parseInt(request.getParameter("cart_o_price")));
	        pstmt.setString(8, request.getParameter("member_id") );	        
	        
			result = pstmt.executeUpdate();
			
		}
		catch(Exception e) 
		{
			System.out.println("reviewInsert bug");
		}
		
		return result;
	}
}
