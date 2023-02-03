package kr.or.ddit.doctor.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@EqualsAndHashCode(of="goCd")
@NoArgsConstructor
public class GroupOrderVO {
	private String goCd;
	private String goKo;
	private String field;
	private String trmCd;
	
	private List<GODiseaseVO> goDiseaseVOList;
	private List<GOPrescriptionVO> goPrescriptionVOList;
	private List<GOSymptomVO> goSymptomVO;
}
