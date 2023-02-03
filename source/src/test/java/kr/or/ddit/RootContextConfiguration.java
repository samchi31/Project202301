package kr.or.ddit;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/*-context.xml") // 2. 테스트용 가상 컨테이너 생성
@WebAppConfiguration //3. WebApplicationContext로 가상 컨테이너 생성.
public @interface RootContextConfiguration {

}
