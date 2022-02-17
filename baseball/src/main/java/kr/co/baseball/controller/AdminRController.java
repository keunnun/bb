package kr.co.baseball.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.baseball.dao.AdminRDao;
import kr.co.baseball.dao.AdminTDao;
import kr.co.baseball.dto.RankingDto;

@Controller
public class AdminRController {
	
	private final String module="/adminrank";
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(module+"/adminrank")
	public String adminrank(HttpServletRequest request,Model model)
	{
		AdminRDao rdao=sqlSession.getMapper(AdminRDao.class);
		
		int page;
		if(request.getParameter("page")==null)
		{
			page=1;
		}
		else
		{
			page=Integer.parseInt(request.getParameter("page"));
		}
		int index=(page-1)*30;
		
		int pstart=page/10;
		if(page%10==0)
			pstart=pstart-1;
		pstart=(pstart*10)+1;
		int pend=pstart+9;
		
		int page_cnt=rdao.page_cnt();
		if(pend > page_cnt)
			pend=page_cnt;
		
		ArrayList<RankingDto> list=rdao.list(index);
		model.addAttribute("list",list);
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("page_cnt",page_cnt);
		
		return module+"/adminrank";
	}
	
	@RequestMapping(module+"/rankwrite")
	public String rankwrite()
	{
		return module+"/rankwrite";
	}
	
	@RequestMapping(module+"/rankwrite_ok")
	public String rankwrite_ok(RankingDto rdto)
	{
		AdminRDao rdao=sqlSession.getMapper(AdminRDao.class);
		rdao.rankwrite_ok(rdto);
		System.out.println(rdto.getRank());
		System.out.println(rdto.getTname());
		return "redirect:"+module+"/adminrank";
	}
	
	@RequestMapping(module+"/rankupdate")
	public String rankupdate(HttpServletRequest request,Model model)
	{
		int lid=Integer.parseInt(request.getParameter("lid"));
		
		AdminRDao rdao=sqlSession.getMapper(AdminRDao.class);
		RankingDto rdto=rdao.rankupdate(lid);
		
		model.addAttribute("rdto",rdto);
		model.addAttribute("lid",lid);
		
		return module+"/rankupdate";
	}
	
	@RequestMapping(module+"/rankupdate_ok")
	public String rankupdate_ok(RankingDto rdto)
	{
		AdminRDao rdao=sqlSession.getMapper(AdminRDao.class);
		rdao.rankupdate_ok(rdto);
		
		return "redirect:"+module+"/adminrank";
	}
	
	@RequestMapping(module+"/rankdelete")
	public String rankdelete(HttpServletRequest request)
	{
		int lid=Integer.parseInt(request.getParameter("lid"));
		
		AdminRDao rdao=sqlSession.getMapper(AdminRDao.class);
		rdao.rankdelete(lid);
		
		return "redirect:"+module+"/adminrank";
	}
	
}
