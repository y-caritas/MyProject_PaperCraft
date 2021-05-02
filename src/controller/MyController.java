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

import dao.FaqDao;
import dao.InquiryAnswerDao;
import dao.InquiryDao;
import dto.FaqDto;
import dto.InquiryAnswerDto;
import dto.InquiryDto;

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
		
		
		if(jspPage != "" ) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
			dispatcher.forward(request, response);
		}
		
	}

}
