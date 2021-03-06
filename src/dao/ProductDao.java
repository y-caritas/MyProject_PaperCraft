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
import dto.CartDto;
import dto.OptionDto;
import dto.ProductDto;

import dto.ProductEnquiryDto;
import dto.ProductReviewDto;


public class ProductDao {

	private static final String SAVE_DIR = "upload";
	//배송안내 교환안내 경로 입력필요.
	private static final String PRODUCT_DELIVERY_POLICY = "임의경로";	
	private static final String PRODUCT_SWAP_POLICY = "임의경로";
		
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
				String product_idx = rs.getString("product_idx");
	            String product_name = rs.getString("product_name");
	            String product_price = rs.getString("product_price");
	            String product_note = rs.getString("product_note");
	            String product_listImg = rs.getString("product_listImg");
	           	            
	            ProductDto dto = new ProductDto(product_idx, product_name, product_price, product_note, product_listImg);
	            product_list.add(dto);
	            System.out.println("get : "+product_list.get(0).getProduct_name());
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
				String product_idx = rs.getString("product_idx");
	            String product_name = rs.getString("product_name");
	            String product_price = rs.getString("product_price");
	            String product_note = rs.getString("product_note");
	            String product_listImg = rs.getString("product_listImg");
	            
	            ProductDto dto = new ProductDto(product_idx, product_name, product_price, product_note, product_listImg);
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
				String product_idx = rs.getString("product_idx");
	            String product_name = rs.getString("product_name");
	            String product_price = rs.getString("product_price");
	            String product_note = rs.getString("product_note");
	            String product_listImg = rs.getString("product_listImg");
	            
	            ProductDto dto = new ProductDto(product_idx, product_name, product_price, product_note, product_listImg);
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
				String product_idx = rs.getString("product_idx");
	            String product_name = rs.getString("product_name");
	            String product_price = rs.getString("product_price");
	            String product_note = rs.getString("product_note");
	            String product_listImg = rs.getString("product_listImg");
	            
