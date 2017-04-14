package test_aop;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class LogHandler implements MethodInterceptor {

	@Override
	public Object invoke(MethodInvocation method) throws Throwable {
		System.out.println("메롱 앞이지롱");
		Object result =method.proceed();
		System.out.println("너의 뒤에 있다");
		
		return result;
	}
}
