package kr.or.ddit.commons.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@EqualsAndHashCode(of="menuCode")
//@NoArgsConstructor
@RequiredArgsConstructor
public class MenuVO {
	private String menuCode;
	private final String menuText;
	private final String menuURL;
	private String menuColor;
}
