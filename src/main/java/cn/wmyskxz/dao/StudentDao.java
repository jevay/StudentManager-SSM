package cn.wmyskxz.dao;

import java.util.List;

import cn.wmyskxz.entity.Student;

public interface StudentDao {
	int getTotal();
	
	void addStudent(Student student);
	
	void deleteStudent(int id);
	
	void updateStudent(Student student);
	
	Student getStudent(int id);
	
	List<Student> list(int start, int count);
}
