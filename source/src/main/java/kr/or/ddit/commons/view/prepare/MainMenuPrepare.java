package kr.or.ddit.commons.view.prepare;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;

import kr.or.ddit.commons.vo.MenuVO;

public class MainMenuPrepare implements ViewPreparer{

	@Override
	public void execute(Request req, AttributeContext attributeContext) {
		MenuVO menu1 = new MenuVO("접수","/receiption/receiptionView");
		MenuVO menu2 = new MenuVO("진료","/doctor/main");
		MenuVO menu3 = new MenuVO("영상","/radiology/radiologyView");
		MenuVO menu4 = new MenuVO("물리치료","/pt/ptView");
		MenuVO menu5 = new MenuVO("병동관리","/nurse/wardMainNew");
		MenuVO menu6 = new MenuVO("수술/검사","/nurse/operationMain");
		MenuVO menu7 = new MenuVO("공통","/notice/notice");
		
		menu1.setMenuCode("1");
		
		List<MenuVO> menuList = Arrays.asList(menu1, menu2, menu3, menu4, menu5, menu6, menu7);
		
		Map<String, Object> scope = req.getContext(Request.REQUEST_SCOPE);
		scope.put("menuList", menuList);
	}

}
