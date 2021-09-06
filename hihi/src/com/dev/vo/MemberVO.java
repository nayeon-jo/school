package com.dev.vo;

public class MemberVO {

	private String id;
	private String passwd;
	private String name;
	private String mail;
	private String zip;
	private String add;
	private String phone;
	
	public MemberVO(String id, String pwd)
	{
		this.id = id;
		this.passwd = pwd;
	}

	public MemberVO() {
		
	}

	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getPasswd()
	{
		return passwd;
	}
	public void setPasswd(String pass)
	{
		this.passwd = pass;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getMail()
	{
		return mail;
	}
	public void setMail(String mail)
	{
		this.mail = mail;
	}
	public String getZip()
	{
		return zip;
	}
	public void setZip(String zipcode) {
		this.zip = zipcode;
	}
	public String getAdd()
	{
		return add;
	}
	public void setAdd(String address) {
		this.add = address;
		
	}
	public void setPhone(String phone) {
		this.phone = phone;
		
	}
	public String getPhone()
	{
		return phone;
	}

}
