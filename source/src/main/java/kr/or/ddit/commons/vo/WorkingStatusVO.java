package kr.or.ddit.commons.vo;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
@EqualsAndHashCode(of="wsNo")
public class WorkingStatusVO {
	private String wsNo;
	private Integer empNo;
	private Date wsStartDt;
	private Date wsEndDt;
	private String wsdCd;
	private String wsColor;
	
	private String empNm;
	private String wsdName;
	private String wsdColorNm;
	private String wsdColorCd;
}
