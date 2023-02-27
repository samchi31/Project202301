package kr.or.ddit.nurse.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of="opCd")
@Data
public class OperationVO {
	private String opCd;
	private String opKrNm;
	private String opEnNm;
}
