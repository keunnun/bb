package kr.co.baseball.controller;


import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.baseball.dao.MemberDao;
import kr.co.baseball.dto.MemberDto;
import kr.co.baseball.dto.ProductDto;

@Controller
public class MemberController {
	
	private final String module="/member";
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(module+"/member")
	public String index()
	{
		return module+"/member";
	}
	
	// 회원가입
	@RequestMapping(module+"/member_ok")
	public String member_ok(HttpServletRequest request,MemberDto mdto)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		int chk=mdao.get_check(mdto.getUserid());
		if(chk==0)
		{
			mdao.member_ok(mdto);  // 입력할때 userid체크
			String userid=request.getParameter("userid");
			String chuid=request.getParameter("chuid");
            mdao.get_chupoint(userid,chuid);  // 회원가입시 +5포인트

			return module+"/login";
		}
		else
		{
			return "redirect:/member?chk=1";
		}
		
	}
	
	@RequestMapping(module+"/check")
	public void check(PrintWriter out,HttpServletRequest request)
	{
		String userid=request.getParameter("userid");
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		int chk=mdao.get_check(userid);
		out.print(chk);
	}
	
	// 로그인
	@RequestMapping(module+"/login")
	public String login(HttpServletRequest request,Model model)
	{
		model.addAttribute("chk",request.getParameter("chk"));
		return module+"/login";
	}
	
	// 로그인
	@RequestMapping(module+"/login_ok")
	public String login_ok(MemberDto mdto,HttpSession session)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		MemberDto mdto2=mdao.login_ok(mdto);
		if(mdto2==null)
		{
			return "redirect:"+module+"/login?chk=1";
		}
		else
		{
			// 세션변수
			session.setAttribute("userid",mdto2.getUserid());
			session.setAttribute("name",mdto2.getName());
			return "redirect:/main/index";
		}
	}
	
	// 로그아웃
	@RequestMapping(module+"/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/main/index";
	}
	
	// 아이디찾기(로그인화면에서)
	@RequestMapping(module+"/userid_search")
	public String userid_check()
	{
		return module+"/userid_search";
	}
	
	// 아이디찾기(로그인화면에서)
	@RequestMapping(module+"/userid_search_ok")
	public String userid_check_ok(MemberDto mdto,Model model)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		String userid=mdao.userid_search_ok(mdto);
		if(userid==null)
		{
			return module+"/userid_search";
		}
		else
		{
			model.addAttribute("userid",userid);
			return module+"/userid_search_ok";
		}
	}
	
	// 비밀번호 변경(로그인화면에서)
	@RequestMapping(module+"/userpwd_check")
	public String userpwd_check()
	{
		return module+"/userpwd_check";
	}
	
	// 비밀번호 변경(로그인화면에서)
	@RequestMapping(module+"/userpwd_check_ok")
	public String userpwd_check_ok(HttpServletRequest request,MemberDto mdto,Model model)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		mdao.userpwd_check_ok(mdto);
		String userid=mdto.getUserid(); //DB에 있는 userid가져옴

		return "redirect:"+module+"/login";
	}
	
	// 나의 정보(마이페이지) 출력
	@RequestMapping(module+"/mypage")
	public String mypage(HttpSession session, Model model)
	{
		String userid=(String)session.getAttribute("userid");
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		MemberDto mdto=mdao.mypage(userid);
		ArrayList<ProductDto> list=mdao.mycoupon(userid);
		
		model.addAttribute("mdto",mdto);
		model.addAttribute("list",list);
		
		return module+"/mypage";
	}
	
	// 마이페이지에서 자기정보 수정
	@RequestMapping(module+"/mypage_update")
	public String mypage_update(Model model,HttpServletRequest request)
	{   // 사용자가 원하는 레코드의 값을 읽어 view에 전달
		int mid=Integer.parseInt(request.getParameter("mid"));
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
        MemberDto mdto=mdao.mypage_update(mid);
        model.addAttribute("mdto",mdto);
		return module+"/mypage_update";
	}
	
	// 마이페이지에서 자기정보 수정
	@RequestMapping(module+"/mypage_update_ok")
	public String mypage_update_ok(MemberDto mdto)
	{
		// 정보를 수정하고 content로 이동
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		String pwd=mdao.get_pwd(mdto.getMid());
		if(pwd.equals(mdto.getPwd())) 
		{
			mdao.mypage_update_ok(mdto);
			return "redirect:"+module+"/mypage?mid="+mdto.getMid();
		}
		else
		{
			return "redirect:"+module+"/mypage_update?mid="+mdto.getMid();
		}
	}
	
	// 일반사용자 본인이 탈퇴함
	@RequestMapping(module+"/mypage_delete")
	public String mypage_delete(HttpServletRequest request,HttpSession session)
	{
		int mid=Integer.parseInt(request.getParameter("mid"));
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		mdao.mypage_delete(mid);
		session.invalidate();
		return "redirect:/main/index";
	}
	
	
	// 가입시 email중복체크
	@RequestMapping(module+"/check2")
	public void check2(PrintWriter out,HttpServletRequest request)
	{
		String email=request.getParameter("email");
		// System.out.println("email 전달돰 -> " + email);
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		int chk1=mdao.get_emailcheck(email);
		out.print(chk1);
	}
	
}
