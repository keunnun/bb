package kr.co.baseball.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.baseball.dao.MainDao;
import kr.co.baseball.dto.MainDto;

@Controller
public class MainController {
	
	private final String module="/main";
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/")
	public String main()
	{
		return "redirect:"+module+"/index";
	}
	
	@RequestMapping(module+"/index")
	public String index()
	{
		return module+"/index";
	}
	
	// 검색
	@RequestMapping(module+"/search_ok")
	public String search_ok(HttpServletRequest request,Model model)
	{
		String word=request.getParameter("word");
		
		MainDao mdao=sqlSession.getMapper(MainDao.class);
		int chk=mdao.p_chk(word);
		String p_num;
		if(chk==0)
		{
			return "redirect:"+module+"/noname";
		}
		if(chk==1)
		{
			p_num=mdao.p_num(word);
			return "redirect:/players/playersprf?pid="+p_num;
		}	
		if(chk>1)
		{
			model.addAttribute("word",word);
			return "redirect:"+module+"/yesname";
		}
		
		return module+"/index";
	}
	
	@RequestMapping(module+"/noname")
	public String noname()
	{
		return module+"/noname";
	}
	
	@RequestMapping(module+"/yesname")
	public String yesname(HttpServletRequest request,Model model)
	{
		String word=request.getParameter("word");
		MainDao mdao=sqlSession.getMapper(MainDao.class);
		
		ArrayList<MainDto> list=mdao.p_info(word);
		model.addAttribute("list",list);
		
		return module+"/yesname";
	}
	
	@RequestMapping("/*/search_ok2")
	public String search_ok2(HttpServletRequest request,Model model)
	{
		String word=request.getParameter("word");
		MainDao mdao=sqlSession.getMapper(MainDao.class);
		int chk=mdao.p_chk(word);
		String p_num;
		if(chk==0)
		{
			return "redirect:"+module+"/noname";
		}
		if(chk==1)
		{
			p_num=mdao.p_num(word);
			return "redirect:/players/playersprf?pid="+p_num;
		}	
		if(chk>1)
		{
			model.addAttribute("word",word);
			return "redirect:"+module+"/yesname";
		}
		
		return "/top/top";
	}
	
}
