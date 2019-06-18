package cn.wmyskxz.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.wmyskxz.entity.Student;
import cn.wmyskxz.service.StudentService;
import cn.wmyskxz.util.Page;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping("/addStudent")
	public String addStudent(HttpServletRequest request, HttpServletResponse response) {
		Student student = new Student();
		
		int studentId = Integer.parseInt(request.getParameter("student_id"));
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String sex = request.getParameter("sex");
		Date birthday = null;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			birthday = sdf.parse(request.getParameter("birthday"));
		} catch(ParseException e) {
			e.printStackTrace();
		}
		
		student.setStudent_id(studentId);
		student.setName(name);
		student.setAge(age);
		student.setSex(sex);
		student.setBirthday(birthday);
		
		studentService.addStudent(student);
		
		return "redirect:listStudent";
	}
	
	@RequestMapping("/listStudent")
	public String listStudent(HttpServletRequest request, HttpServletResponse response) {
		int start = 0;
		int count = 10;
		try {
			start = Integer.parseInt(request.getParameter("page.start"));
			count = Integer.parseInt(request.getParameter("page.count"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		Page page = new Page(start, count);
		
		List<Student> students = studentService.list(start, count);
		int total = studentService.getTotal();
		page.setTotal(total);
		
		request.setAttribute("students", students);
		request.setAttribute("page", page);
		
		return "listStudent";
	}
	
	@RequestMapping("/editStudent")
	public ModelAndView editStudent(int id) {
		ModelAndView mav = new ModelAndView("editStudent");
		Student student = studentService.getStudent(id);
		mav.addObject("student", student);
		
		return mav;
	}
	
	@RequestMapping("/updateStudent")
	public String updateStudent(HttpServletRequest request, HttpServletResponse response) {
		Student student = new Student();
		
		int id = Integer.parseInt(request.getParameter("id"));
		int student_id = Integer.parseInt(request.getParameter("student_id"));
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String sex = request.getParameter("sex");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthday = null;
		try {
			birthday = sdf.parse(request.getParameter("birthday"));
		} catch(ParseException e) {
			e.printStackTrace();
		}
		
		student.setId(id);
		student.setStudent_id(student_id);
		student.setName(name);
		student.setAge(age);
		student.setSex(sex);
		student.setBirthday(birthday);
		
		studentService.updateStudent(student);
		return "redirect:listStudent";
	}
	
}
