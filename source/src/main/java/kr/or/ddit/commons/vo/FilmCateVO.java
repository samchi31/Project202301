package kr.or.ddit.commons.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="filmCd")
@Data
public class FilmCateVO {
	private String filmCd;
	private String filmNm;
	private Integer empNo;
}
