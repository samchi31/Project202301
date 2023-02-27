package kr.or.ddit.commons.vo;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Alias("AttachCommonsVO")
@Data
public abstract class AttachCommonsVO {
	private List<AttachVO> attachList; //has many
	private int[] delAttNos; // 게시글 수정시 삭제할 첨부파일 번호 유지
	private int attCount;
	private MultipartFile[] attachFiles;
	private int startAttNo;
	
	public void setAttatchFiles(MultipartFile[] attatchFiles) {
		if(attatchFiles!=null && attachFiles.length > 0) {
			this.attachFiles = attachFiles;
			this.attachList = Arrays.stream(attachFiles)
					.filter((f) -> !f.isEmpty())
					.map((f)->{
						return new AttachVO(f);
					}).collect(Collectors.toList());
		}
	}
	
	public abstract String getfadCd();
}
