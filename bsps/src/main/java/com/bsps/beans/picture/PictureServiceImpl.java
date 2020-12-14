package com.bsps.beans.picture;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class PictureServiceImpl implements PictureService {
	private static final String ORIGINAL_PATH = "C:\\eclipse-workspace\\bsos\\src\\main\\resources\\static\\images\\beans\\origins";
	private static final String THUMBNAIL_PATH = "C:\\eclipse-workspace\\bsos\\src\\main\\resources\\static\\images\\beans\\thumbnails";
	private static final String TEMPORARY_PICTURE = "thumbnail.png";

	@Autowired
	private PictureMapper pictureMapper;
	@Autowired
	private HttpServletResponse response;

	@Override
	public Picture registerPicture(MultipartFile attach) {
		Picture picture = new Picture();

		try {
			if (!(attach.isEmpty()) && (null != attach.getOriginalFilename())) {
				picture = this.createLocalPicture(attach);
				pictureMapper.insert(picture);
				picture = this.searchPictureByName(attach);
				
			} else {
				picture = this.setThumbnail(picture);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return picture;
	}
	
	public List<Picture> searchAllPicture() {
		List<Picture> pictureList = new ArrayList<Picture>();

		try {
			pictureList = pictureMapper.selectAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pictureList;
	}

	@Override
	public Picture searchPictureByNo(int pictureNo) {
		Picture picture = new Picture(pictureNo);

		try {
			if (1 != pictureNo) {
				picture = pictureMapper.select(picture);
				
				if (null == picture) {
					picture = setThumbnail(picture);
				}
			} else {
				picture = setThumbnail(picture);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return picture;
	}

	@Override
	public Picture searchPictureByName(MultipartFile attach) {
		Picture picture = new Picture();

		try {
			if (!(attach.isEmpty()) && (null != attach.getOriginalFilename())) {
				picture.setLogicalFileName(attach.getOriginalFilename());
				picture = pictureMapper.select(picture);
				
				if (null == picture) {
					picture = setThumbnail(picture);
				}
			} else {
				picture = setThumbnail(picture);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return picture;
	}

	@Override
	public void modifyPicture(int pictureNo, MultipartFile attach) {
		try {
			if (!(attach.isEmpty()) && (null != attach.getOriginalFilename())) {
				Picture picture = this.searchPictureByNo(pictureNo);
				Picture updatePicture = this.createLocalPicture(attach);
				updatePicture.setPictureNo(pictureNo);
				
				this.deleteLocalPicture(picture);
				pictureMapper.update(updatePicture);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void displayPicture(Picture picture) {
		response.setContentType("image/*");
		FileInputStream inputStream = null;
		ServletOutputStream outputStream = null;

		try {
			outputStream = response.getOutputStream();

			String path = picture.getPath() + File.separator + picture.getPhysicalFileName();
			inputStream = new FileInputStream(path);
			
			int length;
			byte[] buffer = new byte[10];
			while ((length = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, length);
			}
			outputStream.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != outputStream) {
					outputStream.close();
				}
				if (null != inputStream) {
					inputStream.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public Picture createLocalPicture(MultipartFile attach) {
		Picture picture = new Picture();

		String logicalFileName = attach.getOriginalFilename();
		try {
			int subIndex = logicalFileName.lastIndexOf(".");
			String extension = logicalFileName.substring(subIndex + 1);
			String originName = logicalFileName.substring(0 , subIndex);
			int index = 1;
			
			boolean isCheck = false;
			boolean isDupli = this.checkDuplicate(originName);
			if (isDupli) {
				isCheck = true;
				originName = originName.concat(" (" + index + ")");
				
				isDupli = this.checkDuplicate(originName);
				while (isDupli) {
					originName = originName.replace(" (" + index + ")", " (" + (index + 1) + ")");
					index++;
					
					isDupli = this.checkDuplicate(originName);
					if (false == isDupli) {
						break;
					}
				}
				logicalFileName = originName + "." + extension;
			}
			
			String physicalFileName = "";
			if (isCheck) {
				String[] logicalFile = logicalFileName.split(" (" + index + ")");
				String fileName = logicalFile[0];
				String fileExtension = logicalFile[1];
				
				physicalFileName = UUID.randomUUID().toString() + "_" + fileName + fileExtension;
			} else {
				physicalFileName = UUID.randomUUID().toString() + "_" + logicalFileName;
			}
			
			File originFile = new File(ORIGINAL_PATH + File.separator + logicalFileName);
			File thumbnailFile = new File(THUMBNAIL_PATH + File.separator + physicalFileName);
			
			attach.transferTo(originFile);

			BufferedImage originPicture = ImageIO.read(originFile);

			int thumbnailWidth = 800;
			int thumbnailHeight = 560;
			BufferedImage thumbnailPicture = new BufferedImage(thumbnailWidth, thumbnailHeight, BufferedImage.TYPE_3BYTE_BGR);
			Image image = originPicture.getScaledInstance(thumbnailWidth, thumbnailHeight, Image.SCALE_SMOOTH);
			
			Graphics2D graphic = thumbnailPicture.createGraphics();
			graphic.drawImage(image, 0, 0, thumbnailWidth, thumbnailHeight, null);
			graphic.dispose();

			ImageIO.write(thumbnailPicture, extension, thumbnailFile);

			picture.setPath(THUMBNAIL_PATH);
			picture.setLogicalFileName(logicalFileName);
			picture.setPhysicalFileName(physicalFileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return picture;
	}

	@Override
	public void deleteLocalPicture(Picture picture) {
		String logicalFileName = picture.getLogicalFileName();
		String physicalFileName = picture.getPhysicalFileName();

		File LogicalPicture = new File(ORIGINAL_PATH + File.separator + logicalFileName);
		File PhysicalPicture = new File(THUMBNAIL_PATH + File.separator + physicalFileName);
	
		if (LogicalPicture.exists() && PhysicalPicture.exists()) {
			LogicalPicture.delete();
			PhysicalPicture.delete();
		}
	}
	
	@Override
	public Picture setThumbnail(Picture picture) {
		try {
			picture.setPictureNo(1);
			picture.setPath(THUMBNAIL_PATH);
			picture.setLogicalFileName(TEMPORARY_PICTURE);
			picture.setPhysicalFileName(TEMPORARY_PICTURE);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return picture;
	}
	
	@Override
	public boolean checkChange(int pictureNo, MultipartFile attach) {
		List<Picture> pictureList = new ArrayList<Picture>();
		boolean isChange = true;
		
		if (1 != pictureNo) {
			if (null != attach) {
				pictureList = this.searchAllPicture();

				if (null != pictureList) {
					Iterator<Picture> iterator = pictureList.iterator();
					
					while (iterator.hasNext()) {
						Picture targetPicture = iterator.next();
						
						if (attach.getOriginalFilename().equals(targetPicture.getLogicalFileName())) {
							isChange = false;
						}
					}
				}
			}
		} else {
			isChange = false;
		}
		return isChange;
	}
	
	@Override
	public boolean checkDuplicate(String originName) {
		boolean isDupli = false;
		
		try {
			List<Picture> targetList = pictureMapper.selectAll();
			Iterator<Picture> iterator = targetList.iterator();
						
			while (iterator.hasNext()) {
				Picture targetPicture = iterator.next();
				
				if (this.checkEmpty(targetPicture, null)) {
					int subIndex = targetPicture.getLogicalFileName().lastIndexOf(".");
					
					String targetName = targetPicture.getLogicalFileName().substring(0, subIndex);
					
					if (targetName.equals(originName)) {
						isDupli = true;
						break;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return isDupli;
	}
	
	@Override
	public boolean checkEmpty(Picture picture, MultipartFile attach) {
		boolean isNotEmpty = false;
		
		if (null != picture && null == attach) {
			if (null != picture.getLogicalFileName() && "" != picture.getLogicalFileName()) {
				isNotEmpty = true;
			}
		} else if (null != attach && null == picture) {
			if (null != attach.getOriginalFilename() && 0 != attach.getSize()) {
				isNotEmpty = true;
			}
		} else if (null != attach && null != picture) {
			if (null != attach.getOriginalFilename() && 0 != attach.getSize() &&
				null != picture.getLogicalFileName() && "" != picture.getLogicalFileName()) {
				isNotEmpty = true;
			}
		}
		return isNotEmpty;
	}
}
