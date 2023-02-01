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
		MenuVO menu1 = new MenuVO("메인화면 메뉴1", "#");
		MenuVO menu2 = new MenuVO("메인화면 메뉴2", "#");
		
		List<MenuVO> menuList = Arrays.asList(menu1, menu2);
		
		Map<String, Object> scope = req.getContext(Request.REQUEST_SCOPE);
		scope.put("menuList", menuList);
	}

}
