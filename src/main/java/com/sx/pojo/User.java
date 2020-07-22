package com.sx.pojo;

import java.util.List;

/**
 * 用户表
 * @author 微爱
 *
 */
public class User {
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	private int id;			//用户id
	private String name;	//用户名称
	private int age;		//用户年龄
	private int gender;		//用户性别1男 2女
	private String address;	//用户地址
	private String password;
	private List<Jurisdiction> jurisdiction;
	
	public List<Jurisdiction> getJurisdiction() {
		return jurisdiction;
	}
	public void setJurisdiction(List<Jurisdiction> jurisdiction) {
		this.jurisdiction = jurisdiction;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
