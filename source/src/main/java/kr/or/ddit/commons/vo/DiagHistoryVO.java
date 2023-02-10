package kr.or.ddit.commons.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
@EqualsAndHashCode(of="diseaseCd")
public class DiagHistoryVO {
	private String diseaseCd;
	private String icdName;
	private String trmCd;
	private String operTf;
	private String physiotherapyTf;
	
	private HospitalizationVO hospitalization;
}
