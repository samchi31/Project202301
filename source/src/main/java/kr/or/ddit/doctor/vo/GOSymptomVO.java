package kr.or.ddit.doctor.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
@EqualsAndHashCode(of= {"goCd","symCd"})
public class GOSymptomVO {
	private String goCd;
	private String symCd;
	private String symDetail;
}
