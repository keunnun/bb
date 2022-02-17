package kr.co.baseball.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.baseball.dao.GuessDao;
import kr.co.baseball.dto.RankingDto;

@Controller
public class GuessController {
	
	private final String module="/guess";
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(module+"/guess")
	public String index(Model model,HttpServletRequest request)
	{
		GuessDao gdao=sqlSession.getMapper(GuessDao.class);
		ArrayList<RankingDto> data=gdao.ranking();
		ArrayList<RankingDto> data2=gdao.ranking2();
		ArrayList<RankingDto> data3=gdao.ranking3();
		ArrayList<RankingDto> data4=gdao.ranking4();
		
		/*System.out.println(data.get(0).getRank());
		System.out.println(data.get(1).getRank());
		System.out.println(data.get(2).getRank());
		System.out.println(data.get(3).getRank());
		System.out.println(data.get(4).getRank());
		System.out.println(data.get(5).getRank());
		*/
		/*String data0=data.get(0).getRank()+",";
		String data1=data.get(1).getRank()+",";
		String data2=data.get(2).getRank()+",";
		String data3=data.get(3).getRank()+",";
		String data4=data.get(4).getRank()+",";
		String data5=data.get(5).getRank();*/
	
		String data1="";
		for(int i=0;i<data.size();i++)
		{
			data1=data1+data.get(i).getRank();
			if(i!=5)
				data1=data1+",";
		}
		
		String data33="";
		for(int i=0;i<data.size();i++)
		{
			data33=data33+data2.get(i).getRank();
			if(i!=5)
				data33=data33+",";
		}
		String data44="";
		for(int i=0;i<data.size();i++)
		{
			data44=data44+data3.get(i).getRank();
			if(i!=5)
				data44=data44+",";
		}
		String data55="";
		for(int i=0;i<data.size();i++)
		{
			data55=data55+data4.get(i).getRank();
			if(i!=5)
				data55=data55+",";
		}
		
		// System.out.println(data1);
		 model.addAttribute("data",data1);
		 model.addAttribute("data3",data33);
		 model.addAttribute("data4",data44);
		 model.addAttribute("data5",data55);
		return module+"/guess";
	}
	
	//@RequestMapping(module+"/autumn")
	//public String autumn()
	//{
	//	return module+"/autumn";
	//}
	
	@RequestMapping(module+"/fa")
	public String fa()
	{
		return module+"/fa";
	}
	
	@RequestMapping(module+"/autumn")
	public String autumn(HttpServletRequest request,Model model)
	{
		String name=request.getParameter("name");
		if(name==null)
		{
			name="gr1";
		}
		
		model.addAttribute("name",name);
		
		return module+"/autumn";
	}
	
	
}
