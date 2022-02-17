package kr.co.baseball.dao;

import java.sql.*;
import java.util.ArrayList;

import kr.co.baseball.dto.CDto;
import kr.co.baseball.dto.MemberDto;

public class CDao {	
	public ArrayList<CDto> list(int y,int m) throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/baseball";
		Connection conn = DriverManager.getConnection(url, "root", "1234");
		String sql = "select * from games where year=? and month=? order by day*1 asc";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, y);
		pstmt.setInt(2, m);
		ResultSet rs=pstmt.executeQuery();
		ArrayList<CDto> list = new ArrayList<CDto>();

		while (rs.next())
		{
			CDto cdto = new CDto();
			cdto.setGnum(rs.getInt("gnum"));
			cdto.setYear(rs.getInt("year"));
			cdto.setMonth(rs.getInt("month"));
			cdto.setDay(rs.getInt("day"));
			cdto.setExt(rs.getString("ext"));
			cdto.setHxt(rs.getString("hxt"));
			cdto.setGtime(rs.getString("gtime"));
			cdto.setParea(rs.getString("parea"));
			cdto.setExscore(rs.getString("exscore"));
			cdto.setHxscore(rs.getString("hxscore"));
			cdto.setReason(rs.getString("reason"));
			cdto.setHxresult(rs.getString("hxresult"));

			list.add(cdto);
		}

		rs.close();
		pstmt.close();
		conn.close();
		
		return list;
	}
	
	public ArrayList<CDto> dl(int y, int m, int d) throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/baseball";
		Connection conn = DriverManager.getConnection(url, "root", "1234");
		String sql = "select * from games where year=? and month=? and day=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, y);
		pstmt.setInt(2, m);
		pstmt.setInt(3, d);
		ResultSet rs=pstmt.executeQuery();
		ArrayList<CDto> list = new ArrayList<CDto>();

		while (rs.next())
		{
			CDto cdto = new CDto();
			cdto.setGnum(rs.getInt("gnum"));
			cdto.setYear(rs.getInt("year"));
			cdto.setMonth(rs.getInt("month"));
			cdto.setDay(rs.getInt("day"));
			cdto.setExt(rs.getString("ext"));
			cdto.setHxt(rs.getString("hxt"));
			cdto.setGtime(rs.getString("gtime"));
			cdto.setParea(rs.getString("parea"));
			cdto.setExscore(rs.getString("exscore"));
			cdto.setHxscore(rs.getString("hxscore"));
			cdto.setReason(rs.getString("reason"));

			list.add(cdto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();

		return list;
	}
}
