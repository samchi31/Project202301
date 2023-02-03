package kr.or.ddit.commons.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="recNo")
public class ReceiveDetailVO {
	private Integer recNo;
	private Integer rdEtcf;
	private Integer rdTtfe;
	private Integer rdPafe;
	private Integer rdBffe;
	private Integer rdAtfe;
	private Integer rdCofe;
	private Integer rdHpfe;
	private Integer rdFdfe;
	private Integer rdDrfe;
	private Integer rdIjfe;
	private Integer rdPtfe;
	private Integer rdMtfe;
	private Integer rdExfe;
	private Integer rdMdfe;
	private Integer rdOperfe;
}
