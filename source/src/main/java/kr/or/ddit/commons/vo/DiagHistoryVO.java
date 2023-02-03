package kr.or.ddit.commons.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
@EqualsAndHashCode(of="icd")
public class DiagHistoryVO {
	private String icd;
	private String icdName;
	private String trmCd;
	private String operTf;
	
}
