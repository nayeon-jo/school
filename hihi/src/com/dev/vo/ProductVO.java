package com.dev.vo;

public class ProductVO {

	private String p_name;
	private String p_size;
	private String p_color;
	private String sell_price;
	private String amount;
	private String p_total;
	private String user_id;
	
	public ProductVO()
	{
		
	}
	public ProductVO(String id)
	{
		this.user_id = id; //아이디
	}
	public String getUser_id()
	{
		return user_id;
	}
	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}
	
	public String getPn()
	{
		return p_name; //이름
	}
	public void setPn(String Pn)
	{
		this.p_name = Pn;
	}
	
	public String getPs()
	{
		return p_size; //사이즈
	}
	public void setPs(String Ps)
	{
		this.p_size = Ps;
	}
	
	public String getPc()
	{
		return p_color; //컬러
	}
	public void setPc(String Pc)
	{
		this.p_color = Pc;
	}
	
	public String getPp() //가격
	{
		return sell_price;
	}
	public void setPp(String Pp)
	{
		this.sell_price = Pp;
	}
	
	public String getAm()
	{
		return amount; //수량
	}
	public void setAm(String am)
	{
		this.amount = am;
	}
	
	public String getPtotal()
	{
		return p_total; //토탈
	}
	public void setPtotal(String Ptotal)
	{
		this.p_total = Ptotal;
	}
	
}
