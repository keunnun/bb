package kr.co.baseball.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.baseball.dao.AdminDao;
import kr.co.baseball.dto.MemberDto;


@Controller
public class AdminController {

	private final String module="/admin";
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(module+"/admin")
	public String index()
	{
		return module+"/admin";
	}
	
	// 관리자페이지 - 회원리스트("회원 관리" 클릭시 보이는 페이지)
	@RequestMapping(module+"/member_list")
	public String member_list(Model model,HttpServletRequest request)
	{
		AdminDao adao=sqlSession.getMapper(AdminDao.class);
		// for(int i=0;i<member_list.size();i++)
		// System.out.println(member_list.get(i).getUserid());
		
		
		// 페이징
		int page;
		if(request.getParameter("page")==null)
		{
			page=1;
		}
		else
		{
			page=Integer.parseInt(request.getParameter("page"));
		}
		int index=(page-1)*10;
		
		int pstart=page/10;
		if(page%10==0)
			pstart=pstart-1;
		pstart=(pstart*10)+1;
		int pend=pstart+9;
		
		int page_cnt=adao.page_cnt();
		if(pend > page_cnt)
			pend=page_cnt;
		
		
		
		// 검색필드와 검색단어 가져오기
		String field,word;
		if(request.getParameter("field")==null)
		{
			field="userid";
			word="";
		}
		else
		{
			field=request.getParameter("field");
			word=request.getParameter("word");
		}
		ArrayList<MemberDto> member_list=adao.member_list(field,word,index); //field,word를 보냄
		model.addAttribute("member_list",member_list);
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("field",field);
		model.addAttribute("word",word);
		
		return module+"/member_list";
	}
	
	// 관리자페이지 - 회원아이디 클릭시 나오는 content
	@RequestMapping(module+"/member_content")
	public String content(Model model,HttpServletRequest request)
	{   // 사용자가 원하는 레코드의 값을 읽어 view에 전달
		int mid=Integer.parseInt(request.getParameter("mid"));
		AdminDao adao=sqlSession.getMapper(AdminDao.class);
		MemberDto mdto=adao.member_content(mid);
        model.addAttribute("mdto",mdto);
		return module+"/member_content";
	}
	
	// 관리자가 회원정보 수정
	@RequestMapping(module+"/member_update")
	public String member_update(Model model,HttpServletRequest request)
	{   // 사용자가 원하는 레코드의 값을 읽어 view에 전달
		int mid=Integer.parseInt(request.getParameter("mid"));
		AdminDao adao=sqlSession.getMapper(AdminDao.class);
        MemberDto mdto=adao.member_update(mid);
        model.addAttribute("mdto",mdto);
		return module+"/member_update";
	}
	
	// 관리자가 회원정보 수정
	@RequestMapping(module+"/member_update_ok")
	public String member_update_ok(MemberDto mdto)
	{
		// 정보를 수정하고 content로 이동
		AdminDao adao=sqlSession.getMapper(AdminDao.class);
		String pwd=adao.get_pwd(mdto.getMid());
		adao.member_update_ok(mdto);
		return "redirect:"+module+"/member_content?mid="+mdto.getMid();

	}
	
	// 관리자가 회원탈퇴시킴
	@RequestMapping(module+"/member_delete")
	public String member_delete(HttpServletRequest request)
	{
		int mid=Integer.parseInt(request.getParameter("mid"));
		AdminDao adao=sqlSession.getMapper(AdminDao.class);
		adao.member_delete(mid);
		return "redirect:"+module+"/member_list";
	}
	
}