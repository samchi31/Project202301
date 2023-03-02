package kr.or.ddit.utils.fullcalendar;

import com.fasterxml.jackson.annotation.JsonInclude;

import kr.or.ddit.commons.vo.WorkingStatusVO;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class ScheduleFullCalendarEvent extends FullCalendarEventAdapter<WorkingStatusVO>{
	
	public ScheduleFullCalendarEvent(WorkingStatusVO source) {
		super(source);
	}

	@Override
	public String getId() {
		return getSource().getWsNo();
	}

	@Override
	public long getStart() {
		return getSource().getWsStartDt().getTime();
	}

	@Override
	public long getEnd() {
		return getSource().getWsEndDt().getTime();
	}

	@Override
	public String getTitle() {
		return getSource().getEmpNm() + " (" + getSource().getWsdName()+ ")";
	}
	
	@Override
	public boolean isAllDay() {
		return true;
	}
	
	@Override
	public String getBackgroundColor() {
		return "#"+getSource().getWsdColorCd();
	}
}
