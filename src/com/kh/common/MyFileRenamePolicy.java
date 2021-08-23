package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File originFile) { // 업로드할 원본파일이 전달됨
		
		String originName = originFile.getName();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String currentTime = sdf.format(new Date());
		
		int random = (int)(Math.random()*90000 + 10000); 
		
		String ext = ""; // 확장자
		
		int dot = originName.lastIndexOf("."); 
		ext = originName.substring(dot); // . 뒤의 확장자명을 저장 -> .jpg, .png, .pdf 등
		
		String fileName = currentTime + random + ext; // 현재시간 + 랜덤값 + 확장자명
		
		File renamefile = new File(originFile.getParent(), fileName);
		
		return renamefile;
	}
	
	

}
