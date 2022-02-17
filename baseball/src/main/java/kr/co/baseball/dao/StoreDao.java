package kr.co.baseball.dao;

import kr.co.baseball.dto.ProductDto;

public interface StoreDao {
	
	public int point_chk(String userid);
	
	public Integer chk(String userid,String proname);
	
	public Integer coupon(String coupon);
	
	public void purchase(ProductDto pdto);
	
	public void point_sub(int price,String userid);

}
