package kr.co.baseball.dao;

import java.util.ArrayList;

import kr.co.baseball.dto.MemberDto;
import kr.co.baseball.dto.ProductDto;

public interface MemberDao {

	public void member_ok(MemberDto mdto);	
	public Integer get_check(String userid);
	public Integer get_chupoint(String userid,String chuid);
	public MemberDto login_ok(MemberDto mdto);
	public String userid_search_ok(MemberDto mdto);
	public void userpwd_check_ok(MemberDto mdto);
	public MemberDto mypage(String userid);
	public MemberDto mypage_update(int mid);
	public void mypage_update_ok(MemberDto mdto);
	public String get_pwd(int mid);
	public void mypage_delete(int mid);
	public String userid_search_ok2(MemberDto mdto);
	
	public Integer get_emailcheck(String email);
	public ArrayList<ProductDto> mycoupon(String userid);
	
}
