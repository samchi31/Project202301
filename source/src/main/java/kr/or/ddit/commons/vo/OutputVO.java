package kr.or.ddit.commons.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of="outputNo")
@Data
public class OutputVO {
	private String outputNo;
	private String ioDate;
	private String outputCapa;
	private String outputNe;
	private Integer hsptNo;
	private String outputCateCd;
	private Integer empNo;
	
	private String outputCateNm;
}
