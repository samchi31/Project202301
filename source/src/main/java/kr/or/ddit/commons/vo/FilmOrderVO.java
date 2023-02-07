package kr.or.ddit.commons.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
@EqualsAndHashCode(of= {"trmCd","filmCd"})
public class FilmOrderVO {
	private String filmDate;
	private String trmCd;
	private String filmCd;
}
