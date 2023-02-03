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
}
