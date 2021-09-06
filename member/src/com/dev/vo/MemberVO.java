package com.dev.vo;

public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	
	public String getId()
	{
		return this.id;
	}
	public void setId(String id)
	{
		this.id = id;	
	}
	
	public String getPwd()
	{
		return this.pwd;
	}
	public void setPwd(String pwd)
	{
		this.pwd = pwd;	
	}
	
	public String getName()
	{
		return this.name;
	}
	public void setName(String name)
	{
		this.name = name;	
	}
	
	public String getMail()
	{
		return this.email;
	}
	public void setMail(String email)
	{
		this.email = email;	
	}
	
}
