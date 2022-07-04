package com.pro.present.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pro.present.dao.FreeBoardDao;
import com.pro.present.dto.MemberDto;

public class BwriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("freeboardUp");
		int maxSize = 1024*1024*10;
		MultipartRequest mRequest = null;
		String bfilename = "";
		
		try {
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8",
						new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			bfilename = mRequest.getFilesystemName(param);
			
			HttpSession session = request.getSession();
			MemberDto member = (MemberDto) session.getAttribute("member");
			
			if(member != null) {
				String mid = member.getMid();
				String bmbti = mRequest.getParameter("bmbti");
				String btitle = mRequest.getParameter("btitle");
				String bcontent = mRequest.getParameter("bcontent");
				String bip = request.getRemoteAddr();
				FreeBoardDao fDao = FreeBoardDao.getInstance();
				int result = fDao.write(mid, bmbti, btitle, bcontent, bfilename, bip);
				
				if(result == fDao.SUCCESS) {
					request.setAttribute("writeResult", "글쓰기 성공");
				}else {
					request.setAttribute("writeResult", "글쓰기 실패");
				}
			}else {
				request.setAttribute("writeResult", "로그인 해주세요");
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
		// 파일 카피
		if(bfilename!=null) {
			InputStream is = null;
			OutputStream os = null;
			
			try {
				File serverFile = new File(path+"/"+bfilename);
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("D:\\Webpro\\Source\\present_project_jsp\\present_project\\WebContent\\freeboardUp\\"+bfilename);
				byte[] bs = new byte[(int)serverFile.length()];
				while(true) {
					int byteCnt = is.read(bs);
					if(byteCnt==-1) break;
					os.write(bs, 0, byteCnt);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {

					try {
						if(os!=null) os.close();
						if(is!=null) is.close();						
					} catch (IOException e) {
						System.out.println(e.getMessage());
					}
			}
			
		}

	}

}
