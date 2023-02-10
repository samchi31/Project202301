package kr.or.ddit.commons.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of="hsptNo")
@Data
public class HospitalizationVO {
	private Integer hsptNo;
	private String hsptYn;
	private String hsptInDt;
	private String hsptOutDt;
	private Integer bedNo;
	private Integer wrRno;
	private String trmCd;
	private String diseaseCd;
	
	private List<VitalVO> vitalList; // has many 관계 (1:N)
	private String paName;
	private String empNm;
}
