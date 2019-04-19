package game.common.auth;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

import game.model.domain.Master;

//�Ź� �α����� �ʿ��� �ڵ帶�� ������ �ۼ����� ����, ���� �ڵ�� �и����� AOP �� �����غ���
@Aspect
public class LoginCheck {

	@Pointcut("execution(public * game.controller.MasterController..main*(..))")
	public void loginCut() {

	}

	@Around("loginCut()")
	public String checkSession(ProceedingJoinPoint joinPoint) {
		String viewName = null;
		HttpServletRequest request = null;

		// ���� �ִ��� ���� üũ
		Object[] args = joinPoint.getArgs();
		for (int i = 0; i < args.length; i++) {
			System.out.println(args[i]);
			// ������Ʈ�� �ڷ����� HttpServletRequest �� ���� �˾ƺ���
			if (args[i] instanceof HttpServletRequest) {
				request = (HttpServletRequest) args[i]; // ��û ��ü�� ��� ���
			}
		}
		// ���ǿ� ��� �ִ� ���𰡰� �ִ��� üũ
		if (request.getSession().getAttribute("master") == null) {
			System.out.println("�α��� �����ݾƿ�!! �������� ������!!");
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