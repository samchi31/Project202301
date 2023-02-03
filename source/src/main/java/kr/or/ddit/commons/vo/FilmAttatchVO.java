package kr.or.ddit.commons.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="fiatNo")
@Data
public class FilmAttatchVO {
	private Integer fiatNo;
	private Integer radresNo;
	private String fiatSavenm;
	private String fiatOrinm;
}
