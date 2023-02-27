package kr.or.ddit.commons.vo;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of="attId")
@ToString(exclude="realFile")
public class AttachVO implements Serializable{
	
	@JsonIgnore
	private transient MultipartFile realFile;
	
	public AttachVO(MultipartFile realFile) {
		super();
		this.realFile = realFile;
		this.attFilename = realFile.getOriginalFilename();
		this.attSavename = UUID.randomUUID().toString();
		this.attMime = realFile.getContentType();
		this.attFilesize = realFile.getSize();
		this.attFancysize = FileUtils.byteCountToDisplaySize(attFilesize);
	}
	
	private String fadCd;
	private Integer attno;
	private String attFilename;
	private String attSavename;
	private String attStreCours;
	private String attMime;
	private Long attFilesize;
	private String attFancysize;
	private Integer attDownload;
	
	public void saveTo(File saveFolder) throws IOException{
		if(realFile==null || realFile.isEmpty()) return;
		String fullFilePath = saveFolder + File.separator + attSavename;
		Path path = Paths.get(fullFilePath).toAbsolutePath();
		realFile.transferTo(path.toFile());
		setAttStreCours(saveFolder + File.separator);
	}
}
