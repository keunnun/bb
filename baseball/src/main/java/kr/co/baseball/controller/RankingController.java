package kr.co.baseball.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.baseball.dao.RankingDao;
import kr.co.baseball.dto.RankingDto;

@Controller
public class RankingController {
	
	private final String module="/ranking";
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(module+"/ranking")
	public String ranking(HttpServletRequest request,Model model)
	{
		String year=request.getParameter("year");
		if(year==null)
		{
			year="2021";
		}
		
		RankingDao rdao=sqlSession.getMapper(RankingDao.class);
		ArrayList<RankingDto> rlist=rdao.rlist(year);
		model.addAttribute("rlist",rlist);
		model.addAttribute("year",year);
		
		return module+"/ranking";
	}

}
