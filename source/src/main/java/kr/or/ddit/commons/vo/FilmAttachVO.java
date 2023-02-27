package kr.or.ddit.commons.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="fiatNo")
@Data
public class FilmAttachVO extends AttachCommonsVO implements Serializable{
	private String fiatNo;
	private Integer radresNo;
	private String fiatSavenm;
	private String fiatOrinm;
	
	private String trmCd;
	private String rcpNo;
	private String paNo;
	private String paName;
	private String filmCd;
	
	@Override
	public String getfadCd() {
		return fiatNo;
	}
}
