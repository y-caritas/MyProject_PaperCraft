package dao;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import controller.DBConnection;
import dto.OptionDto;
import dto.ProductDto;
import dto.ProductEnquiryDto;
import dto.ProductReviewDto;


public class ProductDao {

	private static final String SAVE_DIR = "upload";
		
	// 파일 업로드
public static int upload(HttpServletRequest request) throws IOException, ServletException {
    	
    	int result = 0;
    	            	
        String appPath  = request.getServletContext().getRealPath("");
        String savePath = appPath +  SAVE_DIR;        

        File fileSaveDir = new File(savePath);
        if( !fileSaveDir.exists() ) {
            fileSaveDir.mkdir();
        }

        for (Part part : request.getParts()) {
            String fileName = extractFileName(part.getHeader("Content-Disposition"));
            System.out.println("fileName:"+fileName);
            System.out.println("savePath:"+savePath);
            part.write(savePath + File.separator + fileName);            
			
			String ContextPath = request.getServletContext().getContextPath();
	        System.out.println("ContextPath:"+ContextPath);
	        //localhost:포트번호 주의
            request.setAttribute("fileFullPath", "http://localhost:8090" + ContextPath + "/" + SAVE_DIR + "/"+ fileName);            
        }

        return result;
    }

    private static String extractFileName(String partHeader) {
        for (String cd : partHeader.split(";")) {        	
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf("=") +  1).trim().replace("\"", "");;
                int index = fileName.lastIndexOf(File.separator);
                return fileName.substring(index + 1);
            }
        }
        return null;
    }
	
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
				int product_category = rs.getInt("product_category");
				String product_name = rs.getString("product_name");
	            int product_price = rs.getInt("product_price");
	            String product_note = rs.getString("product_note");
	            String product_listImg = rs.getString("product_listImg");
	            String product_introImg = rs.getString("product_introImg");
	            String product_introduction = rs.getString("product_introduction");
	            String product_delivery_policy = rs.getString("product_delivery_policy");
	            int product_delivery_policy_category = rs.getInt("product_delivery_policy_category");
	            String product_swap_policy = rs.getString("product_swap_policy");
	            int product_swap_policy_category = rs.getInt("product_swap_policy_category");
	            Date product_record = rs.getDate("product_record");
	            String product_memo = rs.getString("product_memo");
	            
	            System.out.println("product_name"+product_name);
	            System.out.println("product_price"+product_price);
	            System.out.println("product_introImg"+product_introImg);
	            System.out.println("product_introduction"+product_introduction);
	            System.out.println("product_delivery_policy"+product_delivery_policy);
	            System.out.println("product_swap_policy"+product_swap_policy);	   
	            
	            productDto.setProduct_category(product_category);
	            productDto.setProduct_name(product_name);
	            productDto.setProduct_price(product_price);
	            productDto.setProduct_listImg(product_listImg);
	            productDto.setProduct_introImg(product_introImg);
	            productDto.setProduct_introduction(product_introduction);
	            productDto.setProduct_delivery_policy(product_delivery_policy);
	            productDto.setProduct_delivery_policy_category(product_delivery_policy_category);
	            productDto.setProduct_swap_policy(product_swap_policy);
	            productDto.setProduct_swap_policy_category(product_swap_policy_category);
	            productDto.setProduct_record(product_record);
	            productDto.setProduct_memo(product_memo);
	            
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
				String option_name = rs.getString("option_name");
	            int option_price = rs.getInt("option_price");	            
	            optionDto.setOption_detail(option_name);
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
	
	//상품 문의 리스트
	public static ProductEnquiryDto enquiryList(String product_idx) {
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
			System.out.println("enquiryList bug");
		}
		return productEnquiryDto;
	}

	//상품평 등록
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

	//장바구니 기능
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
			System.out.println("cart bug");
		}
		
		return result;
	}

	//관리자 상품등록 insert 쿼리
	public static int productRegister(HttpServletRequest request) {
		Connection conn = null; 
		PreparedStatement pstmt = null;
		int result = 0;
		String appPath  = request.getServletContext().getRealPath("");
        String savePath = appPath +  "upload";
		try 
		{
			conn = DBConnection.getConnection();
			String query = "INSERT INTO p_product values (p_product_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?)";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt(request.getParameter("product_category")));
	        pstmt.setString(2, request.getParameter("product_name") );
	        pstmt.setInt(3, Integer.parseInt(request.getParameter("product_price")));
	        pstmt.setString(4, request.getParameter("product_note") );
	        String product_listImg = savePath + request.getParameter("product_listImg").replace("C:\\fakepath", "");
	        pstmt.setString(5, savePath + product_listImg );
	        String product_introImg = savePath + request.getParameter("product_introImg").replace("C:\\fakepath", "");
	        pstmt.setString(6, savePath + product_introImg );	        
	        pstmt.setString(7, request.getParameter("product_introduction") );
	        pstmt.setString(8, request.getParameter("product_delivery_policy") );
	        pstmt.setInt(9, Integer.parseInt(request.getParameter("product_delivery_policy_category")));
	        pstmt.setString(10, request.getParameter("product_swap_policy") );	     
	        pstmt.setInt(11, Integer.parseInt(request.getParameter("product_swap_policy_category")));
	        pstmt.setString(12, request.getParameter("product_memo") );
	        
			result = pstmt.executeUpdate();
			
		}
		catch(Exception e) 
		{
			System.out.println("productRegister bug");
		}
		
		return result;
	}
	
