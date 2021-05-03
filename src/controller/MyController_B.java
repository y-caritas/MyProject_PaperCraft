package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FaqDao;
import dao.MemberDao;
import dao.myPageDao;
import dto.FaqDto;
import dto.InquiryDto;
import dto.MemberDto;
import dto.OrderDto;



// @WebServlet(urlPatterns= {"*.do"})
public class MyController_B extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
	
	void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String requestURI = request.getRequestURI();
		System.out.println("requestURI:"+requestURI);
		int cmdIdx = requestURI.lastIndexOf("/")+1;
		String command = requestURI.substring(cmdIdx); //"list.do"
		String jspPage = "";
		 PrintWriter out = response.getWriter();
		 
		//메인페이지
		if(command.equals("") || command.equals("/"))
		{
			response.sendRedirect("/index.jsp");
		}
		
		// 로그인 
		else if(command.equals("Login.do"))
		{
			request.setCharacterEncoding("UTF-8");
			
			String member_id = request.getParameter("member_id");
			String member_pw = request.getParameter("member_pw");
			int result = 0 ;
			System.out.println("id:"+member_id);
			System.out.println("pw:"+member_pw);
			
			try 
			{
				MemberDao.Login(request);
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			if( result == 1 ) {
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/main.jsp");
				dispatcher.forward(request, response); 	
			}else if( result == 2 || result == 0 ) {
				
				response.sendRedirect("/member/login.jsp"); 
			}
			

		}
		
		// 아이디 찾기
		
		else if(command.equals("idFind.do"))
		{
			try 
			{
				request.setCharacterEncoding("UTF-8");
				
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
				request.setCharacterEncoding("UTF-8");
				
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
		
		// -------------- MY PAGE  -----------
		

		
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
					myPageDao.check_pw(request);
					
						
					
					}catch (Exception e) {
						e.printStackTrace();
					}
					if( result == 1) {
						
						RequestDispatcher dispatcher = request.getRequestDispatcher("modifyForm.do");
						dispatcher.forward(request, response);
					}else if(result == 2 || result == 0 ) {
						 

				            out.println("<script>alert('비밀번호를 확인해주세요.'); history.go(-1);</script>"); 

				            out.flush(); 



	
						
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
		           
					out.println("<script>alert('정보 수정이 완료되었습니다.');</script>"); 
		            out.flush(); 

					
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
			           
						out.println("<script>alert('정보 수정이 완료되었습니다.');</script>"); 
			            out.flush(); 
						
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
						
			            out.println("<script>alert('회원 탈퇴가 완료되었습니다.');</script>"); 
			            out.flush(); 
						
						response.sendRedirect("adminMemberList.do"); //URI 리다이렉트
					}
		
		
		
 } 
	
}



