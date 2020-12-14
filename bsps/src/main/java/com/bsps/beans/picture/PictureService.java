package com.bsps.beans.picture;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public interface PictureService {
	public Picture registerPicture(MultipartFile attach);
	public List<Picture> searchAllPicture();
	public Picture searchPictureByNo(int pictureNo);
	public Picture searchPictureByName(MultipartFile attach);
	public void modifyPicture(int pictureNo, MultipartFile attach);
	public void displayPicture(Picture picture);
	public Picture createLocalPicture(MultipartFile attach);
	public void deleteLocalPicture(Picture picture);
	public Picture setThumbnail(Picture picture);
	public boolean checkChange(int pictureNo, MultipartFile attach);
	public boolean checkDuplicate(String OriginalFileName);
	public boolean checkEmpty(Picture picture, MultipartFile attach);
}