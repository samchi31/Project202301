package kr.or.ddit.utils.fullcalendar;

public abstract class FullCalendarEventAdapter<T> implements FullCalendarEvent<T>{
	private T source;
	
	public FullCalendarEventAdapter(T source) {
		super();
		this.source = source;
	}

	@Override
	public T getSource() {
		return source;
	}
}
