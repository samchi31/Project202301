package kr.or.ddit.commons.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * <pre>
 * 페이징과 관련한 모든 데이터를 가진 객체
 * </pre>
 * @author 위대현
 * @since 2023. 2. 3.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 *   수정일                    수정자                          수정내용
 * --------       --------    ----------------------
 * 2023. 2. 3.      위대현                         최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

@Getter
@NoArgsConstructor
@ToString
public class PagingVO<T> {
	public PagingVO(int screenSize, int blockSize) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}

	private int totalRecord; // DB 조회
	private int screenSize=10; // 임의 설정
	private int blockSize=5; // 임의 설정
	
	private int currentPage; // 클라이언트 파라미터
	
	private int totalPage;
	private int startRow;
	private int endRow;
	private int startPage;
	private int endPage;
	
	private List<T> dataList;
	
	private SearchVO simpleCondition; // 단순 키워드 검색용
	private T detailCondition; // 상세 검색용.
	
	public void setDetailCondition(T detailCondition) {
		this.detailCondition = detailCondition;
	}

	public void setSimpleCondition(SearchVO simpleCondition) {
		this.simpleCondition = simpleCondition;
	}
	
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}
	
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		totalPage = (totalRecord + (screenSize - 1)) / screenSize;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		endRow = currentPage * screenSize;
		startRow = endRow - (screenSize - 1);
		endPage = ((currentPage + (blockSize-1)) / blockSize) * blockSize;
		startPage = endPage - (blockSize - 1);
	}
	
	public int getEndPage() {
		return endPage > totalPage ? totalPage : endPage ;
	}
}
