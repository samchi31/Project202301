package kr.or.ddit.commons.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="ntcCd")
public class AtchFileDetailVO {
	private Integer ntcCd;
	private Integer fdetailNo;
	private String fdetailNm;
	private String fdetailMime;
	private String fdetailOrinm;
}
