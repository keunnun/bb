package kr.co.baseball.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LankingController {
	
	private final String module="/lanking";
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(module+"/lanking")
	public String index()
	{
		return module+"/lanking";
	}
}
