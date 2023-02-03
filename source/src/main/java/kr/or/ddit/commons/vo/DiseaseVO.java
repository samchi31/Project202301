package kr.or.ddit.commons.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
@EqualsAndHashCode(of="diseaseCd")
public class DiseaseVO {
	private String diseaseCd;
	private String enNm;
	private String korNm;
}
