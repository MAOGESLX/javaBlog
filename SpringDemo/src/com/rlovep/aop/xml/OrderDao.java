package com.rlovep.aop.xml;

public class OrderDao {
	public void save() throws Exception{
		System.out.println("-----OrderDao：保存！！！------");
		
			try {
				int i=1/0;
			} catch (Exception e) {
				throw  e;			
				}
		
	}

}