package test_aop;

public class NewlecCalc implements Calc {
	//private int x , y 객체지향
	// 밑에는 함수 지향
	
	private int x;
	private int y;
	
	public void set(int x, int y){
		this.x=x;
		this.y=y;
	}
	
	public int add(){
		
		int result=  x+ y;
		
		return result;
	}
	
	public int sub(){
		
		int result= x-y;
		
		return result;
		
	}
}
