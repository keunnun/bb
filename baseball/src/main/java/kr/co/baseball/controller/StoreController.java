package kr.co.baseball.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.baseball.dao.Coupon;
import kr.co.baseball.dao.StoreDao;
import kr.co.baseball.dto.ProductDto;

@Controller
public class StoreController {
	
	private final String module="/store";
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(module+"/store")
	public String index(HttpSession session,Model model)
	{
		
		if(session.getAttribute("userid")!=null)
		{
			String userid=session.getAttribute("userid").toString();
			StoreDao sdao=sqlSession.getMapper(StoreDao.class);
			int point=sdao.point_chk(userid);

			model.addAttribute("point",point);
			
			return module+"/store";
		}
		else
		{
			return module+"/store";
		}
	}
	
	@RequestMapping(module+"/chk")
	public void chk(HttpServletRequest request,PrintWriter out,HttpSession session)
	{
		String userid=session.getAttribute("userid").toString();
		String proname=request.getParameter("proname");
		
		StoreDao sdao=sqlSession.getMapper(StoreDao.class);
		int chk=sdao.chk(userid, proname);
		
		// System.out.println(chk);
		out.print(chk);
	}
	
	@RequestMapping(module+"/purchase")
	public String purchase(HttpServletRequest request,HttpSession session,ProductDto pdto)
	{
		String userid=session.getAttribute("userid").toString();
		String proname=request.getParameter("proname");
		int price=Integer.parseInt(request.getParameter("price"));
		String imgname=request.getParameter("imgname");
		
		StoreDao sdao=sqlSession.getMapper(StoreDao.class);
		
		// 쿠폰번호 랜덤부여
		Coupon co=new Coupon();
		String coupon="";
		while(true)
		{
			coupon=co.random(8);
			int c_chk=sdao.coupon(coupon);
		   	
			if(c_chk==0)
				break;
		}
		
		pdto.setUserid(userid);
		pdto.setProname(proname);
		pdto.setPrice(price);
		pdto.setImgname(imgname);
		pdto.setCoupon(coupon);
		
		sdao.purchase(pdto);
		sdao.point_sub(price, userid);
		
		return module+"/success";
	}
}
