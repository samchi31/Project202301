package kr.or.ddit.commons.vo;

import java.util.List;

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
	private String rcpNo;
	private String waitDt;
	private Integer waitNum;
	private String waitstCd;
	private String divCd;
	
	private String paNo;
	private String paName;
	private String divNm;
	private String waitstNm;
	private String trmCd;
	private String filmCd;
	private String filmDate;
	private String trmDt;
	private String paSex;
	private String paReg;
	
	private List<String> filmCdList;
	private List<WaitStatusVO> waitStatusList;
}
