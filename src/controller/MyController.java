package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FaqDao;
import dao.InquiryAnswerDao;
import dao.InquiryDao;
import dao.MemberDao;
import dao.NoticeDao;
import dao.OrderDao;
import dao.ProductDao;
import dao.myPageDao;
import dto.CartDto;
import dto.FaqDto;
import dto.InquiryAnswerDto;
import dto.InquiryDto;
import dto.MemberDto;
import dto.NoticeDto;
import dto.OptionDto;
import dto.OrderDto;
import dto.ProductDto;
import dto.ProductEnquiryDto;
import dto.ProductReviewDto;

@WebServlet(urlPatterns= {"*.do"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, 
					maxFileSize = 1024 * 1024 * 50, 
					maxRequestSize = 1024 * 1024 * 50)
public class MyController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		request.setCharacterEncoding("UTF-8");
		
		String requestURI = request.getRequestURI();
		int cmdIdx = requestURI.lastIndexOf("/")+1;
		String command = requestURI.substring(cmdIdx);
		String jspPage = "";
		
		System.out.println("command:"+command);
		
		if(command.equals("") || command.equals("/")) {
			jspPage = "/main.jsp";
		}
		// inquiry 문의 등록
		else if(command.equals("inquiryWrite.do")) {
			InquiryDao.inquiryFileUpload(request);
			
			response.sendRedirect("inquiryList.do");
		}
		// inquiry 사용자 페이지 목록, 관리자 페이지 목록
		else if(command.equals("inquiryList.do") || command.equals("adminInquiryList.do")) {
			ArrayList<InquiryDto> inquiryList = InquiryDao.inquiryList();
			request.setAttribute("inquiryList", inquiryList);
			if(command.equals("inquiryList.do")) {
				jspPage = "/community/inquiry_list.jsp";
			} else if(command.equals("adminInquiryList.do")) {
				jspPage = "admin_inquiryList.jsp";
			}
		}
		// inquiry 상세 페이지
		else if(command.equals("inquiryContent.do") ) {
			int inquiryIdx = Integer.parseInt(request.getParameter("inquiry_idx"));
			InquiryDto dto = InquiryDao.inquiryContent( inquiryIdx );
			request.setAttribute("dto", dto);
		    jspPage = "inquiry_content.jsp";
		}
		// inquiry 비밀번호 확인
		else if(command.equals("inquiryComparePW.do")) {
			int inquiryIdx = Integer.parseInt(request.getParameter("inquiry_idx"));
			String inquiryPW = request.getParameter("inquiry_pw");
			int compareResult = InquiryDao.inquiryComparePW(inquiryIdx, inquiryPW);
			request.setAttribute("compareResult", compareResult);
			request.setAttribute("inquiry_idx", inquiryIdx);
			jspPage = "inquiryComparePW.jsp";
		}
		// inquiry 삭제
		else if(command.equals("inquiryDelete.do")) {
			int inquiryIdx = Integer.parseInt(request.getParameter("inquiry_idx"));
			System.out.println( inquiryIdx );
			InquiryDao.inquiryDelete( inquiryIdx );
			response.sendRedirect("inquiryList.do");
		}
		// inquiry 관리자 페이지 카테고리별 목록
		else if(command.equals("adminInquirySelect.do")) {
			int inquiryCategory = Integer.parseInt(request.getParameter("inquiry_category"));
			ArrayList<InquiryDto> inquirySelectList = InquiryDao.adminInquirySelect(inquiryCategory);
			request.setAttribute("inquiryList", inquirySelectList);
			jspPage = "admin_inquiryList.jsp";
		}
		// inquiry 관리자 페이지 검색
		else if(command.equals("adminInquirySearch.do")) {
			String searchCategory = request.getParameter("inquirySearch");
			String searchContent = request.getParameter("inquirySearchContent");
			ArrayList<InquiryDto> inquiryList = InquiryDao.adminInquirySearch(searchCategory, searchContent);
			request.setAttribute("inquiryList", inquiryList);
			jspPage = "admin_inquiryList.jsp";
		}
		// inquiry 관리자 페이지 상세 페이지
		else if(command.equals("adminInquiryContent.do")) {
			int inquiryIdx = Integer.parseInt(request.getParameter("inquiry_idx"));
			InquiryDto dto = InquiryDao.inquiryContent( inquiryIdx );
			InquiryAnswerDto answerDto = InquiryAnswerDao.inquiryAnswerContent( inquiryIdx );
			request.setAttribute("dto", dto);
			request.setAttribute("answerDto", answerDto);
		    jspPage = "admin_inquiryContentView.jsp";
		}
		// inquiry 답변 등록
		else if(command.equals("adminInquiryAnswerWrite.do")) {
			String inquiryATitle = request.getParameter("inquiry_a_title");
			String inquiryAContent = request.getParameter("inquiry_a_content");
			int inquiryIdx = Integer.parseInt(request.getParameter("inquiry_idx"));
			int answerResult = InquiryAnswerDao.adminInquiryAnswerWrite(inquiryATitle, inquiryAContent, inquiryIdx);
			jspPage = "admin_inquiryAnswer.jsp?answerResult="+answerResult+"&answerIdx="+inquiryIdx;
		}
		// inquiry 답변 삭제
		else if(command.equals("adminInquiryAnswerDelete.do")) {
			int inquiryIdx = Integer.parseInt(request.getParameter("inquiry_idx"));
			InquiryAnswerDao.adminInquiryAnswerDelete( inquiryIdx );
			jspPage = "adminInquiryContent.do?inquiry_idx="+inquiryIdx;
		}
		// faq 목록
		else if(command.equals("adminFaqList.do")) {
			String category = request.getParameter("category");
			ArrayList<FaqDto> faqList = FaqDao.adminFaqList( category );
			if(category != null) {
				if(category.equals("faqProduct")) {
					category = "상품";
				} else if(category.equals("faqSwap")) {
				    category = "반품/교환";
			    } else if(category.equals("faqDelivery")) {
				    category = "배송";
			    } 
			} else {
			   category = "전체";
			}
			request.setAttribute("faqList", faqList);
			request.setAttribute("category", category);
			jspPage = "admin_faqList.jsp";
		}
		// faq 등록
		else if(command.equals("adminFaqWrite.do")) {
			int faqResult = FaqDao.adminFaqWrite( request );
			request.setAttribute("faqResult", faqResult);
			jspPage = "admin_faqWrite.jsp";
		}
		// faq 삭제
		else if(command.equals("adminFaqDelete.do")) {
			int faqIdx = Integer.parseInt(request.getParameter("faq_idx"));
			FaqDao.adminFaqDelete( faqIdx );
			response.sendRedirect("adminFaqList.do");
		}
		
		
		// 공지사항 리스트
		else if(command.equals("noticelist.do")) { 
			ArrayList<NoticeDto> noticelist = NoticeDao.noticelist();
			request.setAttribute("noticelist", noticelist);
			System.out.println("공지사항홈페이지");
			
			jspPage = "/community/notice_list.jsp";
		}
		
		// 공지사항 글 보기
		else if(command.equals("notice_view.do")) {
			String notice_idx = request.getParameter("notice_idx");
			
			// 조회수 증가
			NoticeDao.hit( notice_idx );
			
			// DTO 레코드 정보
			NoticeDto dto = NoticeDao.contentView( notice_idx );
			request.setAttribute("dto", dto);
			
			jspPage = "/community/notice_content.jsp";
		}
		
		// 관리자화면 공지사항 리스트
		else if(command.equals("admin_notice_list.do")) {
			ArrayList<NoticeDto> noticelist = NoticeDao.noticelist();
			request.setAttribute("noticelist", noticelist);
			System.out.println("관리자 공지사항리스트");
			
			jspPage = "/admin/admin_noticeList.jsp";
		}
		
		// 관리자화면 공지사항 글 보기
		else if(command.equals("admin_notice_view.do")) {
			String notice_idx = request.getParameter("notice_idx");
			
			// DTO 레코드 정보
			NoticeDto dto = NoticeDao.contentView( notice_idx );
			request.setAttribute("dto", dto);
			
			jspPage = "/admin/admin_noticeContentView.jsp";
		}
		
		// 관리자화면 공지사항 글 삭제
		else if(command.equals("admin_notice_delete.do")) {
			String notice_idx = request.getParameter("notice_idx");
			
			NoticeDao.noticedelete(notice_idx);
			response.sendRedirect("admin_notice_list.do");
		}
		
		// 관리자화면 글 수정화면
		else if(command.equals("admin_notice_modify.do")) { 
			String notice_idx = request.getParameter("notice_idx");
			
			System.out.println("notice_idx:"+notice_idx);
			
			NoticeDto dto = NoticeDao.contentView( notice_idx );
			request.setAttribute("dto", dto);
			
			jspPage = "/admin/admin_noticeModify.jsp";
		}
		
		// 관리자화면 글 수정 버튼 클릭시 행동
		else if(command.equals("admin_notice_modifyEdit.do")) { 
			String notice_idx = request.getParameter("notice_idx");
			String notice_title = request.getParameter("notice_title");
			String notice_content = request.getParameter("notice_writeEditor");
			String notice_pin = request.getParameter("importchk");
			
			if(notice_pin == null) {
				notice_pin = "3";
			}
			
			System.out.println("notice_idx:"+notice_idx);
			System.out.println("notice_title:"+notice_title);
			System.out.println("notice_content:"+notice_content);
			
			NoticeDao.notice_modify( notice_idx, notice_title, notice_content, notice_pin );
			
			response.sendRedirect("admin_notice_list.do");
		}
		// 관리자화면 글쓰기 버튼 클릭시 행동
		else if(command.equals("admin_notice_write.do")) {
			
			String notice_title = request.getParameter("notice_title");
			String notice_content = request.getParameter("notice_writeEditor");
			String notice_pin = request.getParameter("importchk");
			
			if(notice_pin == null) {
				notice_pin = "3";
			}
			
			System.out.println("notice_title:"+notice_title);
			System.out.println("notice_content:"+notice_content);
			System.out.println("notice_pin2:"+notice_pin);
			
			NoticeDao.write( notice_title, notice_content, notice_pin );
			
			response.sendRedirect("admin_notice_list.do");
		}
		
		// 회원가입 액션
		else if(command.equals("memberjoin.do")) {
			String member_id = request.getParameter("member_id");
			String member_pw = request.getParameter("member_pw");
			String member_name = request.getParameter("member_name");
			String member_email_left = request.getParameter("member_email_left");
			String member_email_right = request.getParameter("member_email_right");
			String member_email_receive = request.getParameter("member_email_receive");
			String member_phone_first = request.getParameter("member_phone_first");
			String member_phone_second = request.getParameter("member_phone_second");
			String member_phone_third = request.getParameter("member_phone_third");
			String member_gender = request.getParameter("member_gender");
			String member_purchase = request.getParameter("member_purchase");
			String member_grade = request.getParameter("member_grade");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String address4 = request.getParameter("address4");
			
			System.out.println("id:"+member_id);
			System.out.println("pw:"+member_pw);
			System.out.println("name:"+member_name);
			System.out.println("mail:"+member_email_left);
			System.out.println("mail:"+member_email_right);
			System.out.println("email_ad:"+member_email_receive);
			System.out.println("phone:"+member_phone_first);
			System.out.println("phone:"+member_phone_second);
			System.out.println("phone:"+member_phone_third);
			System.out.println("gender:"+member_gender);
			System.out.println("purchase:"+member_purchase);
			System.out.println("grade:"+member_grade);
			System.out.println("address1: "+address1);
			System.out.println("address2: "+address2);
			System.out.println("address3: "+address3);
			System.out.println("address4: "+address4);
			
			MemberDao.member_join(member_id, member_pw, member_name, member_email_left, member_email_right,
					member_email_receive, member_phone_first, member_phone_second, member_phone_third,
					member_gender, member_purchase, member_grade, address1, address2, address3, address4);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("./join_welcome.jsp");
			dispatcher.forward(request, response);
			
		}
		// id중복확인 ajax
		else if(command.equals("idCheckAjax.do")) {
			int result = 0;
			try {
				String member_id = request.getParameter("member_id");
				System.out.println("insert id : "+member_id);
				
				request.setAttribute("check_id", member_id);
				
				result = MemberDao.idCheck(request);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
			if(result == 1) { // 아이디 중복
				response.getWriter().print("1");
			} else { // 중복x(사용가능)
				response.getWriter().print("0");
			}
		}
		
		// 로그인 
		else if(command.equals("Login.do"))
		{
			String member_id = request.getParameter("member_id");
			String member_pw = request.getParameter("member_pw");
			
			System.out.println("id:"+member_id);
			System.out.println("pw:"+member_pw);
			
			try 
			{
				String result = MemberDao.Login(request);
				if(result.equals("admin")) {
					response.sendRedirect(request.getContextPath()+"/admin/adminFaqList.do");
					jspPage = "";
					return;
				} else {
					jspPage = "/main.jsp";
				}
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}

		}
		
		// 아이디 찾기
		
		else if(command.equals("idFind.do"))
		{
			try 
			{
				String member_name = request.getParameter("member_name");
				String member_email = request.getParameter("member_email");
				System.out.println("name : "+member_name);
				System.out.println("email : "+member_email);
				
				MemberDao.idFind(request);
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/member/findID_result.jsp");
			dispatcher.forward(request, response);
		}
		// 비밀번호 찾기
		else if(command.equals("pwFind.do"))
		{
			try 
			{
				String member_id = request.getParameter("member_id");
				String member_email = request.getParameter("member_email");
				
				MemberDao.pwFind(request);
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/member/findPW_result.jsp");
			dispatcher.forward(request, response);
		}
		//FAQ 리스트
		else if(command.equals("faq_list.do")) 
		{
			ArrayList<FaqDto> faq_list = FaqDao.faq_list();
			request.setAttribute("faq_list", faq_list);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/community/faq_list.jsp");
			dispatcher.forward(request, response);
		}
		//주문 목록
		else if(command.equals("order_detail.do")) 
		{
			ArrayList<OrderDto> order_detail = null;
			try {
				order_detail = myPageDao.order_detail(request);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			request.setAttribute("order_detail", order_detail);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/myPage/order_detail.jsp");
			dispatcher.forward(request, response);
		}
        // 1:1 문의 목록 ( inquiry_category = 0 )
		else if(command.equals("one_to_one_inquiry.do")) 
		{
			ArrayList<InquiryDto> myInquiryList = null;
			try {
				myInquiryList = myPageDao.myInquiryList(request);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			request.setAttribute("myInquiryList", myInquiryList);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/myPage/one_to_one_inquiryList.jsp");
			dispatcher.forward(request, response);
         }
        // 1 : 1 문의 내용 
		else if(command.equals("myInquiryContent.do")) 
		{
			request.setCharacterEncoding("UTF-8");
			
			String inquiryTitle = request.getParameter("inquiryTitle");
			InquiryDto dto = myPageDao.inquiryContent( inquiryTitle );
			request.setAttribute("dto", dto);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/myPage/myInquiryContent.jsp");
			dispatcher.forward(request, response);
        }
        //  주문 제작 목록  ( inquiry_category = 1 )
		else if(command.equals("customizeList.do")) 
		{
			ArrayList<InquiryDto> customizeList = null;
			try {
				customizeList = myPageDao.myInquiryList(request);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			request.setAttribute("customizeList", customizeList);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/myPage/customize_inquiry.jsp");
			dispatcher.forward(request, response);
        }
        // 주문 제작 문의 내용 
		else if(command.equals("customizeContent.do")) 
		{
			request.setCharacterEncoding("UTF-8");
			
			String inquiryTitle = request.getParameter("inquiryTitle");
			InquiryDto dto = myPageDao.inquiryContent( inquiryTitle );
			request.setAttribute("dto", dto);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/myPage/myInquiryContent.jsp");
			dispatcher.forward(request, response);
        }
		// 비밀번호 확인 
		else if (command.equals("check_pw.do")) {
			request.setCharacterEncoding("UTF-8");
			
			String check_pw = request.getParameter("check_pw");	
			int result = 0;
			
			try {
			result = myPageDao.check_pw(request);
			
				
			
			}catch (Exception e) {
				e.printStackTrace();
			}
			if( result == 1) {
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("modifyForm.do");
				dispatcher.forward(request, response);
			}else if(result == 2 || result == 0 ) {
	
			}
		}
			//회원정보 수정 화면
			
			else if(command.equals("modifyForm.do")) { //회원정보수정 화면
					MemberDto dto = null;
					try {
				
						dto = myPageDao.memberInfo(request.getParameter("member_id"));
					} catch (Exception e) {
						
						e.printStackTrace();
					}
					request.setAttribute("dto", dto);
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("/myPage/info_modify.jsp");
					dispatcher.forward(request, response);
			}
			// 정보 수정 액션 
			else if(command.equals("modifyAction.do")) { //회원정보수정액션
				request.setCharacterEncoding("UTF-8");
			
				myPageDao.updateMember(request);

				response.sendRedirect("MemberListForm"); //URI 리다이렉트
			}
	
			// < -- 관리자 -- > 
			// 회원 목록 조회
			else if(command.equals("adminMemberList.do")) { //회원목록
				ArrayList<MemberDto> memberList = null;
				try {
					memberList = myPageDao.memberList();
					
					request.setAttribute("memberList", memberList);
				} catch (Exception e) {
	
					e.printStackTrace();
				}
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin_memberList.jsp");
				dispatcher.forward(request, response);
			}
			// 회원 정보 조회	
				else if(command.equals("adminMemberInfo.do")) { //회원정보수정 화면
						MemberDto dto = null;
						try {
					
							dto = myPageDao.memberInfo(request.getParameter("member_id"));
						} catch (Exception e) {
							
							e.printStackTrace();
						}
						request.setAttribute("dto", dto);
						
						RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin_memberModify.jsp");
						dispatcher.forward(request, response);
				}
			// 회원 정보 수정
				else if(command.equals("adminMemberModify.do")) { //회원정보수정액션
					request.setCharacterEncoding("UTF-8");
				
					myPageDao.updateMember(request);
					
					response.sendRedirect("adminMemberInfo.do"); //URI 리다이렉0트
				}
			//회원 탈퇴 액션 
				else if(command.equals("deleteMember.do")) { //회원삭제
					MemberDto dto = null;
					try {
				
						dto = myPageDao.memberInfo(request.getParameter("member_id"));
					} catch (Exception e) {
				
						e.printStackTrace();
					}
					request.setAttribute("dto", dto);
					
					myPageDao.deleteMember(dto.getMember_id());
					
					response.sendRedirect("adminMemberList.do"); //URI 리다이렉트
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
	        for(int i = 0; i < product_list.size(); i++) {
	        	System.out.println("product(" + i + ") : " + product_list.get(i).toString());
	        }
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
			request.setCharacterEncoding("UTF-8");
			int product_category = Integer.parseInt(request.getParameter("product_category"));
			String search_name = "%" + request.getParameter("search_name") + "%";
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
			request.setCharacterEncoding("UTF-8");
			String product_category =  request.getParameter("product_category");
			String search_name = "%" + request.getParameter("search_name") + "%";
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
			request.setCharacterEncoding("UTF-8");
			String product_category =  request.getParameter("product_category");
			String search_name = "%" + request.getParameter("search_name") + "%";
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
			request.setCharacterEncoding("UTF-8");
			String product_category =  request.getParameter("product_category");
			String search_name = "%" + request.getParameter("search_name") + "%";
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
			
			ArrayList<ProductReviewDto> productReviewDto = ProductDao.review(product_idx);
			ArrayList<ProductEnquiryDto> productEnquiryDto = ProductDao.enquiryList(product_idx);
			
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
			ArrayList<ProductReviewDto> productReviewDto = ProductDao.review(product_idx);
			ArrayList<ProductEnquiryDto> productEnquiryDto = ProductDao.enquiryList(product_idx);
			
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
			
			//우선 테스트 데이터로 product_idx가 다른상품만 장바구니에 넣어서 테스트하기.
			//같은 상품이 장바구니에 있을때 장바구니에 들어가지 않는 기능은 아직 미구현.
			//cart_targets은 cart_p_idx (product index값)의 배열
			//cart_counts은 각 상품의 수량의 배열
			//cart_p_total_prices은 각 상품의 가격 * 수량

			String[] cart_targets =  request.getParameterValues("cart_target[]");
			String[] cart_counts =  request.getParameterValues("cart_p_count[]");
			String[] cart_p_total_prices =  request.getParameterValues("cart_p_total_price[]");
			String[] cart_p_img = request.getParameterValues("cart_p_img[]");
			int productCount = 0;
			int purchase_total_value = 0;
			for (int i = 0; i < cart_targets.length; i++) {
				request.setAttribute("product_idx"+(i+1), cart_targets[i]);
				purchase_total_value += Integer.parseInt(cart_p_total_prices[i]);
				request.setAttribute("p_total_price"+(i+1), cart_p_total_prices[i]);
				request.setAttribute("product_idx"+(i+1)+"count", cart_counts[i]);
				request.setAttribute("p_img"+(i+1), cart_p_img[i]);
				System.out.println("cart_counts:"+cart_counts[i]);
				String index = Integer.toString(i);
				String result = "index = " + index + " 의 " + "cart_p_idx은 " + cart_targets[i] + " cart_p_count은 " +  cart_counts[i] + " cart_p_total_price은 " + cart_p_total_prices[i]; 
				System.out.println(result);
				productCount += 1;
			}
			String p_name = "";
			if(productCount > 1) {
				p_name = request.getParameter("cart_p_name") + " 외 " + (productCount - 1) + "건";
			} else if(productCount <= 1) {
				p_name = request.getParameter("cart_p_name");
			}
			request.setAttribute("cart_p_total_prices", cart_p_total_prices);
			request.setAttribute("purchase_total_value", purchase_total_value);
			request.setAttribute("p_name", p_name);
			
			// 주문자 정보
			HttpSession session = request.getSession();
			String member_id = (String)session.getAttribute("member_id");
			MemberDto memberDto = OrderDao.memberInfo(member_id);
			request.setAttribute("memberDto", memberDto);
			
			//포워딩 필요.
			jspPage = "/order/orderForm.jsp";
			
			
		}
		
		//장바구니 추가
		else if(command.equals("cartInsert.do")) {
			
			request.setCharacterEncoding("UTF-8");
			
			String member_id = request.getParameter("member_id");
			String product_idx = request.getParameter("product_idx");
			int confirm = ProductDao.cartConfirm(member_id, product_idx);
			System.out.println("confirm = "+confirm);
			request.setAttribute("confirm", confirm);
			if(confirm != 0) {				
				int result = ProductDao.cartInsert(request);
				RequestDispatcher dispatcher = request.getRequestDispatcher("cart.do");
				dispatcher.forward(request, response);	
			}else{				
				ProductDto productDto = ProductDao.detailview(product_idx);
				OptionDto optionDto = ProductDao.detailview_option(product_idx);
				
				ArrayList<ProductReviewDto> productReviewDto = ProductDao.review(product_idx);
				ArrayList<ProductEnquiryDto> productEnquiryDto = ProductDao.enquiryList(product_idx);				

				request.setAttribute("product_idx", product_idx);
		        request.setAttribute("productDto", productDto);
		        request.setAttribute("optionDto", optionDto);
		        request.setAttribute("productReviewDto", productReviewDto);
		        request.setAttribute("productEnquiryDto", productEnquiryDto);			
		        
		        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/detail_page.jsp");
				dispatcher.forward(request, response);	
			}
			
			
			
		}
		//장바구니 보기
		else if(command.equals("cart.do")) {
			
			request.setCharacterEncoding("UTF-8");
			//세선에서 member_id 값 가져오기
			String member_id = "abcde";
			
//			HttpSession session = request.getSession();
//			String member_id = (String)session.getAttribute("member_id");
			ArrayList<CartDto> cartList = ProductDao.cart(member_id);
			
			request.setAttribute("cartList", cartList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/myPage/cart.jsp");
			dispatcher.forward(request, response);
			
		}
		//장바구니 삭제
		else if(command.equals("cartDelete.do")) {			
			request.setCharacterEncoding("UTF-8");		
			String[] cart_targets =  request.getParameterValues("cart_target[]");			
			for (int i = 0; i < cart_targets.length; i++) {				
				ProductDao.cartDelete(cart_targets[i]);
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("cart.do");
			dispatcher.forward(request, response);
			
			
		}
		
		//관리자 상품등록하기
		else if(command.equals("productRegister.do")) {
			
			request.setCharacterEncoding("UTF-8");			
			int result = ProductDao.productRegister(request);			
			System.out.println("관리자 상품 등록하기 = " + result );
			if(result == 1) {
			ProductDao.upload(request);
			request.setAttribute("message", "파일업로드에 성공 하였습니다.!");
			}
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
			
			int result = ProductDao.productModify(request);
			System.out.println("수정하기 = " + result);
			if(result == 1) {
				ProductDao.upload(request);
			}
			if(request.getParameter("option_idx") != null || request.getParameter("option_detail") != null) {				
				int result_Option = ProductDao.productModify_option(request);
				System.out.println("옵션 수정하기 = " + result_Option);
			}
			
			ProductDto productDto = ProductDao.detailview(product_idx);
			OptionDto optionDto = ProductDao.detailview_option(product_idx);
			request.setAttribute("product_idx", product_idx);
	        request.setAttribute("productDto", productDto);
	        request.setAttribute("optionDto", optionDto);			
				
			
			ProductDao.upload(request);			
			request.setAttribute("message", "파일업로드에 성공 하였습니다.!");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("adminProductList.do");
			dispatcher.forward(request, response);
			
		}
		//관리자 기본 상품리스트
		else if(command.equals("adminProductList.do")) {
			
			request.setCharacterEncoding("UTF-8");			
			
			ArrayList<ProductDto> product_list = ProductDao.adminProductList();
	        request.setAttribute("product_list", product_list);	        
	        
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin_productList.jsp");
			dispatcher.forward(request, response);
			
		}
		//관리자 기본 상품리스트 상품명 검색
		else if(command.equals("adminProductNameSearch.do")) {
			
			request.setCharacterEncoding("UTF-8");
			String search_product_name = "%" + request.getParameter("product_name") + "%";			
			
			ArrayList<ProductDto> product_list = ProductDao.adminProductNameSearch(search_product_name);
	        request.setAttribute("product_list", product_list);
	        
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin_productList.jsp");
			dispatcher.forward(request, response);
			
		}
		
		//관리자 기본 상품리스트 상세검색 
		else if(command.equals("adminProductDetailSearch.do")) {
			
			request.setCharacterEncoding("UTF-8");					
			
			ArrayList<ProductDto> product_list = ProductDao.adminProductDetailSearch(request);
	        request.setAttribute("product_list", product_list);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin_productList.jsp");
			dispatcher.forward(request, response);
			
		}
		
		//관리자 상품리스트 삭제기능
		else if(command.equals("adminProductDelete.do")) {
			
			request.setCharacterEncoding("UTF-8");						

			int result = ProductDao.adminProductDelete(request);
			
			ArrayList<ProductDto> product_list = ProductDao.adminProductList();
	        request.setAttribute("product_list", product_list);	
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin_productList.jsp");
			dispatcher.forward(request, response);
			
		}
		
		// 로그아웃
		else if(command.equals("logout.do")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect(request.getContextPath()+"/main.jsp");
		}
		
		// orderlist 리스트 출력
	      else if(command.equals("admin_orderlist.do")) {
	    	  
		         ArrayList<OrderDto> list = OrderDao.orderlist();
		         request.setAttribute("order_list", list);
		         
		         jspPage = "/admin/admin_orderList.jsp";
	      }
		
		// orderlist 간편검색
	      else if(command.equals("orderlist_simpleSearch.do")) {
	    	 request.setCharacterEncoding("UTF-8");
	         String order_status = request.getParameter("orderselect");
	         System.out.println("주문상태 :"+order_status);
	         ArrayList<OrderDto> list = OrderDao.simpleSearch(order_status);
	         request.setAttribute("order_list", list);
	         
	         jspPage = "/admin/admin_orderList.jsp";
	      }
		
		// orderlist 상세검색(제품명)
	      else if(command.equals("det_p_name.do")) {
		    	 request.setCharacterEncoding("UTF-8");
		         String order_p_name = request.getParameter("p_name");
		         System.out.println("제품명 :"+order_p_name);
		         ArrayList<OrderDto> list = OrderDao.detSearch1(order_p_name);
		         request.setAttribute("order_list", list);
		         
		         jspPage = "/admin/admin_orderList.jsp";
	      }
		// orderlist 상세검색(사용자 아이디)
	      else if(command.equals("det_member_id.do")) {
		    	 request.setCharacterEncoding("UTF-8");
		         String member_id = request.getParameter("member_id");
		         System.out.println("아이디 :"+member_id);
		         ArrayList<OrderDto> list = OrderDao.detSearch2(member_id);
		         request.setAttribute("order_list", list);
		         
		         jspPage = "/admin/admin_orderList.jsp";
	      }
		// orderlist 상세검색(회원 등급)
	      else if(command.equals("det_member_grade.do")) {
		    	 request.setCharacterEncoding("UTF-8");
		         String member_grade = request.getParameter("member_grade");
		         System.out.println("member_grade :"+member_grade);
		         ArrayList<OrderDto> list = OrderDao.detSearch3(member_grade);
		         request.setAttribute("order_list", list);
		         
		         jspPage = "/admin/admin_orderList.jsp";
	      }
		// orderlist 상세검색(회원 이름)
	      else if(command.equals("det_member_name.do")) {
		    	 request.setCharacterEncoding("UTF-8");
		         String member_name = request.getParameter("member_name");
		         System.out.println("member_name :"+member_name);
		         ArrayList<OrderDto> list = OrderDao.detSearch4(member_name);
		         request.setAttribute("order_list", list);
		         
		         jspPage = "/admin/admin_orderList.jsp";
	      }
		// orderlist 상세검색(구매금액)
	      else if(command.equals("det_p_price.do")) {
		    	 request.setCharacterEncoding("UTF-8");
		         String p_price1 = request.getParameter("p_price1");
		         String p_price2 = request.getParameter("p_price2");
		         ArrayList<OrderDto> list = OrderDao.detSearch5(p_price1, p_price2);
		         request.setAttribute("order_list", list);
		         
		         jspPage = "/admin/admin_orderList.jsp";
	      }
		// 주문상세보기
			else if(command.equals("orderContentView.do")) {
				String order_idx = request.getParameter("order_idx");
				
				// DTO 레코드 정보
				OrderDto dto = OrderDao.orderModify( order_idx );
				request.setAttribute("dto", dto);
				
				jspPage = "/admin/admin_orderModify.jsp";
			}
		// 주문상세화면 수정버튼 클릭시
			else if(command.equals("order_modify.do")) { 
				String order_idx = request.getParameter("order_idx");
				String member_grade = request.getParameter("member_grade");
				String order_status = request.getParameter("order_status");
				System.out.println("번호: "+order_idx);
				System.out.println("등급: "+member_grade);
				System.out.println("배송상태: "+order_status);
				
				OrderDao.orderModifyDo( order_idx, member_grade, order_status );
				
				response.sendRedirect("admin_orderlist.do");
			}
		
		// 주문양식
			else if(command.equals("orderForm.do")) {
				String recipientName = request.getParameter("recipientName");
				String recipientAddress1 = request.getParameter("recipientAddress1");
				String recipientAddress2 = request.getParameter("recipientAddress2");
				String recipientAddress3 = request.getParameter("recipientAddress3");
				String recipientAddress4 = request.getParameter("recipientAddress4");
				String recipientAddress =  recipientAddress1 + " " + recipientAddress2 + " " + recipientAddress3 + " " +recipientAddress4;
				String recipientPhone = request.getParameter("recipientPhone");
				String recipientRequest = request.getParameter("recipientRequest");
				int member_grade = Integer.parseInt(request.getParameter("member_grade"));
				String product_idx1 = request.getParameter("product_idx1");
				String product_idx2 = request.getParameter("product_idx2");
				String product_idx3 = request.getParameter("product_idx3");
				int purchase_total_value = 0;
				if(Integer.parseInt(request.getParameter("purchase_total_value")) < 50000) {
					purchase_total_value = Integer.parseInt(request.getParameter("purchase_total_value")) + 3000;
				} else if(Integer.parseInt(request.getParameter("purchase_total_value")) >= 50000) {
					purchase_total_value = Integer.parseInt(request.getParameter("purchase_total_value"));
				}
				String paymentOption = request.getParameter("paymentOption");
				String escrow = request.getParameter("escrow");
				HttpSession session = request.getSession();
				String member_id = (String)session.getAttribute("member_id");
				String p_name = request.getParameter("p_name");
				
				String ordererPhone = request.getParameter("ordererPhone");
				String ordererName = request.getParameter("ordererName");
				String product_idx1count = request.getParameter("product_idx1count");
				String product_idx2count = request.getParameter("product_idx2count");
				String product_idx3count = request.getParameter("product_idx3count");
				String p_total_price1 = request.getParameter("p_total_price1");
				String p_total_price2 = request.getParameter("p_total_price2");
				String p_total_price3 = request.getParameter("p_total_price3");
				String p_img = request.getParameter("p_img");
				
				SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
				Date time = new Date();
				String order_idx = member_id + format.format(time);
				System.out.println(order_idx);
				
				
				OrderDao.orderCompletion(order_idx, recipientName, recipientAddress, recipientPhone, recipientRequest, 
						member_grade, product_idx1, product_idx2, product_idx3, purchase_total_value, paymentOption, escrow, member_id, p_name);
				
				OrderDto orderDto = OrderDao.orderInfo(order_idx);
				
				request.setAttribute("orderDto", orderDto);
				request.setAttribute("ordererPhone", ordererPhone);
				request.setAttribute("ordererName", ordererName);
				request.setAttribute("product_idx_count1", product_idx1count);
				request.setAttribute("product_idx_count2", product_idx2count);
				request.setAttribute("product_idx_count3", product_idx3count);
				request.setAttribute("p_total_price1", p_total_price1);
				request.setAttribute("p_total_price2", p_total_price2);
				request.setAttribute("p_total_price3", p_total_price3);
				request.setAttribute("p_img", p_img);
				
				jspPage = "/order/order_completion.jsp";

			}
		
		
		
		
		if(jspPage != "" ) {
			System.out.println("jsp 호출됨:"+jspPage);
			RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
			dispatcher.forward(request, response);
		}
		
	}
	
	

}
