package kr.or.ddit.nurse.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of="hsptNo")
@Data
public class WardVO {
	private Integer hsptNo;
	private String hsptYn;
	private String hsptInDt;
	private String hsptOutDt;
	private Integer bedNo;
	private Integer wrRno;
	private String trmCd;
	
	private String paName;
	private String diseaseCd;
	private String icdName;
}
