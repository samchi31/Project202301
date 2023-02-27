package kr.or.ddit.commons.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="radresNo")
@Data
public class RadiologyResultVO {
	private Integer radresNo;
	private String trmCd;
	private String radresDt;
	
	private List<FilmAttachVO> filmattatch;
}
