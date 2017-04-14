package com.newlecture.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.newlecture.web.data.dao.NoticeDao;
import com.newlecture.web.data.dao.NoticeFileDao;
import com.newlecture.web.data.entity.Notice;
import com.newlecture.web.data.entity.NoticeFile;
import com.newlecture.web.data.entity.NoticeView;
import com.newlecture.web.data.mysql.MYSQLNoticeDao;
import com.newlecture.web.data.mysql.MySQLNoticeFileDao;


@Controller
@RequestMapping("/customer/*")
public class CustomerController {
	
	@Autowired
	private ServletContext context;
	@Autowired
	private NoticeDao noticeDao;
	@Autowired
	private NoticeFileDao noticeFileDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("notice")
/*	@ResponseBody*/
	public String notice(
			@RequestParam(value="p", defaultValue="1")Integer page, 
			@RequestParam(value="f", defaultValue="TITLE")String field, 
			@RequestParam(value="q", defaultValue="")String query, Model model){
		//return String.format("page:%s, field:%s, query:%s\n", page,field,query);
		//List<NoticeView> list = noticeDao.getList();
		List<NoticeView> list=sqlSession.getMapper(NoticeDao.class).getList(page,field,query);
		model.addAttribute("list",list);
		//return "/WEB-INF/views/customer/notice.jsp"; 리로스 뷰 리졸버에서 설정해서 밑에꺼 씀
		return "customer.notice";
	}
	
	@RequestMapping("notice-detail")
	public String noticeDetail(
			@RequestParam("c")String code, Model model){
		//model.addAttribute("n",noticeDao.get(code));
		model.addAttribute("n", sqlSession.getMapper(NoticeDao.class).get(code));
/*		NoticeView n = noticeDao.get(code);
		NoticeView next = noticeDao.getNext(code);
		NoticeView prev = noticeDao.getPrev(code);
		List<NoticeFile> list = noticeFileDao.getList(n.getCode());
			
		model.addAttribute("n",n);	
		model.addAttribute("prev",prev);	
		model.addAttribute("next",next);	
		model.addAttribute("list",list);
		*/
		return "customer.notice-detail";
	}
	
	@RequestMapping(value="notice-reg", method=RequestMethod.GET)
	public String noticeReg(){
		
		return "customer.notice-reg";
	}
	
	@RequestMapping(value="notice-reg", method=RequestMethod.POST, produces="text/html; charset=UTF-8")
/*	@ResponseBody*/
	public String noticeReg(Notice notice, @RequestParam(value="files") List<MultipartFile> files) throws IOException{
		//MultipartFile[] == List<MultipartFile>
		//StringBuilder sb = new StringBuilder();		
		//return file.getOriginalFilename();
		//return sb.toString();
		

		String path = context.getRealPath("/resource/upload");
		
		File d = new File(path);
		if(!d.exists()){
			d.mkdir();
		}
		byte[] buf = new byte[1024];
		
		for(MultipartFile file : files){
			if(!file.isEmpty()){
			String fileName = file.getOriginalFilename();
			InputStream fis = file.getInputStream();
			OutputStream fos = new FileOutputStream(path+File.separator+fileName);
			
			int len = 0;
			
			while((len=fis.read(buf)) >0)
				fos.write(buf, 0, len);
			
			fis.close();
			fos.close();
			}
		}
		notice.setWriter("KYJU");
		noticeDao.add(notice);
		
		for(MultipartFile file : files){
			if(!file.isEmpty()){
			String fileName = file.getOriginalFilename();
			NoticeFile f= new NoticeFile();
			f.setNoticeCode(noticeDao.lastCode());
			f.setSrc(fileName);
			noticeFileDao.add(f);	
			}
		}
		
		return "redirect:notice";

	}
	@RequestMapping("notice-del")
	public String noticeDel(
			@RequestParam("c")String code){
		// 파일 정보 얻기
/*		String path = context.getRealPath("/resource/upload");
		File f = new File(path);
		f.delete();*/
		
		
		// 외래키 제약 조건에 on delete CASCADE가 되어 있는 경우
		// notice 정보만 지우면 됨.
		// 그렇지 않은 경우 notice file을 먼저 지워야함. -외래키 제약조건 오류 발생.
		noticeDao.delete(code);
		
		
		return "redirect:notice";
	}
	
	@RequestMapping(value="notice-edit", method=RequestMethod.GET)
	public String noticeEdit(
			@RequestParam("c")String code, Model model){
		
		model.addAttribute("n",noticeDao.get(code));
		
		return "customer.notice-edit";
	}
	@RequestMapping(value="notice-edit", method=RequestMethod.POST)
	public String noticeEdit(String title, String content, String code){
		
		Notice notice=noticeDao.get(code);
		notice.setTitle(title);
		notice.setContent(content);
		
		noticeDao.update(notice);
		
		return "redirect:notice-detail?c="+notice.getCode();
	}
	
	@RequestMapping("join")
	public String join() {
		
		return "joinus.login";
	}
	
	@RequestMapping("login")
	public String login() {
		
		return "customer.notice";
	}
}
