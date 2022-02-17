package kr.co.baseball.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.baseball.dao.AdminpDao;
import kr.co.baseball.dao.MemberDao;
import kr.co.baseball.dao.PlayersDao;
import kr.co.baseball.dto.MainDto;

@Controller
public class AdminpController{
	
	private final String module="/adminp";
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(module+"/players_list")
	public String players_list(Model model,HttpServletRequest request)
	{
			String field,word;  
			if(request.getParameter("field")==null)
				
			{
				field="pname"; //초기값을 선수이름필드로잡기
				word="";       
			}
			else
			{
				field=request.getParameter("field");
				word=request.getParameter("word");
			}
			
			int page;
			if(request.getParameter("page")==null)
			{
				page=1;
			}
			else
			{
				page=Integer.parseInt(request.getParameter("page"));
			}
			int index=(page-1)*10;
			
			AdminpDao pdao=sqlSession.getMapper(AdminpDao.class);
			
			ArrayList<MainDto> list=pdao.listall(field,word,index);
			
					int pstart=page/10;
					if(page%10 == 0)
						pstart=pstart-1;
					pstart=(pstart*10)+1;
					int pend=pstart+9;
					int page_cnt=pdao.get_pagecount(field,word);
					
					if(pend>page_cnt)
						pend=page_cnt;
			
			model.addAttribute("page_cnt",page_cnt);
			model.addAttribute("pend",pend);
			model.addAttribute("pstart",pstart);
			model.addAttribute("page",page);
			model.addAttribute("list",list);
			model.addAttribute("field",field);
			model.addAttribute("word",word);

			return module+"/players_list";
		}
	@RequestMapping(module+"/players_list2")
	public String players_list2(Model model,HttpServletRequest request)
	{
		
	
			String field,word;  
			if(request.getParameter("field")==null)
				
			{
				field="pid"; //초기값을 선수번호
				word="";       
			}
			else
			{
				field=request.getParameter("field");
				word=request.getParameter("word");
			}
			
			int page;
			if(request.getParameter("page")==null)
			{
				page=1;
			}
			else
			{
				page=Integer.parseInt(request.getParameter("page"));
			}
			int index=(page-1)*10;
			
			AdminpDao pdao=sqlSession.getMapper(AdminpDao.class);
			
			ArrayList<MainDto> list=pdao.listall2(field,word,index);
			
					int pstart=page/10;
					if(page%10 == 0)
						pstart=pstart-1;
					pstart=(pstart*10)+1;
					int pend=pstart+9;
					int page_cnt=pdao.get_pagecount2(field,word);
					
					if(pend>page_cnt)
						pend=page_cnt;
			
			model.addAttribute("page_cnt",page_cnt);
			model.addAttribute("pend",pend);
			model.addAttribute("pstart",pstart);
			model.addAttribute("page",page);
			model.addAttribute("list",list);
			model.addAttribute("field",field);
			model.addAttribute("word",word);

			return module+"/players_list2";
		}
	
