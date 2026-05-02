package com.example.steel_crafters;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class SteelCraftersApplication {

	public static void main(String[] args) {
		SpringApplication.run(SteelCraftersApplication.class, args);
	}

	@Autowired
	StudentRepo stdRepo;

	@GetMapping("/setStudent")
	public String setStudent() {
		Student std = new Student();
		std.setId(1);
		std.setName("Abhishek");
		std.setEmail("abhi@gmail.com");
		stdRepo.save(std);
		return "Sucess";
	}

	// read
	@GetMapping("/getById")
	public Student getById(@RequestParam Integer id) {

		return stdRepo.findById(id).get();
	}

	@GetMapping("/findAll")
	public List<Student> findAll() {

		return stdRepo.findAll();
	}

	// Update
	@GetMapping("/updateId")
	public Student updateById(@RequestParam Integer id) {
		Student std = stdRepo.findById(id).get();
		std.setEmail("piyush@12.com");
		std.setName("piyush");

		return stdRepo.save(std);
	}

	//delete
	@GetMapping("/deleteById")
	public String deletetById(@RequestParam Integer id) {
		stdRepo.deleteById(id);
		return "successfully Deleted :" +id;
	}
	
	@GetMapping("/deleteAll")
	public String deletetAll(){
		stdRepo.deleteAll();
		return "successfully Deleted all:" ;
	}

}
