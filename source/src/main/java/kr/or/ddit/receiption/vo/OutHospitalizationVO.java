package kr.or.ddit.receiption.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString()
public class OutHospitalizationVO {

	private String paName;
	private String rcpNo;
	private String trmCd;
	private String hsptInDt;
	private String hsptOutDt;
	private Integer bedNo;
	private Integer wrRno;
	private String diseaseCd;
	private Integer hsptNo;
}
