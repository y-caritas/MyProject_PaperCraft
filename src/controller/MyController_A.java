package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.NoticeDao;
import dto.NoticeDto;

//@WebServlet(urlPatterns= {"*.do"})
public class MyController_A extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	
	void doProcess( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String requestURI = request.getRequestURI();
		int cmdIdx = requestURI.lastIndexOf("/")+1;
		String command = requestURI.substring(cmdIdx);
		String jspPage = "";
		
		System.out.println("command:"+command);
		
		if(command.equals("") || command.equals("/"))
		{
			response.sendRedirect("/main.jsp");
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
			
			System.out.println("notice_idx:"+notice_idx);
			System.out.println("notice_title:"+notice_title);
			System.out.println("notice_content:"+notice_content);
			
			NoticeDao.modify( notice_idx, notice_title, notice_content );
			
			response.sendRedirect("admin_notice_list.do");
		}
		// 관리자화면 글쓰기 버튼 클릭시 행동
		else if(command.equals("admin_notice_write.do")) {
			
			String notice_title = request.getParameter("notice_title");
			String notice_content = request.getParameter("notice_writeEditor");
			String notice_pin = request.getParameter("importchk");
			
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
		if( !jspPage.equals("") ) { //jsp페이지가 비어있지 않다면,
			RequestDispatcher dispatcher = request.getRequestDispatcher( jspPage );
			dispatcher.forward(request, response);
		}
		
	}
	
	
}
