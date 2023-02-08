package kr.or.ddit.commons.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
@EqualsAndHashCode(of= {"trmCd", "preCd"})
public class PrescriptionVO {
	private String trmCd;
	private String preCd;
	private String preDetail;
	private Integer preNt;
	private Integer preTotal;
	private Integer price=8000;
	private String injcPthNm;
	private String unit;
	private String payTpNm;
}