//관리자 상품등록 옵션 insert 쿼리
	public static int productRegister_option(HttpServletRequest request) {
		Connection conn = null; 
		PreparedStatement pstmt = null;
		int result_Option = 0;
		int product_idx = 0;
		
		//product_idx 가져오기
		product_idx = getProduct_idx(request); 
				
		try 
		{
			conn = DBConnection.getConnection();
			String query = "INSERT INTO p_option values (p_option_seq.nextval, ?, ?, ?)";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, request.getParameter("option_name") );
	        pstmt.setInt(2, Integer.parseInt(request.getParameter("option_price")));
	        pstmt.setInt(3, product_idx);
	        
	        result_Option = pstmt.executeUpdate();
			
		}
		catch(Exception e) 
		{
			System.out.println("productRegister_option bug");
		}
		
		return result_Option;
	}
	
	//Product_idx 값 가져오기
	private static int getProduct_idx(HttpServletRequest request) {
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		int product_idx = 0;
		try 
		{
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_product WHERE product_category=? and product_name=?";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt(request.getParameter("product_category")));
	        pstmt.setString(2, request.getParameter("product_name") );
			rs = pstmt.executeQuery(); 
			while( rs.next() ) 
			{
	            product_idx = rs.getInt("product_idx");
	        }
		}
		catch(Exception e) 
		{
			System.out.println("getProduct_idx bug");
		}
		return product_idx;
	}

