package kr.co.baseball.controller;

import java.util.ArrayList;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.baseball.dao.CDao;
import kr.co.baseball.dao.GamesDao;
import kr.co.baseball.dto.CDto;
import kr.co.baseball.dto.GamesDto;

@Controller
public class GamesController {

	private final String module = "/games";

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(module + "/games")
	public String cl() {
		return module + "/games";
	}

	@RequestMapping(module + "/list")
	public String list(HttpServletRequest request, Model model) throws Exception {
		int y, m;
		if (request.getParameter("y") == null) {
			LocalDate today = LocalDate.now();
			y = today.getYear();
			m = today.getMonthValue();
		} else {
			y = Integer.parseInt(request.getParameter("y"));
			m = Integer.parseInt(request.getParameter("m"));
		}
		CDao cdao = new CDao();
		ArrayList<CDto> list = cdao.list(y, m);
		model.addAttribute("list", list);
		model.addAttribute("y", y);
		model.addAttribute("m", m);
		
		return module + "/list";
	}
	
	@RequestMapping(module + "/pl")
	public String plan() {
		return module + "/pl";
	}
	
	@RequestMapping(module + "/pls")
	public String pls() {
		return module + "/pls";
	}
	
	@RequestMapping(module + "/pl_ok")
	public String pl_ok(HttpServletRequest request,GamesDto gdto) {
		GamesDao gdao=sqlSession.getMapper(GamesDao.class);
		String d,y,m,dy,pa,hx;
		d=request.getParameter("date"); 
		y=d.substring(0,4);
		m=d.substring(5,7);
		dy=d.substring(8,10);
		gdto.setYear(y);
		gdto.setMonth(m);
		gdto.setDay(dy);
		d=y+"/"+m+"/"+dy;
		gdto.setDays(d);
		hx=request.getParameter("hxt");
		gdto.setHxt(hx);
		gdto.setExt(request.getParameter("ext"));
		if (hx.equals("한화"))
			pa="대전";
		else if(hx.equals("KIA"))
			pa="광주";
		else if(hx.equals("NC"))
			pa="창원";
		else if(hx.equals("롯데"))
			pa="사직";
		else if(hx.equals("SSG"))
			pa="문학";
		else if(hx.equals("키움"))
			pa="고척";
		else if(hx.equals("KT"))
			pa="수원";
		else if(hx.equals("삼성"))
			pa="대구";
		else
			pa="잠실";
		gdto.setParea(pa);
		gdto.setGtime(request.getParameter("gtime"));
		gdao.pl_ok(gdto);
		
		return "redirect:"+module+"/adl?y="+y+"&m="+m;
	}
	@RequestMapping(module + "/pls_ok")
	public String pls_ok(HttpServletRequest request,GamesDto gdto) {
		GamesDao gdao=sqlSession.getMapper(GamesDao.class);
		String d,y,m,dy,pa,hx;
		d=request.getParameter("date"); 
		y=d.substring(0,4);
		m=d.substring(5,7);
		dy=d.substring(8,10);
		gdto.setYear(y);
		gdto.setMonth(m);
		gdto.setDay(dy);
		d=y+"/"+m+"/"+dy;
		gdto.setDays(d);
		hx=request.getParameter("hxt");
		if (hx.equals("한화"))
			pa="대전";
		else if(hx.equals("KIA"))
			pa="광주";
		else if(hx.equals("NC"))
			pa="창원";
		else if(hx.equals("롯데"))
			pa="사직";
		else if(hx.equals("SSG"))
			pa="문학";
		else if(hx.equals("키움"))
			pa="고척";
		else if(hx.equals("KT"))
			pa="수원";
		else if(hx.equals("삼성"))
			pa="대구";
		else
			pa="잠실";
		gdto.setParea(pa);
		int hs,es;
		hs=Integer.parseInt(gdto.getHxscore());
		es=Integer.parseInt(gdto.getExscore());
		if (hs>es) {
			gdto.setHxresult("승");
			gdto.setExresult("패");
		}
		else if (hs==es){
			gdto.setHxresult(" ");
			gdto.setExresult(" ");
		}
		else {
			gdto.setHxresult("패");
			gdto.setExresult("승");
		}
		gdto.setFannum(Float.parseFloat(request.getParameter("fannum")));
		gdao.pls_ok(gdto);
		
		return "redirect:"+module+"/adl?y="+y+"&m="+m;
	}
	@RequestMapping(module + "/adl")
	public String adl(HttpServletRequest request, Model model) throws Exception {
		int y, m;
		if (request.getParameter("y") == null) {
			LocalDate today = LocalDate.now();
			y = today.getYear();
			m = today.getMonthValue();
		} else {
			y = Integer.parseInt(request.getParameter("y"));
			m = Integer.parseInt(request.getParameter("m"));
		}
		CDao cdao = new CDao();
		ArrayList<CDto> list = cdao.list(y, m);
		model.addAttribute("list", list);
		model.addAttribute("y", y);
		model.addAttribute("m", m);
		return module + "/adl";
	}
	
	@RequestMapping(module + "/upd")
	public String upd(HttpServletRequest request, Model model) {
		int gnum=Integer.parseInt(request.getParameter("gnum"));
		GamesDao gdao=sqlSession.getMapper(GamesDao.class);
		GamesDto gdto=gdao.upd(gnum);
		model.addAttribute("gdto",gdto);
		return module+ "/upd";
	}
	@RequestMapping(module+"/upd_ok")
	public String upd_ok(HttpServletRequest request,GamesDto gdto)
	{
		GamesDao gdao=sqlSession.getMapper(GamesDao.class);
		String d,y,m,dy,hx,pa;
		d=request.getParameter("days"); 
		y=d.substring(0,4);
		m=d.substring(5,7);
		dy=d.substring(8,10);
		gdto.setYear(y);
		gdto.setMonth(m);
		gdto.setDay(dy);
		d=y+"/"+m+"/"+dy;
		gdto.setDays(d);
		hx=request.getParameter("hxt");
		if (hx.equals("한화"))
			pa="대전";
		else if(hx.equals("KIA"))
			pa="광주";
		else if(hx.equals("NC"))
			pa="창원";
		else if(hx.equals("롯데"))
			pa="사직";
		else if(hx.equals("SSG"))
			pa="문학";
		else if(hx.equals("키움"))
			pa="고척";
		else if(hx.equals("KT"))
			pa="수원";
		else if(hx.equals("삼성"))
			pa="대구";
		else
			pa="잠실";
		gdto.setParea(pa);
		int hs, es;
		if (gdto.getHxscore().equals("-")) {
		} else {
			hs = Integer.parseInt(gdto.getHxscore());
			es = Integer.parseInt(gdto.getExscore());
			if (hs > es) {
				gdto.setHxresult("승");
				gdto.setExresult("패");
			} else if (hs == es) {
				gdto.setHxresult(" ");
				gdto.setExresult(" ");
			} else {
				gdto.setHxresult("패");
				gdto.setExresult("승");
			}
		}
		gdto.setFannum(Float.parseFloat(request.getParameter("fannum")));
		gdao.upd_ok(gdto);
		return "redirect:"+module+"/adl?y="+y+"&m="+m;
	}
	
	@RequestMapping(module + "/del")
	public String del(HttpServletRequest request) {
		GamesDao gdao=sqlSession.getMapper(GamesDao.class);
		int gnum=Integer.parseInt(request.getParameter("gnum"));
		gdao.del(gnum);
		return "redirect:"+module+"/adl";
	}
	
	@RequestMapping(module + "/adc")
	public String adc() {
		
		return module + "/adc";
	}
}
