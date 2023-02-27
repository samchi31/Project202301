package kr.or.ddit.commons.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 물리치료 기록서
 * @author PC-12
 *
 */
@NoArgsConstructor
@ToString
@Getter
public class PtDocumentVO {
	
	private Integer pdNo;
	private String pdDt;
	private String trmCd;
	private String pdCont;
	private String pdPart;
	
	private String paNo;
	private String paName;
	private Integer paReg;
}
