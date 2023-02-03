package kr.or.ddit.commons.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="mrgId")
@Data
public class SystemAdminVO {
	private String mrgId;
	private String mrgPw;
}
