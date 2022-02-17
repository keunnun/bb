package kr.co.baseball.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.baseball.dto.MainDto;
import kr.co.baseball.dao.PlayersDao;
import kr.co.baseball.dto.MainDto;

@Controller
public class PlayersController {
	
	private final String module="/players";
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(module+"/players")
	public String players(Model model,HttpServletRequest request)
	{
		PlayersDao pdao=sqlSession.getMapper(PlayersDao.class);
		
		String num;
		if(request.getParameter("num")==null)
		{
			num="2021";
		}
		else
		{
			num=request.getParameter("num");
			//System.out.println(num);
			//콘솔 num값 확인용 
		}
		
		String gijun=request.getParameter("gijun");
		String gijun2=""; //초기값 설정 안해주면 밑에 setAttribute 값보낼때 에러
		if(gijun==null)
		{
			gijun="avg";     //값이널인경우 홈페이지첫시작시 초기값설정
			gijun2="desc";
		}
		else
		{
			gijun2=request.getParameter("gijun2");
			// gijun은 위에서 request값을받은상태로 설정 x  그값이널이면널로 위쪽이프로가고 값이있으면위에서설정됨
		}
		request.setAttribute("gijun2", gijun2);
			
		ArrayList<MainDto> list=pdao.list(num,gijun,gijun2);
		
		model.addAttribute("list",list);
		if(request.getParameter("chk")!=null)
		{
		  model.addAttribute("chk",Integer.parseInt(request.getParameter("chk"))+1);
		}
		else
		  model.addAttribute("chk",1);
		return module+"/players";
	}
	
	@RequestMapping(module+"/players2")
	public String players2(Model model,HttpServletRequest request)
	{
		PlayersDao pdao=sqlSession.getMapper(PlayersDao.class);
		
		String num;
		if(request.getParameter("num")==null)
		{
			num="2021";
		}
		else
		{
			num=request.getParameter("num");
			//System.out.println(num);
			//콘솔 num값 확인용 
		}

		String gijun=request.getParameter("gijun");
		String gijun2=""; //초기값 설정 안해주면 밑에 setAttribute 값보낼때 에러
		if(gijun==null)
		{
			gijun="avg";     //값이널인경우 홈페이지첫시작시 초기값설정
			gijun2="desc";
		}
		else
		{
			gijun2=request.getParameter("gijun2");
			// gijun은 위에서 request값을받은상태로 설정 x  그값이널이면널로 위쪽이프로가고 값이있으면위에서설정됨
		}
		request.setAttribute("gijun2", gijun2);
	
		ArrayList<MainDto> list=pdao.list2(num,gijun,gijun2);
		
		model.addAttribute("list",list);
		if(request.getParameter("chk")!=null)
		{
		  model.addAttribute("chk",Integer.parseInt(request.getParameter("chk"))+1);
		}
		else
			  model.addAttribute("chk",1);
		
		return module+"/players2";
	}
	
	@RequestMapping(module+"/playersprf")
	public String playersprf(Model model,HttpServletRequest request)
	{
		PlayersDao pdao=sqlSession.getMapper(PlayersDao.class);
		
		String pid=request.getParameter("pid");
		// System.out.println("d"+pid); 콘솔확인용
		
		ArrayList<MainDto> list=pdao.listPrf(pid);
		model.addAttribute("list",list);
		
		return module+"/playersprf";
	}
	
	@RequestMapping(module+"/playersprf2")
	public String playersprf2(Model model,HttpServletRequest request)
	{
		PlayersDao pdao=sqlSession.getMapper(PlayersDao.class);
		
		String pid=request.getParameter("pid");
		// System.out.println("d"+pid); 콘솔확인용
		
		ArrayList<MainDto> list=pdao.listPrf2(pid);
		model.addAttribute("list",list);
		
		return module+"/playersprf2";
	}
	
	@RequestMapping(module+"/playersprf3")
	public String playersprf3(Model model,HttpServletRequest request)
	{
		PlayersDao pdao=sqlSession.getMapper(PlayersDao.class);
		
		String pid=request.getParameter("pid");
		// System.out.println("d"+pid); 콘솔확인용
		
		ArrayList<MainDto> list=pdao.listPrf3(pid);
		model.addAttribute("list",list);
		
		return module+"/playersprf3";
	}

}