	@RequestMapping(module+"/players_list3")
	public String players_list3(Model model,HttpServletRequest request)
	{
		
	
			String field,word;  
			if(request.getParameter("field")==null)
				
			{
				field="pname"; //초기값을 선수이름필드로잡기
				word="";       
			}
			else
			{
				field=request.getParameter("field");
				word=request.getParameter("word");
			}
			
			int page;
			if(request.getParameter("page")==null)
			{
				page=1;
			}
			else
			{
				page=Integer.parseInt(request.getParameter("page"));
			}
			int index=(page-1)*10;
			
			AdminpDao pdao=sqlSession.getMapper(AdminpDao.class);
			
			ArrayList<MainDto> list=pdao.listall3(field,word,index);
			
					int pstart=page/10;
					if(page%10 == 0)
						pstart=pstart-1;
					pstart=(pstart*10)+1;
					int pend=pstart+9;
					int page_cnt=pdao.get_pagecount3(field,word);
					
					if(pend>page_cnt)
						pend=page_cnt;
			
			model.addAttribute("page_cnt",page_cnt);
			model.addAttribute("pend",pend);
			model.addAttribute("pstart",pstart);
			model.addAttribute("page",page);
			model.addAttribute("list",list);
			model.addAttribute("field",field);
			model.addAttribute("word",word);

			return module+"/players_list3";
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
	
	@RequestMapping(module+"/playersprf32")
	public String playersprf32(Model model,HttpServletRequest request)
	{
		PlayersDao pdao=sqlSession.getMapper(PlayersDao.class);
		
		String gid=request.getParameter("gid");
		// System.out.println("d"+pid); 콘솔확인용
		
		ArrayList<MainDto> list=pdao.listPrf32(gid);
		model.addAttribute("list",list);
		
		return module+"/playersprf32";
	}
	
	@RequestMapping(module+"/write")
	public String write()
	{
		AdminpDao pdao=sqlSession.getMapper(AdminpDao.class);
		return module+"/write";
	}
	
	@RequestMapping(module+"/write_ok")
	public String write_ok(MainDto mdto)
	{
		AdminpDao pdao=sqlSession.getMapper(AdminpDao.class);
		pdao.write_ok(mdto);
		return "redirect:"+module+"/players_list";
	}
	
	@RequestMapping(module+"/check")
	public void check(PrintWriter out,HttpServletRequest request)
	{
		String pid=request.getParameter("pid");
		AdminpDao pdao=sqlSession.getMapper(AdminpDao.class);
		int chk=pdao.get_check(pid);
		out.print(chk);
	}
	
	@RequestMapping(module+"/check2")
	public void check2(PrintWriter out,HttpServletRequest request)
	{
		String gid=request.getParameter("gid");
		AdminpDao pdao=sqlSession.getMapper(AdminpDao.class);
		int chk=pdao.get_check2(gid);
		out.print(chk);
	}
	
	@RequestMapping(module+"/update")
	public String update(Model model,HttpServletRequest request)
	{
		String pid=(request.getParameter("pid"));
		AdminpDao pdao=sqlSession.getMapper(AdminpDao.class);
		MainDto mdto=pdao.update(pid);
		model.addAttribute("mdto",mdto);
		return module+"/update";
	}
	
	@RequestMapping(module+"/update_ok")
	public String update_ok(MainDto mdto)
	{
		// 정보를 수정하고 content로 이동
		AdminpDao pdao=sqlSession.getMapper(AdminpDao.class);
		pdao.update_ok(mdto);  
		return "redirect:"+module+"/players_list";
	}
	
	@RequestMapping(module+"/delete")
	public String delete(Model model,HttpServletRequest request)
	{
		String pid=(request.getParameter("pid"));
		AdminpDao pdao=sqlSession.getMapper(AdminpDao.class);
		pdao.delete(pid);
		return "redirect:"+module+"/players_list";
	}
	
	@RequestMapping(module+"/write2")
	public String write2()
	{
			return module+"/write2";
	}
	
	@RequestMapping(module+"/write_ok2")
	public String write_ok2(MainDto mdto)
	{
		AdminpDao pdao=sqlSession.getMapper(AdminpDao.class);
		pdao.write_ok2(mdto);
		return "redirect:"+module+"/players_list2";
	}
	
	@RequestMapping(module+"/update2")
	public String update2(Model model,HttpServletRequest request)
	{
		String pid=(request.getParameter("pid"));
		AdminpDao pdao=sqlSession.getMapper(AdminpDao.class);
		MainDto mdto=pdao.update2(pid);
		model.addAttribute("mdto",mdto);
		return module+"/update2";
	}
	
	@RequestMapping(module+"/update_ok2")
	public String update_ok2(MainDto mdto)
	{
		// 정보를 수정하고 content로 이동
		AdminpDao pdao=sqlSession.getMapper(AdminpDao.class);
		pdao.update_ok2(mdto);  
		return "redirect:"+module+"/players_list2";
	}
	
	@RequestMapping(module+"/delete2")
	public String delete2(Model model,HttpServletRequest request)
	{
		String pid=(request.getParameter("pid"));
		AdminpDao pdao=sqlSession.getMapper(AdminpDao.class);
		pdao.delete2(pid);
		return "redirect:"+module+"/players_list2";
	}
	
	@RequestMapping(module+"/write3")
	public String write3()
	{
			return module+"/write3";
	}
	
	@RequestMapping(module+"/write_ok3")
	public String write_ok3(MainDto mdto)
	{
		AdminpDao pdao=sqlSession.getMapper(AdminpDao.class);
		pdao.write_ok3(mdto);
		return "redirect:"+module+"/players_list3";
	}
	
	@RequestMapping(module+"/update3")
	public String update3(Model model,HttpServletRequest request)
	{
		String gid=(request.getParameter("gid"));
		AdminpDao pdao=sqlSession.getMapper(AdminpDao.class);
		MainDto mdto=pdao.update3(gid);
		model.addAttribute("mdto",mdto);
		return module+"/update3";
	}
	
	@RequestMapping(module+"/update_ok3")
	public String update_ok3(MainDto mdto)
	{
		// 정보를 수정하고 content로 이동
		AdminpDao pdao=sqlSession.getMapper(AdminpDao.class);
		System.out.println(mdto.getAvg());
		System.out.println(mdto.getPname());
		pdao.update_ok3(mdto);  
		return "redirect:"+module+"/players_list3";
	}
	
	@RequestMapping(module+"/delete3")
	public String delete3(Model model,HttpServletRequest request)
	{
		String gid=(request.getParameter("gid"));
		AdminpDao pdao=sqlSession.getMapper(AdminpDao.class);
		pdao.delete3(gid);
		return "redirect:"+module+"/players_list3";
	}
	
}

