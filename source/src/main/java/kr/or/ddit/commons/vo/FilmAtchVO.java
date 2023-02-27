package kr.or.ddit.commons.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FilmAtchVO {
	private String fiatOrinm;
	private String fiatCd;
	private String fiatSavenm;
	private String trmCd;
	private String filmCd;
	private String fadCd;
	private MultipartFile[] attachFiles;
	
	//FILM_ATCH : FILM_ATCH_DETAIL = 1 : N
	private List<FilmAtchDetailVO> filmAtchDetailVOList;
}
