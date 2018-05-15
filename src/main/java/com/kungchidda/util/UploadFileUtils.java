package com.kungchidda.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

import com.kungchidda.util.MediaUtils;


public class UploadFileUtils {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
		
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString() + "_"+originalName;
		
		String savedPath = calcPath(uploadPath);
		
		File target = new File(uploadPath + savedPath, savedName);
		
		FileCopyUtils.copy(fileData, target);
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		
		String uploadedFileName = null;
		
		if(MediaUtils.getMediaType(formatName) != null) {
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		
		return uploadedFileName;
	}
	
	public static String calcPath(String uploadPath) {
		
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		logger.info(datePath);
		
		return datePath;
				
		
	}
	
	private static void makeDir(String uploadPath, String... paths) {
		if(new File(paths[paths.length-1]).exists()) {
			return;
		}
		
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			
			if(! dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
	
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception{
		
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		
		//BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 400);
		//BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_WIDTH, 700);
		
		
		
		
		//썸네일의 너비와 높이 입니다.
	    int dw = 500, dh = 500;
	    
	    // 원본 이미지의 너비와 높이 입니다.
	    int ow = sourceImg.getWidth();
	    int oh = sourceImg.getHeight();
	    
	    // 원본 너비를 기준으로 하여 썸네일의 비율로 높이를 계산합니다.
	    int nw = ow;
	    int nh = (ow * dh) / dw;
	    
	    // 계산된 높이가 원본보다 높다면 crop이 안되므로
	    // 원본 높이를 기준으로 썸네일의 비율로 너비를 계산합니다.
	    if(nh > oh) {
	        nw = (oh * dw) / dh;
	        nh = oh;
	    }
	  	
	    // 계산된 크기로 원본이미지를 가운데에서 crop 합니다.
	    BufferedImage cropImg = Scalr.crop(sourceImg, (ow-nw)/2, (oh-nh)/2, nw, nh);

	    // crop된 이미지로 썸네일을 생성합니다.
	    BufferedImage destImg = Scalr.resize(cropImg, dw, dh);
	    
	    // 썸네일을 저장합니다. 이미지 이름 앞에 "THUMB_" 를 붙여 표시했습니다.
	    //String thumbName = PATH + "THUMB_" + fileName;
	    //File thumbFile = new File(thumbName);
		
		
		
		
		
		
		
		
		
		
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		
		File newFile = new File(thumbnailName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);

		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		
	}
	
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception{
		String iconName = uploadPath + path + File.separator + fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar,'/');
	}

}
