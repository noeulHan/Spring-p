package com.spring.javagreenS_hne.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javagreenS_hne.dao.BoardDAO;
import com.spring.javagreenS_hne.vo.BoardReplyVO;
import com.spring.javagreenS_hne.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;

	@Override
	public List<BoardVO> getBoardList(int startIndexNo, int pageSize) {
		return boardDAO.getBoardList(startIndexNo,  pageSize);
	}

	@Override
	public void imgCheck(String content) {
		if(content.indexOf("src=\"/") == -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/ckeditor/");
		
		int position = 35;
		String nextImg = content.substring(content.indexOf("src=\"/") + position);
		boolean sw = true;
		
		while(sw) {
			String imgFile = nextImg.substring(0, nextImg.indexOf("\""));
			
			String oriFilePath = uploadPath + imgFile;
			String copyFilePath = uploadPath + "board/" + imgFile;
			
			fileCopyCheck(oriFilePath, copyFilePath);	// board폴더에 파일을 복사처리한다.
			
			if(nextImg.indexOf("src=\"/") == -1) {
				sw = false;
			}
			else {
				nextImg =nextImg.substring(nextImg.indexOf("src=\"/") + position);
			}
		}
	}

	private void fileCopyCheck(String oriFilePath, String copyFilePath) {
		File oriFile = new File(oriFilePath);
		File copyFile = new File(copyFilePath);
		
		try {
			FileInputStream fis = new FileInputStream(oriFile);
			FileOutputStream fos = new FileOutputStream(copyFile);
			
			byte[] buffer = new byte[2048];
			int count = 0;
			while((count = fis.read(buffer)) != -1) {
				fos.write(buffer, 0, count);
			}
			fos.flush();
			fos.close();
			fis.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setBoardInput(BoardVO vo, MultipartHttpServletRequest mfile) {
		try {
			List<MultipartFile> fileList = mfile.getFiles("file");
			String oFileNames = "";
			String sFileNames = "";
			
			for(MultipartFile file : fileList) {
				String oFileName = file.getOriginalFilename();
				String sFileName = saveFileName(oFileName);	// 서버에 저장될 파일명을 결정해준다.
				
				writeFile(file, sFileName);		// 서버에 파일 저장처리하기
				
				oFileNames += oFileName + "/";
				sFileNames += sFileName + "/";
			}
			vo.setFName(oFileNames);
			vo.setFSName(sFileNames);
			
			boardDAO.setBoardInput(vo);		// 서버에 파일 저장완료후 DB에 내역을 저장시켜준다.
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void writeFile(MultipartFile file, String sFileName) throws IOException {
		byte[] data = file.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/board/");
		
		FileOutputStream fos = new FileOutputStream(uploadPath + sFileName);
		fos.write(data);
		fos.close();
	}

	private String saveFileName(String oFileName) {
		String fileName = "";
		
		Calendar cal = Calendar.getInstance();
		fileName += cal.get(Calendar.YEAR);
		fileName += cal.get(Calendar.MONTH);
		fileName += cal.get(Calendar.DATE);
		fileName += cal.get(Calendar.HOUR);
		fileName += cal.get(Calendar.MINUTE);
		fileName += cal.get(Calendar.SECOND);
		fileName += cal.get(Calendar.MILLISECOND);
		fileName += "_" + oFileName;
		
		return fileName;
	}


	@Override
	public void setReadNum(int idx) {
		boardDAO.setReadNum(idx);
	}

	@Override
	public BoardVO getBoardContent(int idx) {
		return boardDAO.getBoardContent(idx);
	}

	@Override
	public List<BoardVO> getBoardSearch(int startIndexNo, int pageSize, String search, String searchString) {
		return boardDAO.getBoardSearch(startIndexNo, pageSize, search, searchString);
	}

	@Override
	public ArrayList<BoardVO> getPreNext(int idx) {
		return boardDAO.getPreNext(idx);
	}

	@Override
	public int getMinIdx() {
		return boardDAO.getMinIdx();
	}

	@Override
	public void imgDelete(String content) {
		
		if(content.indexOf("src=\"/") == -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/ckeditor/board/");
		
		int position = 37;
		String nextImg = content.substring(content.indexOf("src=\"/") + position);
		boolean sw = true;
		int cnt = 0;
		while(sw) {
			System.out.println("cnt  : " + cnt);
			String imgFile = nextImg.substring(0, nextImg.indexOf("\""));
			String oriFilePath = uploadPath + imgFile;
			
			fileDelete(oriFilePath);
			
			if(nextImg.indexOf("src=\"/") == -1) {
				sw = false;
			}
			else {
				nextImg =nextImg.substring(nextImg.indexOf("src=\"/") + position);
			}
		}
	}

	private void fileDelete(String oriFilePath) {
		File delFile = new File(oriFilePath);
		if(delFile.exists()) delFile.delete();
	}

	@Override
	public void setBoardDelete(int idx) {
		boardDAO.setBoardDelete(idx);
	}

	@Override
	public void imgCheckUpdate(String content) {
		if(content.indexOf("src=\"/") == -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/ckeditor/board/");
		
		int position = 37;
		String nextImg = content.substring(content.indexOf("src=\"/") + position);
		boolean sw = true;
		
		while(sw) {
			String imgFile = nextImg.substring(0, nextImg.indexOf("\""));
			String oriFilePath = uploadPath + imgFile;
			String copyFilePath = request.getRealPath("/resources/data/ckeditor/" + imgFile);
			
			fileCopyCheck(oriFilePath, copyFilePath);	// board폴더에 파일을 복사처리한다.
			
			if(nextImg.indexOf("src=\"/") == -1) {
				sw = false;
			}
			else {
				nextImg =nextImg.substring(nextImg.indexOf("src=\"/") + position);
			}
		}		
		
	}

	@Override
	public void setBoardUpdate(BoardVO vo) {
		boardDAO.setBoardUpdate(vo);
	}

	@Override
	public String maxLevelOrder(int boardIdx) {
		return boardDAO.maxLevelOrder(boardIdx);
	}

	@Override
	public void setBoardReplyInput(BoardReplyVO replyVo) {
		boardDAO.setBoardReplyInput(replyVo);
	}

	@Override
	public ArrayList<BoardReplyVO> getBoardReply(int idx) {
		return boardDAO.getBoardReply(idx);
	}

	@Override
	public void levelOrderPlusUpdate(BoardReplyVO replyVo) {
		boardDAO.levelOrderPlusUpdate(replyVo);
	}

	@Override
	public void setBoardReplyInput2(BoardReplyVO replyVo) {
		boardDAO.setBoardReplyInput2(replyVo);
	}

	@Override
	public void setBoardReplyDeleteOk(int idx) {
		boardDAO.setBoardReplyDeleteOk(idx);
	}
	
}






