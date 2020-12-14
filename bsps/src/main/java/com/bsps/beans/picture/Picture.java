package com.bsps.beans.picture;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
@SuppressWarnings("serial")
public class Picture implements Serializable {
	private int pictureNo;
	private String path;
	private String logicalFileName;
	private String physicalFileName;

	public Picture() {
	}

	public Picture(int pictureNo) {
		this.pictureNo = pictureNo;
	}

	public Picture(int pictureNo, String path, String logicalFileName, String physicalFileName) {
		this.pictureNo = pictureNo;
		this.path = path;
		this.logicalFileName = logicalFileName;
		this.physicalFileName = physicalFileName;
	}

	public int getPictureNo() {
		return pictureNo;
	}

	public void setPictureNo(int pictureNo) {
		this.pictureNo = pictureNo;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getPath() {
		return this.path;
	}

	public void setLogicalFileName(String logicalFileName) {
		this.logicalFileName = logicalFileName;
	}

	public String getLogicalFileName() {
		return this.logicalFileName;
	}

	public void setPhysicalFileName(String physicalFileName) {
		this.physicalFileName = physicalFileName;
	}

	public String getPhysicalFileName() {
		return this.physicalFileName;
	}
}