package test_aop;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Program {

	public static void main(String[] args) {
		
		ApplicationContext ���ڷ� = new ClassPathXmlApplicationContext("test_aop/aop-context.xml");
				
		Calc calc = (Calc) ���ڷ�.getBean("calc");
		calc.set(3, 4);
		System.out.println(calc.add());
	}

}
