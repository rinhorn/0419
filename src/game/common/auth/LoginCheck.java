package game.common.auth;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

import game.model.domain.Master;

//매번 로그인이 필요한 코드마다 로직을 작성하지 말고, 공통 코드로 분리시켜 AOP 를 적용해본다
@Aspect
public class LoginCheck {

	@Pointcut("execution(public * game.controller.MasterController..main*(..))")
	public void loginCut() {

	}

	@Around("loginCut()")
	public String checkSession(ProceedingJoinPoint joinPoint) {
		String viewName = null;
		HttpServletRequest request = null;

		// 세션 있는지 여부 체크
		Object[] args = joinPoint.getArgs();
		for (int i = 0; i < args.length; i++) {
			System.out.println(args[i]);
			// 오브젝트의 자료형이 HttpServletRequest 형 인지 알아보기
			if (args[i] instanceof HttpServletRequest) {
				request = (HttpServletRequest) args[i]; // 요청 객체만 골라서 담기
			}
		}
		// 세션에 담겨 있는 무언가가 있는지 체크
		if (request.getSession().getAttribute("master") == null) {
			System.out.println("로그인 안했잖아요!! 인증받지 못한자!!");
			viewName = "redirect:/admin/error/accessdeny.jsp";
		} else {
			Master Master = (Master) request.getSession().getAttribute("master");
			// System.out.println("^__^");
			System.out.println(Master.getAdmin_id());
			viewName = "admin/index";
		}

		return viewName;
	}
}