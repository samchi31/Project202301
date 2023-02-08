package kr.or.ddit.commons.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
@EqualsAndHashCode(of="waitNo")
public class WaitHistoryVO {
	private Integer waitNo;
	private Integer rcpNo;
	private String waitDt;
	private Integer waitNum;
	private String waitstCd;
	private String divCd;
	
	private String paNo;
	private String paName;
	private String divNm;
	private String waitstNm;
	
	
}
