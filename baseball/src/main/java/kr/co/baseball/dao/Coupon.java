package kr.co.baseball.dao;

import java.util.Random;

public class Coupon {
	
	public String random(int n)
	{
		Random rand=new Random();
		String code="";
		for(int i=1;i<=n;i++)
		{
			int num=rand.nextInt(62);
			char c;
			if(num<10)
				c=(char)(num+48);
			else if(num>=10 && num <=35)
				c=(char)(num+55);
	        else
	        	c=(char)(num+61);
			code=code+c;
		}
		return code;
	}
}
