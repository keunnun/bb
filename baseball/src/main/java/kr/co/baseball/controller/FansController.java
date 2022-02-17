package kr.co.baseball.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FansController {
	
	private final String module="/fans";
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(module+"/fans")
	public String fans(HttpServletRequest request,Model model)
	{
		String fnum=request.getParameter("fnum");
		if(fnum==null)
		{
			fnum="day";
		}
		
		model.addAttribute("fnum",fnum);
		
		return module+"/fans";
	}
	
}
