package kr.or.ddit.commons.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="recNo")
public class ReceiveDetailVO {
	private String recNo;
	private Integer rdEtcf;	// 제증명및기타
	private Integer rdTtfe; // 진료비 총액
	private Integer rdPafe;	// 환자부담 총액
	private Integer rdBffe; // 납부할 금액
	private Integer rdAtfe;	// 이미 납부한 금액
	private Integer rdCofe;	// 진찰료
	private Integer rdHpfe;	// 입원료
	private Integer rdFdfe;	// 식대
	private Integer rdDrfe;	// 투약및조제료
	private Integer rdIjfe;	// 주사료
	private Integer rdPtfe;	// 물리치료비
	private Integer rdMtfe;	// 치료재료대
	private Integer rdExfe;	// 영상검사료
	private Integer rdMdfe;	// 영상진단료
	private Integer rdOperfe;	// 수술료
	
	private String trmCd;
}
