package kr.co.baseball.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.baseball.dao.TeamDao;
import kr.co.baseball.dto.TeamFightingDto;
import kr.co.baseball.dto.TeamDto;

@Controller
public class TeamController {
	
	private final String module="/team";
	
	@Autowired
	private SqlSession sqlSession;
	
	// 구단리스트
	@RequestMapping(module+"/team")
	public String index(Model model)
	{
		TeamDao tdao=sqlSession.getMapper(TeamDao.class);
		ArrayList<TeamDto>tdto=tdao.teaminfo();
		model.addAttribute("tdto",tdto);
		
		return module+"/team";
	}
	
	// 구단개별리스트
	@RequestMapping(module+"/list")
	public String list(HttpServletRequest request, Model model)
	{
		// 구단정보
		String tid=request.getParameter("tid");
		model.addAttribute("tid",tid);
		
		
		TeamDao tdao=sqlSession.getMapper(TeamDao.class);
		TeamDto tdto=tdao.list(tid);
		model.addAttribute("tdto",tdto);
		
		// 응원게시판
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
		
		int page_cnt=tdao.page_cnt();
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
		
		ArrayList<TeamFightingDto> list2=tdao.list2(tid,index,field,word);
		
		/*
		 *  전송되는지 확인
		  	for (TeamFightingDto teamFightingDto : list2) {
				System.out.println(teamFightingDto.getTitle());
		}*/
		
		model.addAttribute("list2",list2);
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("field",field);
		model.addAttribute("word",word);
		
		return module+"/list";
	}
	
	// 응원글작성 페이지
	@RequestMapping(module+"/write")
	public String write(HttpServletRequest request, Model model)
	{
		String tid=request.getParameter("tid");
		model.addAttribute("tid",tid);
		return module+"/write";
	}
	
	// 응원글작성 동작
	@RequestMapping(module+"/write_ok")
	public String write_ok(TeamFightingDto tfdto,HttpServletRequest request, Model model)
	{
		String tid=request.getParameter("tid");
		TeamDao tdao=sqlSession.getMapper(TeamDao.class);
		tdao.write_ok(tfdto);
		return "redirect:"+module+"/list?tid="+tid;
	}
	
	// 추천
	@RequestMapping(module+"/chu")
	public void chu(HttpServletRequest request,PrintWriter out)
	{
		int fid=Integer.parseInt(request.getParameter("fid"));
		String userid=request.getParameter("userid");
		TeamDao tdao=sqlSession.getMapper(TeamDao.class);
		
		int chu_check=tdao.chu_check(userid, fid);
		if(chu_check==0)
		{
			tdao.chu(fid);
			tdao.get_point(userid);
			int like=tdao.get_chu(fid);
			tdao.chuinfo(userid, fid);
			out.print(like);
		}
		else
		{
			out.print(-1);
		}
	}
	
	// 응원글 내용
	@RequestMapping(module+"/content")
	public String content(HttpServletRequest request, Model model)
	{
		String tid=request.getParameter("tid");
		int fid=Integer.parseInt(request.getParameter("fid"));
		model.addAttribute("tid",tid);
		
		TeamDao tdao=sqlSession.getMapper(TeamDao.class);
		TeamFightingDto tfdto=tdao.content(fid);
		model.addAttribute("tfdto",tfdto);
		
		return module+"/content";
	}
	
	// 응원글 수정
	@RequestMapping(module+"/update")
	public String update(HttpServletRequest request, Model model)
	{
		String tid=request.getParameter("tid");
		int fid=Integer.parseInt(request.getParameter("fid"));
		model.addAttribute("tid",tid);
		model.addAttribute("fid",fid);
		
		TeamDao tdao=sqlSession.getMapper(TeamDao.class);
		TeamFightingDto tfdto=tdao.content(fid);
		model.addAttribute("tfdto",tfdto);
		
		return module+"/update";
	}
	
	// 응원글 수정 동작
	@RequestMapping(module+"/update_ok")
	public String update_ok(HttpServletRequest request, TeamFightingDto tfdto,Model model)
	{
		System.out.println(tfdto.getFid());
		TeamDao tdao=sqlSession.getMapper(TeamDao.class);
		tdao.update_ok(tfdto);
		
		return "redirect:/"+module+"/content?tid="+tfdto.getTid()+"&fid="+tfdto.getFid();
	}
	
	// 응원글 삭제 동작
	@RequestMapping(module+"/delete")
	public String delete(HttpServletRequest request, TeamFightingDto tfdto,Model model)
	{
		String tid=request.getParameter("tid");
		int fid=Integer.parseInt(request.getParameter("fid"));
		model.addAttribute("tid",tid);
		model.addAttribute("fid",fid);
		
		TeamDao tdao=sqlSession.getMapper(TeamDao.class);
		tdao.delete(fid);
		
		return "redirect:/"+module+"/list?tid="+tfdto.getTid();
	}
}
