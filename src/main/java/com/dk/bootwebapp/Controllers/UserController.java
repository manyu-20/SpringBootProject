package com.dk.bootwebapp.Controllers;

import com.dk.bootwebapp.model.Employee;
import com.dk.bootwebapp.model.LoginForm;
import com.dk.bootwebapp.model.Training;
import com.dk.bootwebapp.service.EmployeeService;
import com.dk.bootwebapp.service.PasswordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller

public class UserController {

    @Autowired
    EmployeeService employeeService;

    @Autowired
    PasswordService passwordService;

    @GetMapping("/")
    public String CheckSession(HttpSession session){
        if(session.getAttribute("user") == null && session.getAttribute("userType")==null){
            return "redirect:/login";
        }
        else{
            return "redirect:/home";
        }

    }

    @GetMapping("/login")
    public String login (HttpSession session){
        String userName = (String) session.getAttribute("user");
        String userType = (String) session.getAttribute("userType");
        if(userName != null && userType != null){
            if(userType.equals("admin")){
                return "redirect:/home";
            }
            else{
                return "redirect:/home";
            }
        }
        else return "LogIn";
    }

    @PostMapping ("/home")
    public String home (ModelMap modelMap, HttpSession session, @ModelAttribute("loginForm")LoginForm loginForm){
        if(loginForm == null){
            System.out.println("login form is null");
            return "redirect:/login";
        }
        System.out.println(loginForm.toString());
        String username = loginForm.getUsername();
        String password = loginForm.getPassword();

        Employee emp = employeeService.CheckAuth(username,password);
        if(emp != null){
            System.out.println(emp.toString());
            session.setAttribute("userType",emp.getUserType());
            session.setAttribute("user",username);
            session.setAttribute("employeeName",emp.getName());
            session.setAttribute("employeeId",emp.getId());
            session.setAttribute("doj",emp.getDateOfJoining());
            session.setAttribute("dob",emp.getDob());
            session.setAttribute("phone",emp.getPhone());
        }
        else{
            System.out.println("employee is null");
            System.out.println("forwarding to login");
//            return "forward:/login";
            String errorMessage = "Invalid username or password";
            return "redirect:/login?error=" + errorMessage;

//            return "redirect:/login";
        }
        String userType = (String) session.getAttribute("userType");
        String user = (String) session.getAttribute("user");
        modelMap.put("empId",emp.getId());

        if(userType.equals("admin")){
            return "HomeAdmin";
        }
        else{
            return "HomeTrainee";
        }

    }

    @GetMapping("/home")
    public String homeGet(HttpSession session){
        String userType = (String)session.getAttribute("userType");
        String user = (String)session.getAttribute("user");
        if(userType == null || user == null){
            session.invalidate();
            return "redirect:/login";
        }
        else if(userType.equals("admin")){
            return "HomeAdmin";
        }
        else{
            return "HomeTrainee";
        }
//        session.invalidate();
//        return "redirect:/login";
//        String user = (String) session.getAttribute("user");
//        String pass = (String) session.getAttribute("password");
//        String userType = (String) session.getAttribute("userType");
//        if(user != null && pass != null && userType != null){
//            Employee emp = employeeService.CheckAuth(user,pass);
//            if(emp != null){
//                if(userType.equals("admin")){
//                    return "HomeAdmin";
//                }
//                else{
//                    return "HomeTrainee";
//                }
//            }
//            else{
//                return "redirect:/login";
//            }
//        }
//        else{
//            return "redirect:/login";
//        }
    }

    @GetMapping("/changePasswordUser")
    public String changePassword(HttpSession session){
        String user = (String)session.getAttribute("user");
        if(user == null){
            session.invalidate();
            return "redirect:/login";
        }
        else{
            return "ChangePasswordUser";
        }
    }

    @PostMapping("/changePassword")
    public String changePasswordPOST(@RequestParam(name = "password")String password,HttpSession session){
        System.out.println("inside post");

        String userName = (String)session.getAttribute("user");
        System.out.println("hello");
        System.out.println(userName);
        System.out.println();
        boolean isDone = employeeService.updatePassword(userName,password);
        if(isDone){
            return "SuccessPage";
        }
        else{
            return "FailurePage";
        }
    }

    @GetMapping("/changePhone")
    public String changePhone(HttpSession session) {
        String user = (String) session.getAttribute("user");
        if (user == null) {
            session.invalidate();
            return "redirect:/login";
        } else {
            return "ChangePhoneUser";
        }
    }
    @PostMapping("/changePhone")
    public String changePhonePOST(@RequestParam(name = "phone")String phone,HttpSession session){
        System.out.println("inside post");

        String userName = (String)session.getAttribute("user");
        System.out.println("hello");
        System.out.println(userName);
        System.out.println();
        boolean isDone = employeeService.updatePhone(userName,phone);
        if(isDone){
            return "SuccessPage";
        }
        else{
            return "FailurePage";
        }
    }

    @GetMapping("/getAllEmployees")
    public String getAllEmployees(ModelMap modelMap,HttpSession session){
        String user = (String)session.getAttribute("user");
        String userType = (String) session.getAttribute("userType");
        if(user == null){
            session.invalidate();
            return "redirect:/login";
        }
        else if(!userType.equals("admin")){
            return "redirect:/badRequest";
        }
        List<Employee> listOfTrainees = employeeService.findAllTrainees();
        modelMap.put("listOfTrainees",listOfTrainees);
        return "showAllEmployees";

    }

    @GetMapping("/badRequest")
    public String BadRequestError(){
        return "BadRequestError";

    }

    @GetMapping("/AssignTrainingById")
    public String AssignTrainingById(@RequestParam(name = "employeeId",required = true) String employeeId, @RequestParam(name = "trainingId",required = true) String trainingId){
        Long empId = Long.parseLong(employeeId);
        Long trId = Long.parseLong(trainingId);
        employeeService.addTrainingToEmployee(empId,trId);
        return "redirect:/getTrainees?trainingId="+trainingId;
//        return "redirect:/getAllTrainings";
    }





    @GetMapping("/viewTrainings")
    public String viewTrainingUser(ModelMap modelMap,@RequestParam(name = "empId") String empId){
        Long emplId = Long.parseLong(empId);
        HashMap<String,List<Training>> hm = employeeService.getAllTimeTrainings(emplId);
        if(hm.containsKey("current")){
            modelMap.put("current",hm.get("current"));
        }
        if(hm.containsKey("previous")){
            modelMap.put("previous",hm.get("previous"));
        }
        if(hm.containsKey("future")){
            modelMap.put("future",hm.get("future"));
        }
        System.out.println(hm);
        return "ViewTrainingsUser";
    }

    @GetMapping("/error")
    public String BadRequest(){
        return "BadRequest";
    }



}

