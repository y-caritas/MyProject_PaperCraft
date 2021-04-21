package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import dto.OptionDto;
import dto.ProductDto;
import dto.ProductEnquiryDto;
import dto.ProductReviewDto;

@WebServlet(urlPatterns= {"/", "*.do"})
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
			ProductEnquiryDto productEnquiryDto = ProductDao.enquiry(product_idx);
			
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
			ProductEnquiryDto productEnquiryDto = ProductDao.enquiry(product_idx);
			
			//테스트 필요.
			request.setAttribute("product_idx", product_idx);
	        request.setAttribute("productDto", productDto);
	        request.setAttribute("optionDto", optionDto);
	        request.setAttribute("productReviewDto", productReviewDto);
	        request.setAttribute("productEnquiryDto", productEnquiryDto);			
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/detail_page.jsp");
			dispatcher.forward(request, response);	
		}
		else if(command.equals("purchase.do")) {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/product/detail_page.jsp");
			dispatcher.forward(request, response);				
		}
		else if(command.equals("cart.do")) {
			
			request.setCharacterEncoding("UTF-8");
			String product_idx = request.getParameter("product_idx");
			
			int result = ProductDao.cart(request);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/myPage/cart.jsp");
			dispatcher.forward(request, response);				
		}
		


}
}
