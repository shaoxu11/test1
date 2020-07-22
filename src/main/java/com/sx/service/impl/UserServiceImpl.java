package com.sx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sx.dao.UserDao;
import com.sx.pojo.Jurisdiction;
import com.sx.pojo.User;
import com.sx.service.UserService;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao ud;
	@Override
	public User loginUser(String name, String password) {
		// TODO Auto-generated method stub
		return ud.loginUser(name, password);
	}
	@Override
	public List<User> allUser() {
		// TODO Auto-generated method stub
		return ud.allUser();
	}
	@Override
	public List<Jurisdiction> byidMenu(int id) {
		// TODO Auto-generated method stub
		return ud.byidMenu(id);
	}
	@Override
	public List<Jurisdiction> byidButton(int user_id, int jurisdiction_parent) {
		// TODO Auto-generated method stub
		return ud.byidButton(user_id, jurisdiction_parent);
	}
	@Override
	public List<Jurisdiction> Assgin() {
		// TODO Auto-generated method stub
		return ud.Assgin();
	}
	@Override
	public int delRole(int id) {
		// TODO Auto-generated method stub
		return ud.delRole(id);
	}
	@Override
	public int addRole(int ids, int id) {
		// TODO Auto-generated method stub
		return ud.addRole(ids, id);
	}
	@Override
	public List<Jurisdiction> Assginbyid1() {
		// TODO Auto-generated method stub
		return ud.Assginbyid1();
	}
	@Override
	public List<Jurisdiction> Assginbyid2() {
		// TODO Auto-generated method stub
		return ud.Assginbyid2();
	}
	@Override
	public List<Jurisdiction> Assginbyid3() {
		// TODO Auto-generated method stub
		return ud.Assginbyid3();
	}

}