// 관리자 상품페이지 수정
	public static int productModify(HttpServletRequest request) {
		Connection conn = null; 
		PreparedStatement pstmt = null;
		int result = 0;
		try 
		{
			conn = DBConnection.getConnection();
			String query = "UPDATE p_product SET ("					
					+ "product_category = ?, "
					+ "product_name = ?, "
					+ "product_price = ?, "
					+ "product_note = ?, "
					+ "product_listImg = ?, "
					+ "product_introImg = ?, "
					+ "product_introduction = ?, "
					+ "product_delivery_policy = ?, "
					+ "product_delivery_policy_category = ?, "
					+ "product_swap_policy = ?, "
					+ "product_swap_policy_category = ?, "
					+ "sysdate,"
					+ "product_memo = ? "
					+ "WHERE product_idx = ?)";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt(request.getParameter("product_category")));
	        pstmt.setString(2, request.getParameter("product_name") );
	        pstmt.setInt(3, Integer.parseInt(request.getParameter("product_price")));
	        pstmt.setString(4, request.getParameter("product_note") );
	        pstmt.setString(5, request.getParameter("product_listImg") );
	        pstmt.setString(6, request.getParameter("product_introImg") );
	        pstmt.setString(7, request.getParameter("product_introduction") );
	        pstmt.setString(8, request.getParameter("product_delivery_policy") );
	        pstmt.setInt(9, Integer.parseInt(request.getParameter("product_delivery_policy_category")));
	        pstmt.setString(10, request.getParameter("product_swap_policy") );	     
	        pstmt.setInt(11, Integer.parseInt(request.getParameter("product_swap_policy_category")));
	        pstmt.setString(12, request.getParameter("product_memo") );
	        pstmt.setString(13, request.getParameter("product_idx") );
	        
			result = pstmt.executeUpdate();
			
		}
		catch(Exception e) 
		{
			System.out.println("productModify bug");
		}
		
		return result;
	}

	//옵션 변경
	public static int productModify_option(HttpServletRequest request) {
		Connection conn = null; 
		PreparedStatement pstmt = null;
		int result = 0;
		try 
		{
			conn = DBConnection.getConnection();
			String query = "UPDATE p_option SET ("					
					+ "option_detail = ?, "
					+ "option_price = ?, "
					+ "WHERE option_idx = ?)";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, request.getParameter("option_detail") );
	        pstmt.setInt(2, Integer.parseInt(request.getParameter("option_price")));
	        pstmt.setInt(3, Integer.parseInt(request.getParameter("option_idx")));
	        
			result = pstmt.executeUpdate();
			
		}
			catch(Exception e)
			
			{
				System.out.println("productModify_option bug");
			}
			
			return result;
	}

	//관리자 상품리스트 기본	
	public static ArrayList<ProductDto> adminProductList() {
		ArrayList<ProductDto> product_list = new ArrayList<ProductDto>();
		Connection conn = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			conn = DBConnection.getConnection(); //DB커넥션 객체
			String query = "SELECT * FROM p_product";			
	        pstmt = conn.prepareStatement(query);	        
			rs = pstmt.executeQuery(); 
			
			while( rs.next() ) 
			{
	            int product_idx = rs.getInt("product_name");
	            int product_category = rs.getInt("product_price");
	            String product_name = rs.getString("product_note");
	            int product_price = rs.getInt("product_listImg");
	            Date product_record = rs.getDate("product_record");
	            
	            //아이디 컬럼 가져오기. 미구현
	            //조회수 기능?
	            
	            System.out.println("product_idx"+product_idx);
	            System.out.println("product_category"+product_category);
	            System.out.println("product_name"+product_name);
	            System.out.println("product_price"+product_price);
	            System.out.println("product_record"+product_record);
	            
	            ProductDto dto = new ProductDto(product_idx, product_category, product_name, product_price, product_record);
	            product_list.add(dto);
	        }
		}
		catch(Exception e) 
		{
			System.out.println("adminProductList bug");
		}
		return product_list;
	}
	
	//관리자 상품리스트 상품명 검색	
	public static ArrayList<ProductDto> adminProductNameSearch(String search_product_name) {
		ArrayList<ProductDto> product_list = new ArrayList<ProductDto>();
		Connection conn = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try 
		{
			conn = DBConnection.getConnection(); //DB커넥션 객체
			String query = "SELECT * FROM p_product WHERE product_name LIKE ?";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, search_product_name );			        
			rs = pstmt.executeQuery(); 
			
			while( rs.next() ) 
			{
	            int product_idx = rs.getInt("product_name");
	            int product_category = rs.getInt("product_price");
	            String product_name = rs.getString("product_note");
	            int product_price = rs.getInt("product_listImg");
	            Date product_record = rs.getDate("product_record");
	            
	            //아이디 컬럼 가져오기. 미구현
	            //조회수 기능?
	            
	            System.out.println("product_idx"+product_idx);
	            System.out.println("product_category"+product_category);
	            System.out.println("product_name"+product_name);
	            System.out.println("product_price"+product_price);
	            System.out.println("product_record"+product_record);
	            
	            ProductDto dto = new ProductDto(product_idx, product_category, product_name, product_price, product_record);
	            product_list.add(dto);
	        }
		}
		catch(Exception e) 
		{
			System.out.println("adminProductNameSearch bug");
		}
		return product_list;
	}

	public static ArrayList<ProductDto> adminProductDetailSearch(HttpServletRequest request) {
		// 상세검색
		return null;
	}

	public static int adminProductDelete(HttpServletRequest request) {
		// 삭제기능
		return 0;
	}


}