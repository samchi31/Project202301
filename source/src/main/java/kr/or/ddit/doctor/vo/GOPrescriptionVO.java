package kr.or.ddit.doctor.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of= {"preCd", "goCd"})
@ToString
public class GOPrescriptionVO {
	private String preDetail;
	private String injcPthNm;
	private String unit;
	private String payTpNm;
	private String preCd;
	private String goCd;
}
