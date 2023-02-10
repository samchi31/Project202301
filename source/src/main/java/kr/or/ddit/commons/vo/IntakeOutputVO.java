package kr.or.ddit.commons.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
public class IntakeOutputVO {
	private Integer hsptNo;
	private Integer ioTotal;
	private String ioDate;
	
	private List<IntakeVO> intakeList;
	private List<OutputVO> outputList;
}
