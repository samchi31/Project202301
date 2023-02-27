package kr.or.ddit.utils.fullcalendar;

import java.util.Random;

import com.fasterxml.jackson.annotation.JsonInclude;

import kr.or.ddit.commons.vo.OperationInfomationVO;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class OperationFullCalendarEvent extends FullCalendarEventAdapter<OperationInfomationVO>{
	
	public OperationFullCalendarEvent(OperationInfomationVO source) {
		super(source);
	}
	
	@Override
	public String getId() {
		return getSource().getOpNo();
	}
	
	@Override
	public boolean isAllDay() {
		return false;
	}
	
	@Override
	public long getStart() {
		return getSource().getOpReservStarttime().getTime();
	}

	@Override
	public long getEnd() {
		return getSource().getOpReservEndtime().getTime();
	}

	@Override
	public String getTitle() {
		return getSource().getPaName();
	}
	
	
	@Override
	public String getBackgroundColor() {
		return "#"+getSource().getOpColorCd();
	}
	
//	private Random random = new Random(System.currentTimeMillis());
//	private static int bound = (int) (1*Math.pow(16, 6)); 
	// 캘린더 예약 타이틀 클릭시 링크 이동
//	@Override
//	public String getUrl() {
//		return "../nurse/"+getId();
//	}
}
