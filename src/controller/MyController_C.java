package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import dto.OptionDto;
import dto.ProductDto;
import dto.ProductEnquiryDto;
import dto.ProductReviewDto;


//@WebServlet(urlPatterns= {"*.do"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, 
maxFileSize = 1024 * 1024 * 30, 
maxRequestSize = 1024 * 1024 * 50)
public class MyController_C extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
	
	void doProcess( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		String requestURI = request.getRequestURI();
		int cmdIdx = requestURI.lastIndexOf("/")+1;
		String command = requestURI.substring(cmdIdx);
		String jspPage = "";
		System.out.println("command:"+command);
		
		if(command.equals("") || command.equals("/"))
		{
		response.sendRedirect("/MyProject_PaperCraft/main.jsp");
		}
		//상품리스트
		else if(command.equals("listview.do"))
		{		
		String product_category =  request.getParameter("product_category");
		String orderby =  request.getParameter("orderby");
		System.out.println(product_category);
		System.out.println(orderby);
		
			// 기본 상품 리스트
			if(orderby.equals("01")) {
			ArrayList<ProductDto> product_list = ProductDao.listview(product_category);
	        request.setAttribute("product_list", product_list);
			}
			
			// 최신순
			if(orderby.equals("02")) {
			ArrayList<ProductDto> product_list = ProductDao.listview_date(product_category);
	        request.setAttribute("product_list", product_list);
	        
			}
			
			// 높은 가격순
			if(orderby.equals("03")) {
			ArrayList<ProductDto> product_list = ProductDao.listview_desc(product_category);
	        request.setAttribute("product_list", product_list);		    	
			}
			
			// 낮은 가격순
			if(orderby.equals("04")) {
			ArrayList<ProductDto> product_list = ProductDao.listview_asc(product_category);
	        request.setAttribute("product_list", product_list);		    	
			}
		
			RequestDispatcher dispatcher = request.getRequestDispatcher("/product/listview.jsp");
			dispatcher.forward(request, response);
			
		}
		
		//검색 페이지
		else if(command.equals("listviewsearch.do")) {
			String product_category =  request.getParameter("product_category");
			String search_name =  request.getParameter("search_name");
			System.out.println(product_category);
			System.out.println(search_name);
			
			ArrayList<ProductDto> product_list = ProductDao.listview_search(product_category, search_name);
	        request.setAttribute("product_list", product_list);
	        request.setAttribute("product_category", product_category);
	        request.setAttribute("search_name", search_name);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/listview.jsp");
			dispatcher.forward(request, response);
			
		}
		
		//검색 최신순
		else if(command.equals("listviewsearchDate.do")) {
			String product_category =  request.getParameter("product_category");
			String search_name =  request.getParameter("search_name");
			System.out.println(product_category);
			System.out.println(search_name);
			
			ArrayList<ProductDto> product_list = ProductDao.listview_search_date(product_category, search_name);
	        request.setAttribute("product_list", product_list);
	        request.setAttribute("search_name", search_name);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/listview.jsp");
			dispatcher.forward(request, response);			
		}
		
		//검색 높은가격순
		else if(command.equals("listviewsearchDesc.do")) {
			String product_category =  request.getParameter("product_category");
			String search_name =  request.getParameter("search_name");
			System.out.println(product_category);
			System.out.println(search_name);
			
			ArrayList<ProductDto> product_list = ProductDao.listview_search_desc(product_category, search_name);
	        request.setAttribute("product_list", product_list);
	        request.setAttribute("search_name", search_name);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/listview.jsp");
			dispatcher.forward(request, response);			
		}
		
		//검색 낮은가격순
		else if(command.equals("listviewsearchAsc.do")) {
			String product_category =  request.getParameter("product_category");
			String search_name =  request.getParameter("search_name");
			System.out.println(product_category);
			System.out.println(search_name);
			
			ArrayList<ProductDto> product_list = ProductDao.listview_search_asc(product_category, search_name);
	        request.setAttribute("product_list", product_list);
	        request.setAttribute("search_name", search_name);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/listview.jsp");
			dispatcher.forward(request, response);			
		}
		
		//detail_page.jsp 컨트롤러
		else if(command.equals("detailview.do")) {
			String product_idx = request.getParameter("product_idx");
			System.out.println(product_idx);
			
			ProductDto productDto = ProductDao.detailview(product_idx);
			OptionDto optionDto = ProductDao.detailview_option(product_idx);
			ProductReviewDto productReviewDto = ProductDao.review(product_idx);
			ProductEnquiryDto productEnquiryDto = ProductDao.enquiryList(product_idx);
			
			//테스트 필요.
			request.setAttribute("product_idx", product_idx);
	        request.setAttribute("productDto", productDto);
	        request.setAttribute("optionDto", optionDto);
	        request.setAttribute("productReviewDto", productReviewDto);
	        request.setAttribute("productEnquiryDto", productEnquiryDto);			
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/detail_page.jsp");
			dispatcher.forward(request, response);			
		}
		
		//상품평 등록
		else if(command.equals("reviewinsert.do")) {
			request.setCharacterEncoding("UTF-8");
			String product_idx = request.getParameter("product_idx");
			
			int result = ProductDao.reviewInsert(request);
			
			ProductDto productDto = ProductDao.detailview(product_idx);
			OptionDto optionDto = ProductDao.detailview_option(product_idx);
			ProductReviewDto productReviewDto = ProductDao.review(product_idx);
			ProductEnquiryDto productEnquiryDto = ProductDao.enquiryList(product_idx);
			
			//테스트 필요.
			request.setAttribute("product_idx", product_idx);
	        request.setAttribute("productDto", productDto);
	        request.setAttribute("optionDto", optionDto);
	        request.setAttribute("productReviewDto", productReviewDto);
	        request.setAttribute("productEnquiryDto", productEnquiryDto);			
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/detail_page.jsp");
			dispatcher.forward(request, response);	
		}
		
		//구매하기
		else if(command.equals("purchase.do")) {
			
			request.setCharacterEncoding("UTF-8");
			//상품가격
			String p_price = request.getParameter("cart_p_price");
			//상품 개수
			String p_count = request.getParameter("cart_p_count");
			//총 가격
			String p_total_price = request.getParameter("cart_p_total_price");
			//product 테이블 인덱스
			String p_idx = request.getParameter("cart_p_idx");
			//이미지
			String p_img = request.getParameter("cart_p_img");			
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/order/orderForm.jsp");
			dispatcher.forward(request, response);
		}
		
		//장바구니
		else if(command.equals("cart.do")) {
			
			request.setCharacterEncoding("UTF-8");
			String product_idx = request.getParameter("product_idx");
			
			int result = ProductDao.cart(request);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/myPage/cart.jsp");
			dispatcher.forward(request, response);
			
		}
		
		//관리자 상품등록하기
		else if(command.equals("productRegister.do")) {
			
			request.setCharacterEncoding("UTF-8");			
			int result = ProductDao.productRegister(request);
			int result_Option = ProductDao.productRegister_option(request);
			
			ProductDao.upload(request);			
			request.setAttribute("message", "파일업로드에 성공 하였습니다.!");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin_productRegistration.jsp");
			dispatcher.forward(request, response);
		}
		
		//Modify view용
		else if(command.equals("adminProductView.do")) {
			
			request.setCharacterEncoding("UTF-8");

			String product_idx = request.getParameter("product_idx");
			
			ProductDto productDto = ProductDao.detailview(product_idx);
			OptionDto optionDto = ProductDao.detailview_option(product_idx);
			request.setAttribute("product_idx", product_idx);
	        request.setAttribute("productDto", productDto);
	        request.setAttribute("optionDto", optionDto);			

			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin_productModify.jsp");
			dispatcher.forward(request, response);
			
		}
		//수정하기
		else if(command.equals("adminProductModify.do")) {
			
			request.setCharacterEncoding("UTF-8");
			
			String product_idx = request.getParameter("product_idx");
			
			ProductDto productDto = ProductDao.detailview(product_idx);
			OptionDto optionDto = ProductDao.detailview_option(product_idx);
			request.setAttribute("product_idx", product_idx);
	        request.setAttribute("productDto", productDto);
	        request.setAttribute("optionDto", optionDto);			
				
			int result = ProductDao.productModify(request);
			int result_Option = ProductDao.productModify_option(request);
			
			ProductDao.upload(request);			
			request.setAttribute("message", "파일업로드에 성공 하였습니다.!");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin_productlist.jsp");
			dispatcher.forward(request, response);
			
		}
		//관리자 기본 상품리스트
		else if(command.equals("adminProductList.do")) {
			
			request.setCharacterEncoding("UTF-8");			
			
			ArrayList<ProductDto> product_list = ProductDao.adminProductList();
	        request.setAttribute("product_list", product_list);	        
	        
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin_productlist.jsp");
			dispatcher.forward(request, response);
			
		}
		//관리자 기본 상품리스트 상품명 검색
		else if(command.equals("adminProductNameSearch.do")) {
			
			request.setCharacterEncoding("UTF-8");
			String search_product_name = request.getParameter("product_name");			
			
			ArrayList<ProductDto> product_list = ProductDao.adminProductNameSearch(search_product_name);
	        request.setAttribute("product_list", product_list);
	        
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin_productlist.jsp");
			dispatcher.forward(request, response);
			
		}
		
		//관리자 기본 상품리스트 상세검색
		else if(command.equals("adminProductDetailSearch.do")) {
			
			request.setCharacterEncoding("UTF-8");
			String search_product_name = request.getParameter("product_name");			
			
			//미구현
			ArrayList<ProductDto> product_list = ProductDao.adminProductDetailSearch(request);
	        request.setAttribute("product_list", product_list);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin_productlist.jsp");
			dispatcher.forward(request, response);
			
		}
		
		//관리자 상품리스트 삭제기능
		else if(command.equals("adminProductDelete.do")) {
			
			request.setCharacterEncoding("UTF-8");
			String search_product_name = request.getParameter("product_name");			
			
			//미구현
			int result = ProductDao.adminProductDelete(request);
			
			ArrayList<ProductDto> product_list = ProductDao.adminProductList();
	        request.setAttribute("product_list", product_list);	
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin_productlist.jsp");
			dispatcher.forward(request, response);
			
		}
}
}
