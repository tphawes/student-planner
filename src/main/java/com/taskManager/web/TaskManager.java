package com.taskManager.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.taskManager.web")
public class TaskManager {

	public static void main(String[] args) {
		SpringApplication.run(TaskManager.class, args);
	}
}
