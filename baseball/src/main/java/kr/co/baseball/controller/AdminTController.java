package kr.co.baseball.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.baseball.dao.AdminTDao;
import kr.co.baseball.dto.TeamDto;
import kr.co.baseball.dto.TeamFightingDto;

@Controller
public class AdminTController {
	
	private final String module="/adminteam";
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(module+"/teamlist")
	public String teamlist(Model model)
	{	
		AdminTDao adao=sqlSession.getMapper(AdminTDao.class);
		ArrayList<TeamDto> adto=adao.teamlist();
		model.addAttribute("adto",adto);
		
		return module+"/teamlist";
	}
	
	@RequestMapping(module+"/teamwrite")
	public String teamwrite()
	{
		return module+"/teamwrite";
	}
	
	@RequestMapping(module+"/teamwrite_ok")
	public String teamwrite_ok(TeamDto tdto)
	{
		AdminTDao adao=sqlSession.getMapper(AdminTDao.class);
		adao.teamwrite_ok(tdto);
		return "redirect:"+module+"/teamlist";
	}
	
	@RequestMapping(module+"/teamupdate")
	public String teamupdate(HttpServletRequest request,Model model)
	{
		String tid=request.getParameter("tid");
		AdminTDao adao=sqlSession.getMapper(AdminTDao.class);
		TeamDto tdto=adao.teamupdate(tid);
		
		model.addAttribute("tdto",tdto);
		model.addAttribute("tid",tid);
		
		return module+"/teamupdate";
	}
	
	@RequestMapping(module+"/teamupdate_ok")
	public String teamupdate_ok(TeamDto tdto)
	{
		AdminTDao adao=sqlSession.getMapper(AdminTDao.class);
		adao.teamupdate_ok(tdto);
		return "redirect:"+module+"/teamlist";
	}
	
	@RequestMapping(module+"/teamdelete")
	public String teamdelete(HttpServletRequest request)
	{
		String tid=request.getParameter("tid");
		AdminTDao adao=sqlSession.getMapper(AdminTDao.class);
		adao.teamdelete(tid);
		
		return "redirect:"+module+"/teamlist";
	}
	
	//---------------------------------------------------
	
	@RequestMapping(module+"/fightinglist")
	public String fightinglist(HttpServletRequest request,Model model)
	{
		AdminTDao adao=sqlSession.getMapper(AdminTDao.class);
		
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
		
		int page_cnt=adao.page_cnt();
		if(pend > page_cnt)
			pend=page_cnt;
		
		String field,word;
		if(request.getParameter("field")==null)
		{
			field="title";
			word="";
		}
		else
		{
			field=request.getParameter("field");
			word=request.getParameter("word");
		}
		
		ArrayList<TeamFightingDto> list=adao.list(index,field,word);
		/*
		 *  전송되는지 확인
		  	for (TeamFightingDto teamFightingDto : list2) {
				System.out.println(teamFightingDto.getTitle());
		}*/
		
		model.addAttribute("list",list);
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("field",field);
		model.addAttribute("word",word);
		
		return module+"/fightinglist";
	}
	
	@RequestMapping(module+"/delete")
	public String delete(HttpServletRequest request)
	{
		int fid=Integer.parseInt(request.getParameter("fid"));
		AdminTDao adao=sqlSession.getMapper(AdminTDao.class);
		
		adao.delete(fid);
		
		return "redirect:"+module+"/fightinglist";
	}
	
}
