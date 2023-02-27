package kr.or.ddit.nurse.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of="cexNo")
@Data
public class CexVO {
	private String cexNo;
	private String cexCbc;
	private String cexEcg;
	private String cexUa;
	private String cexPfts;
	private String cexDate;
	private String cexNe;
	private Integer empNo;
	private String empNm;
	private String cexStatus;
	private String trmCd;
	
	private String paNo;
	private String paName;
	
	private String diseaseCd;
	private String icdName;
}
