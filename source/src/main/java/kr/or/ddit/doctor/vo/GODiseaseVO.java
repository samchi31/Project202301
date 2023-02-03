package kr.or.ddit.doctor.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
@EqualsAndHashCode(of= {"icd","goCd"})
public class GODiseaseVO {
	private String icd;
	private String goCd;
	private String icdName;
	private String operTf;
}