	            ProductDto dto = new ProductDto(product_idx, product_name, product_price, product_note, product_listImg);
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
	public static ArrayList<ProductDto> listview_search(int product_category, String search_name) {
		ArrayList<ProductDto> product_list = new ArrayList<ProductDto>();
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		try 
		{
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_product WHERE product_category=? and product_name LIKE ?";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, product_category);
	        pstmt.setString(2, search_name);	        
			rs = pstmt.executeQuery(); 
			while( rs.next() ) 
			{
				String product_idx = rs.getString("product_idx");
	            String product_name = rs.getString("product_name");
	            String product_price = rs.getString("product_price");
	            String product_note = rs.getString("product_note");
	            String product_listImg = rs.getString("product_listImg");
	            
	            ProductDto dto = new ProductDto(product_idx, product_name, product_price, product_note, product_listImg);
	            product_list.add(dto);
	        }
		}
		catch(Exception e) 
		{
			e.printStackTrace();
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
				String product_idx = rs.getString("product_idx");
	            String product_name = rs.getString("product_name");
	            String product_price = rs.getString("product_price");
	            String product_note = rs.getString("product_note");
	            String product_listImg = rs.getString("product_listImg");
	            
	            ProductDto dto = new ProductDto(product_idx, product_name, product_price, product_note, product_listImg);
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
				String product_idx = rs.getString("product_idx");
	            String product_name = rs.getString("product_name");
	            String product_price = rs.getString("product_price");
	            String product_note = rs.getString("product_note");
	            String product_listImg = rs.getString("product_listImg");
	            
	            ProductDto dto = new ProductDto(product_idx, product_name, product_price, product_note, product_listImg);
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
				String product_idx = rs.getString("product_idx");
	            String product_name = rs.getString("product_name");
	            String product_price = rs.getString("product_price");
	            String product_note = rs.getString("product_note");
	            String product_listImg = rs.getString("product_listImg");
	            
	            ProductDto dto = new ProductDto(product_idx, product_name, product_price, product_note, product_listImg);
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
	            int delivery_policy_category = rs.getInt("delivery_policy_category");
	            String product_swap_policy = rs.getString("product_swap_policy");
	            int swap_policy_category = rs.getInt("swap_policy_category");
	            Date product_record = rs.getDate("product_record");
	            String product_memo = rs.getString("product_memo");
	            
	            productDto.setProduct_category(product_category);
	            productDto.setProduct_name(product_name);
	            productDto.setProduct_price(product_price);
	            productDto.setProduct_note(product_note);
	            productDto.setProduct_listImg(product_listImg);
	            productDto.setProduct_introImg(product_introImg);
	            productDto.setProduct_introduction(product_introduction);
	            productDto.setProduct_delivery_policy(product_delivery_policy);
	            productDto.setDelivery_policy_category(delivery_policy_category);
	            productDto.setProduct_swap_policy(product_swap_policy);
	            productDto.setSwap_policy_category(swap_policy_category);
	            productDto.setProduct_record(product_record);
	            productDto.setProduct_memo(product_memo);
	            
	        }
		}
		catch(Exception e) 
		{
			e.printStackTrace();
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
				int option_idx = rs.getInt("option_idx");
				String option_detail = rs.getString("option_detail");
	            int option_price = rs.getInt("option_price");
	            optionDto.setOption_idx(option_idx);
	            optionDto.setOption_detail(option_detail);
	            optionDto.setOption_price(option_price);
	            
	        }
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return optionDto;
}
	//상품평
	public static ArrayList<ProductReviewDto> review(String product_idx) {
		ArrayList<ProductReviewDto> review_list = new ArrayList<ProductReviewDto>();
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
	            
	            ProductReviewDto dto = new ProductReviewDto(product_r_idx, product_r_content, product_r_img, product_r_grade);
	            review_list.add(dto);	            
	        }
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return review_list;
	}
	
	//상품 문의 리스트
	public static ArrayList<ProductEnquiryDto> enquiryList(String product_idx) {		
		ArrayList<ProductEnquiryDto> enquiry_list = new ArrayList<ProductEnquiryDto>();
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
				String product_i_title = rs.getString("product_i_title");
				Date product_i_date = rs.getDate("product_i_date");
	            String member_id = rs.getString("member_id");
	            
	            ProductEnquiryDto dto = new ProductEnquiryDto(product_i_idx, product_i_title, product_i_date, member_id);
	            enquiry_list.add(dto);
	        }
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return enquiry_list;
	}

	//상품평 등록
	public static int reviewInsert(HttpServletRequest request) {		
		Connection conn = null; 
		PreparedStatement pstmt = null;
		int result = 0;
		try 
		{
			conn = DBConnection.getConnection();
			String query = "INSERT INTO p_product_review values (p_product_review_seq.nextval, ?, ?, ?, sysdate, ?, ?)";			
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
			e.printStackTrace();
		}
		
		return result;
	}

	//장바구니 기능
	public static int cartInsert(HttpServletRequest request) {
		Connection conn = null; 
		PreparedStatement pstmt = null;
		int result = 0;
		try 
		{
			conn = DBConnection.getConnection();
			String query = "INSERT INTO p_cart values (p_cart_seq.nextval, sysdate, ?, ?, ?, ?, ?, ?, ?)";			
	        pstmt = conn.prepareStatement(query);
	        System.out.println(request.getParameter("cart_p_idx"));
	        System.out.println(request.getParameter("cart_p_img"));
	        System.out.println(request.getParameter("cart_p_name"));
	        System.out.println(request.getParameter("cart_p_price"));
	        System.out.println(request.getParameter("cart_p_count"));	        
	        System.out.println(request.getParameter("member_id"));
	        
	        
	        pstmt.setInt(1, Integer.parseInt(request.getParameter("cart_p_idx")));
	        pstmt.setString(2, request.getParameter("cart_p_img") );
	        pstmt.setString(3, request.getParameter("cart_p_name") );
	        pstmt.setInt(4, Integer.parseInt(request.getParameter("cart_p_price")));
	        pstmt.setInt(5, Integer.parseInt(request.getParameter("cart_p_total_price")));
	        pstmt.setInt(6, Integer.parseInt(request.getParameter("cart_p_count")));       
	        pstmt.setString(7, request.getParameter("member_id") );	        
	        
			result = pstmt.executeUpdate();
			
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		
		return result;
	}

	//관리자 상품등록 insert 쿼리
	public static int productRegister(HttpServletRequest request) {
		Connection conn = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		int product_idx = 0;
		String ContextPath = request.getServletContext().getContextPath();
        String savePath = ContextPath +  "/upload";                
       
		try 
		{						
			conn = DBConnection.getConnection();
			String query = "INSERT INTO p_product values (p_product_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?)";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt(request.getParameter("product_category")));
	        pstmt.setString(2, request.getParameter("product_name") );
	        pstmt.setInt(3, Integer.parseInt(request.getParameter("product_price")));
	        pstmt.setString(4, request.getParameter("product_note") );
	        
	        String product_listImg = savePath + request.getParameter("product_listImg").replace("C:\\fakepath\\", "/");
	        pstmt.setString(5, product_listImg );
	        System.out.println(product_listImg);
	        
	        String product_introImg = savePath + request.getParameter("product_introImg").replace("C:\\fakepath\\", "/");
	        System.out.println(product_introImg);
	        pstmt.setString(6, product_introImg );	
	        
	        String product_introduction = savePath + request.getParameter("product_introduction").replace("C:\\fakepath\\", "/");
	        System.out.println(product_introImg);
	        pstmt.setString(7, product_introduction );
	        
	        pstmt.setString(8, PRODUCT_DELIVERY_POLICY );
	        pstmt.setInt(9, Integer.parseInt(request.getParameter("delivery_policy_category")));
	        pstmt.setString(10, PRODUCT_SWAP_POLICY);	     
	        pstmt.setInt(11, Integer.parseInt(request.getParameter("swap_policy_category")));
	        pstmt.setString(12, request.getParameter("product_memo") );
	        
			result = pstmt.executeUpdate();
			System.out.println(result);
			
			String query2 = "SELECT * FROM p_product WHERE product_introImg = ?";			
	        pstmt = conn.prepareStatement(query2);
	        System.out.println("product_introImg = "+product_introImg);
	        pstmt.setString(1, product_introImg );
			rs = pstmt.executeQuery(); 
			while( rs.next() ) 
			{
	            product_idx = rs.getInt("product_idx");
	        }
			System.out.println("product_idx = " +product_idx);
			
			String query3 = "INSERT INTO p_option values (p_option_seq.nextval, ?, ?, ?)";			
	        pstmt = conn.prepareStatement(query3);
	        pstmt.setString(1, request.getParameter("option_detail") );
	        pstmt.setInt(2, Integer.parseInt(request.getParameter("option_price")));
	        pstmt.setInt(3, product_idx);
	        
	        pstmt.executeUpdate();
			
			
			
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		
		return result;
	}


// 관리자 상품페이지 수정
	public static int productModify(HttpServletRequest request) {
		Connection conn = null; 
		PreparedStatement pstmt = null;
		int result = 0;
		String ContextPath = request.getServletContext().getContextPath();
        String savePath = ContextPath +  "/upload";
		try 
		{
			conn = DBConnection.getConnection();
			String query = "UPDATE p_product SET "					
					+ "product_category = ?, "
					+ "product_name = ?, "
					+ "product_price = ?, "
					+ "product_note = ?, "
					+ "product_listImg = ?, "
					+ "product_introImg = ?, "
					+ "product_introduction = ?, "
					+ "product_delivery_policy = ?, "
					+ "delivery_policy_category = ?, "
					+ "product_swap_policy = ?, "
					+ "swap_policy_category = ?, "
					+ "product_record = sysdate,"
					+ "product_memo = ? "
					+ "WHERE product_idx = ?";
			
	        pstmt = conn.prepareStatement(query);        
	        pstmt.setInt(1, Integer.parseInt(request.getParameter("product_category")));
	        pstmt.setString(2, request.getParameter("product_name") );
	        pstmt.setInt(3, Integer.parseInt(request.getParameter("product_price")));
	        pstmt.setString(4, request.getParameter("product_note") );
	        String product_listImg = savePath + request.getParameter("product_listImg").replace("C:\\fakepath\\", "/");
	        pstmt.setString(5, product_listImg );	        
	        String product_introImg = savePath + request.getParameter("product_introImg").replace("C:\\fakepath\\", "/");
	        pstmt.setString(6, product_introImg );
	        String product_introduction = savePath + request.getParameter("product_introduction").replace("C:\\fakepath\\", "/");	        
	        pstmt.setString(7, product_introduction );
	        pstmt.setString(8, PRODUCT_DELIVERY_POLICY );
	        pstmt.setInt(9, Integer.parseInt(request.getParameter("delivery_policy_category")));
	        pstmt.setString(10, PRODUCT_SWAP_POLICY );	     
	        pstmt.setInt(11, Integer.parseInt(request.getParameter("swap_policy_category")));
	        pstmt.setString(12, request.getParameter("product_memo") );
	        pstmt.setString(13, request.getParameter("product_idx") );
	        
			result = pstmt.executeUpdate();
			
		}
		catch(Exception e) 
		{
			e.printStackTrace();
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
			String query = "UPDATE p_option SET "					
					+ "option_detail = ?, "
					+ "option_price = ? "
					+ "WHERE option_idx = ?";
			System.out.println(query);
			System.out.println(request.getParameter("option_detail"));
			System.out.println(request.getParameter("option_price"));
			System.out.println(request.getParameter("option_idx"));
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, request.getParameter("option_detail") );
	        pstmt.setInt(2, Integer.parseInt(request.getParameter("option_price")));
	        pstmt.setInt(3, Integer.parseInt(request.getParameter("option_idx")));
	        
	        
			result = pstmt.executeUpdate();
			
		}
			catch(Exception e)
			
			{
				e.printStackTrace();
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
	            int product_idx = rs.getInt("product_idx");
	            int product_category = rs.getInt("product_category");
	            String product_name = rs.getString("product_name");
	            int product_price = rs.getInt("product_price");
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
			e.printStackTrace();
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
				int product_idx = rs.getInt("product_idx");
	            int product_category = rs.getInt("product_category");
	            String product_name = rs.getString("product_name");
	            int product_price = rs.getInt("product_price");
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
	//상세검색
	public static ArrayList<ProductDto> adminProductDetailSearch(HttpServletRequest request) {
		ArrayList<ProductDto> product_list = new ArrayList<ProductDto>();
		Connection conn = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int product_category_search = 0;
		try 
		{	
			String query = "SELECT * FROM p_product WHERE product_idx is not null ";
			
			if(request.getParameter("product_category") != "" ) {
				product_category_search = Integer.parseInt(request.getParameter("product_category"));
			}
			String[] product_prices =  request.getParameterValues("product_price[]");
			String[] product_records =  request.getParameterValues("product_record[]");					
			
			System.out.println(product_prices[0]);
			System.out.println(product_records[0]);
			
			int totalLength = 0;
			
			if(product_category_search != 0) {				
				totalLength += 1;								
				query = query + " AND product_category = ?";				
			}
			if(product_prices[0] != "") {
				totalLength += 2;
				query = query + " AND product_price >= ? AND product_price <= ?";
			}
			if(product_records[0] != "") {
				totalLength += 2;
				query = query + " AND product_record >= TO_DATE(?,'YYYY-MM-DD') AND product_record < TO_DATE(?,'YYYY-MM-DD')+1";
			}
			
			//위에 if절 boolean 값이 null 일 경우 prestatement 쿼리 인덱스 개수가 바뀌는게 문제.
			
			
			System.out.println(query);
			System.out.println(totalLength);
			
			conn = DBConnection.getConnection();
	        pstmt = conn.prepareStatement(query);
	        
	        switch(totalLength) {
	        case 1 : 
	        	pstmt.setInt(1, product_category_search);
	        	break;	        
			case 2 : 
				if(product_prices[0] != "") {
		        	pstmt.setInt(1, Integer.parseInt(product_prices[0]));
			        pstmt.setInt(2, Integer.parseInt(product_prices[1]));
	        	}
	        	if(product_records[0] != "") {
	        		pstmt.setString(1, product_records[0]);
		        	pstmt.setString(2, product_records[1]);
	        	}
	        	break;
			case 3 :
				pstmt.setInt(1, product_category_search);
				if(product_prices[0] != "") {
		        	pstmt.setInt(2, Integer.parseInt(product_prices[0]));
			        pstmt.setInt(3, Integer.parseInt(product_prices[1]));
	        	}
				if(product_records[0] != "") {
					pstmt.setString(2, product_records[0]);
		        	pstmt.setString(3, product_records[1]);			        
	        	}
	        	break;
			case 4 :
				pstmt.setInt(1, Integer.parseInt(product_prices[0]));
				pstmt.setInt(2, Integer.parseInt(product_prices[1]));
				pstmt.setString(3, product_records[0]);
	        	pstmt.setString(4, product_records[1]);
		        break;				
			case 5 : 
	        	pstmt.setInt(1, product_category_search);
	        	pstmt.setInt(2, Integer.parseInt(product_prices[0]));
	        	pstmt.setInt(3, Integer.parseInt(product_prices[1]));
	        	pstmt.setString(4, product_records[0]);
	        	pstmt.setString(5, product_records[1]);
		        break;
			default:
				System.out.println("query error");
	        }
	        
			rs = pstmt.executeQuery(); 
			
			while( rs.next() ) 
			{
				int product_idx = rs.getInt("product_idx");
	            int product_category = rs.getInt("product_category");
	            String product_name = rs.getString("product_name");
	            int product_price = rs.getInt("product_price");
	            Date product_record = rs.getDate("product_record");
	            
	            //아이디 컬럼 가져오기. 미구현
	            //조회수 기능?        
	            
	            ProductDto dto = new ProductDto(product_idx, product_category, product_name, product_price, product_record);
	            product_list.add(dto);
	        }
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return product_list;
	}

	//관리자 상품리스트 선택삭제 기능
	public static int adminProductDelete(HttpServletRequest request) {
		Connection conn = null; 
		PreparedStatement pstmt = null;
		int result = 0;
		
		String[] product_idxs =  request.getParameterValues("product_idx[]");
		String query = "DELETE FROM p_product WHERE product_idx = ?";		
		try 
		{
			conn = DBConnection.getConnection();
	        pstmt = conn.prepareStatement(query);
	        for(int i = 1; i <= product_idxs.length; i++ ) {
		        pstmt.setInt(1, Integer.parseInt( product_idxs[(i-1)] ));
				result = pstmt.executeUpdate();
	        }	        

			
		}
			catch(Exception e)
			
			{
				System.out.println("adminProductDelete bug");
			}
			
			return result;
	}
	//장바구니 보기
	public static ArrayList<CartDto> cart(String member_id) {
		ArrayList<CartDto> cart_list = new ArrayList<CartDto>();
		Connection conn = null; // 데이터 접근을 위한 객체
		PreparedStatement pstmt = null; //매개변수 입력을 고려한 State클래스
		ResultSet rs = null; // 데이터를 가져와 결과값을 얻기 위한 객체
		try 
		{
			conn = DBConnection.getConnection(); //DB커넥션 객체
			String query = "SELECT * FROM p_cart WHERE member_id=?";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, member_id);
			rs = pstmt.executeQuery(); 
			while( rs.next() ) 
			{
				int cart_idx = rs.getInt("cart_idx");
				Date cart_date = rs.getDate("cart_date");
				int cart_p_idx = rs.getInt("cart_p_idx");
				String cart_p_img = rs.getString("cart_p_img");
				String cart_p_name = rs.getString("cart_p_name");
				int cart_p_price = rs.getInt("cart_p_price");
				int cart_p_total_price = rs.getInt("cart_p_total_price");
				int cart_p_count = rs.getInt("cart_p_count");				
				String member_id2 = rs.getString("member_id");
				
	            CartDto dto = new CartDto(cart_idx, cart_date, cart_p_idx, cart_p_img, cart_p_name, cart_p_price, cart_p_total_price, cart_p_count, member_id2);
				cart_list.add(dto);
					            
	        }
		}
		catch(Exception e) 
		{
			System.out.println("cart bug");
		}
		return cart_list;
	}

	//장바구니 삭제
	public static void cartDelete(String string) {
		
		Connection conn = null; 
		PreparedStatement pstmt = null;		
		String query = "DELETE FROM p_cart WHERE cart_p_idx = ?";		
		try 
		{
			conn = DBConnection.getConnection();
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt( string ));        
	        pstmt.executeUpdate();
		}
			catch(Exception e)
			
			{
				System.out.println("adminProductDelete bug");
			}
		
	}

	public static int cartConfirm(String member_id, String product_idx) {
		CartDto dto = new CartDto();
		int confirmResult = 0; 
		int confirmFail = 0;	
		int confirmOK = 1;		
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		try 
		{
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_cart WHERE member_id = ? AND cart_p_idx = ?";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, member_id);
	        pstmt.setInt(2, Integer.parseInt( product_idx ));
	        System.out.println("member_id = "+ member_id);
	        System.out.println("product_idx = " + product_idx);
			rs = pstmt.executeQuery();
			
			while( rs.next() ) 
			{					
				int confirmCart = rs.getInt("cart_idx");				
				dto.setCart_idx(confirmCart);
				confirmResult = dto.getCart_idx();
	        }
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
	
		if(confirmResult == 0) {
			return confirmOK; 
		}
		else {
			return confirmFail;
		}			
	}

	public static int productEnquiry(HttpServletRequest request) {
		Connection conn = null; 
		PreparedStatement pstmt = null;
		int result = 0;
		try 
		{
			conn = DBConnection.getConnection();
			String query = "INSERT INTO p_product_inquiry values (p_product_inquiry_seq.nextval, ?, ?, ?, ?, ?, sysdate, ?, ?, '')";			
	        pstmt = conn.prepareStatement(query);	    	
	    	
	        System.out.println(request.getParameter("product_i_title"));
	        System.out.println(request.getParameter("product_i_content"));
	        System.out.println(request.getParameter("product_i_img"));
	        System.out.println(request.getParameter("product_i_category"));
	        System.out.println(request.getParameter("product_i_name"));
	        System.out.println(request.getParameter("member_id"));
	        System.out.println(request.getParameter("product_idx"));
	        
	        
	        pstmt.setString(1, request.getParameter("product_i_title") );
	        pstmt.setString(2, request.getParameter("product_i_content") );
	        pstmt.setString(3, request.getParameter("product_i_img") );	        
	        pstmt.setInt(4, Integer.parseInt(request.getParameter("product_i_category")));
	        pstmt.setString(5, request.getParameter("product_i_name"));
	        pstmt.setString(6, request.getParameter("member_id") );
	        pstmt.setInt(7, Integer.parseInt(request.getParameter("product_idx")));	        
			result = pstmt.executeUpdate();			
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		
		return result;
	}

	public static ProductEnquiryDto productEnquiryView(String product_i_idx) {
		
		ProductEnquiryDto productEnquiryDto = new ProductEnquiryDto();
		productEnquiryDto.setProduct_i_idx(Integer.parseInt(product_i_idx));
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		try 
		{
			conn = DBConnection.getConnection();
			String query = "SELECT * FROM p_product_inquiry WHERE product_i_idx=?";			
	        pstmt = conn.prepareStatement(query);
	        pstmt.setInt(1, Integer.parseInt(product_i_idx));	        
			rs = pstmt.executeQuery();
			
			while( rs.next() ) 
			{				
				String product_i_title = rs.getString("product_i_title");
				String product_i_content = removeTag(rs.getString("product_i_content"));
				String product_i_img = rs.getString("product_i_img");
				String product_i_category = rs.getString("product_i_category");
				String product_i_name = rs.getString("product_i_name");
	            Date product_i_date = rs.getDate("product_i_date");
	            String member_id = rs.getString("member_id");
	            int product_idx = rs.getInt("product_idx");
	            String product_i_a_content = rs.getString("product_i_a_content");
	            
	            productEnquiryDto.setProduct_i_title(product_i_title);
	            productEnquiryDto.setProduct_i_content(product_i_content);
	            productEnquiryDto.setProduct_i_img(product_i_img);
	            productEnquiryDto.setProduct_i_category(product_i_category);
	            productEnquiryDto.setProduct_i_name(product_i_name);
	            productEnquiryDto.setProduct_i_date(product_i_date);
	            productEnquiryDto.setMember_id(member_id);
	            productEnquiryDto.setProduct_idx(product_idx);
	            productEnquiryDto.setProduct_i_a_content(product_i_a_content);
	        }
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return productEnquiryDto;
	}
	public static String removeTag(String html) throws Exception {
		return html.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	}	

}