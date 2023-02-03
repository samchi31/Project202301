package kr.or.ddit.commons.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="wrRno")
public class BedVO {
	private Integer wrRno;
	private Integer bedNo;
}
