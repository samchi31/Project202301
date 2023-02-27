package kr.or.ddit.nurse.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of="opNo")
@Data
public class OperationJoinVO {
	private String opNo;
	private Integer empNo;
	private String empNm;
	private String opNm;
}
