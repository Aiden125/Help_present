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
import com.pro.present.dao.MemberDao;
import com.pro.present.dto.MemberDto;

public class MmodifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("memberPhotoUp");
		int maxSize = 1024 * 1024 * 10;
		String mphoto = "";
		try {
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "utf-8",
					new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			mphoto = mRequest.getFilesystemName(param);
			
			String mid = mRequest.getParameter("mid");
			String mpw = mRequest.getParameter("mpw");
			String mname = mRequest.getParameter("mname");
			String mmbti = mRequest.getParameter("mmbti");
			String memail = mRequest.getParameter("memail");
			String mgender = mRequest.getParameter("mgender");
			String dbmphoto = mRequest.getParameter("dbmphoto");
			mphoto = mphoto == null ? dbmphoto : mphoto;
			String mbirthStr = mRequest.getParameter("mbirth");
			Date mbirth = null;
			if (!mbirthStr.equals("")) {
				mbirth = Date.valueOf(mbirthStr);
			}
			
			MemberDao mDao = MemberDao.getInstance();
			MemberDto member = new MemberDto(mid, mpw, mname, mphoto, mbirth, mgender, memail, mmbti, null, 0, 0);
			
			int result = mDao.modifyMember(member);
			if (result == MemberDao.SUCCESS) {
				HttpSession session = request.getSession();
				session.setAttribute("member", member);
				request.setAttribute("modifyResult", "정보수정 성공");
			} else {
				request.setAttribute("modifyResult", "정보수정 실패");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}


		File serverFile = new File(path + "/" + mphoto);
		if (serverFile.equals("NOIMG.JPG") && serverFile.exists()) {
			InputStream is = null;
			OutputStream os = null;
			try {
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("D:\\Webpro\\Source\\present_project_jsp\\present_project\\WebContent\\memberPhotoUp\\" + mphoto);
				byte[] bs = new byte[(int) serverFile.length()];
				while (true) {
					int readByteCnt = is.read(bs);
					if (readByteCnt == -1)
						break;
					os.write(bs, 0, readByteCnt);
				}
			} catch (IOException e) {
				System.out.println(e.getMessage());
			} finally {
				try {
					if (os != null) os.close();
					if (is != null) is.close();
				} catch (IOException e) {
					// TODO: handle exception
				}
			}
		}
	}
}

