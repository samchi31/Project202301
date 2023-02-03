package kr.or.ddit.commons.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;

//@Data
//@EqualsAndHashCode(of="menuCode")
//@NoArgsConstructor
//@RequiredArgsConstructor
@Data
@RequiredArgsConstructor
@EqualsAndHashCode(of="menuCode")
public class MenuVO {
	private String menuCode;
	private String menuText;
	private final String menuURL;
	private final String menuColor;
}
