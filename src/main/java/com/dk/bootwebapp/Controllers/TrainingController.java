package com.dk.bootwebapp.Controllers;

import com.dk.bootwebapp.model.Employee;
import com.dk.bootwebapp.model.Training;
import com.dk.bootwebapp.service.TrainingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class TrainingController {
    @Autowired
    TrainingService trainingService;

    @GetMapping("/addTraining")
    public String AddTrainingGet(HttpSession session){
        String userType = (String)session.getAttribute("userType");
        if(userType == null){
            return "redirect:/login";
        }
        else if (!userType.equals("admin")) {
            return "redirect:/BadRequest";
        } else{
            return "AddNewTrainingByAdmin";
        }
    }

    @PostMapping("/addTraining")
    public String AddTrainingPost(HttpSession session,
                                  @RequestParam(name = "startDay") int startDay,
                                  @RequestParam(name = "startMonth") int startMonth,
                                  @RequestParam(name = "startYear") int startYear,
                                  @RequestParam(name = "endDay") int endDay,
                                  @RequestParam(name = "endMonth") int endMonth,
                                  @RequestParam(name = "endYear") int endYear,
                                  @RequestParam(name = "topic") String topic,
                                  @RequestParam(name = "trainerName") String trainerName,
                                  @RequestParam(name = "location") String location)
    {
        String userType = (String)session.getAttribute("userType");
        if(userType == null){
            return "redirect:/login";
        }
        else if (!userType.equals("admin")) {
            return "redirect:/BadRequest";
        } else{
            Date startDate = new Date(startYear - 1900, startMonth - 1, startDay);
            Date endDate = new Date(endYear - 1900, endMonth - 1, endDay);

            trainingService.addNewTraining(topic,startDate,endDate,location,trainerName);
            return "SuccessPage";
        }
    }

    @GetMapping("/AssignTraining")
    public String AssignTraining(ModelMap modelMap, @RequestParam(name = "employeeId",required = true) String employeeId, @RequestParam(name = "employeeName",required = true) String empName){
        modelMap.put("employeeName",empName);
        List<Training> current = trainingService.findCurrent();
        List<Training> future = trainingService.findFuture();
        modelMap.put("current",current);
        modelMap.put("future",future);
        return "AssignTrainingsByAdmin";
    }


    // for admin
    @GetMapping("/getAllTrainings")
    public String getAllTrainings(HttpSession session,ModelMap modelMap){
        String userType = (String)session.getAttribute("userType");
        if(!userType.equals("admin")){
            return "redirect:/login";
        }
        List<Training> prev = trainingService.findPrev();
        List<Training> current  = trainingService.findCurrent();
        List<Training> future =  trainingService.findFuture();
        modelMap.put("prev",prev);
        modelMap.put("current",current);
        modelMap.put("future",future);
        return "ViewAllTraining";
    }

    @GetMapping("/getTrainees")
    public String ShowTraineedForSelection(ModelMap modelMap,@RequestParam(name = "trainingId",required = true) String trainingId){
        long tid = Long.parseLong(trainingId);
        HashMap<String,List<Employee>> hm = trainingService.findEmployeesAssociatedWithAndWithoutTraining(tid);
        List<Employee> currentPursuing = new ArrayList<>();
        List<Employee> rest = new ArrayList<>();
        if(hm.containsKey("current")){
            currentPursuing = hm.get("current");
        }
        if(hm.containsKey("rest")){
            rest = hm.get("rest");
        }
        modelMap.put("current",currentPursuing);
        modelMap.put("rest",rest);
        modelMap.put("trainingId",tid);
        return "showParticipantsAndAdd";
    }

    @GetMapping("/updateTraining")
    public String updateTrainingGet(ModelMap modelMap,@RequestParam(name = "id", required = true) String id){
        modelMap.put("id",id);
        return "EditTrainingByAdmin";
    }

    @PostMapping("/updateTraining")
    public String updateTrainingPost(
            @RequestParam(name = "updateType", required = true) String type, // Change "type" to "updateType"
            @RequestParam(name = "newValue", required = true) String value,
            @RequestParam(name = "id", required = true) String id
    ) throws ParseException {
        Long lid = Long.parseLong(id);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println("type - " + type);
        System.out.println("value - " + value);
        System.out.println("id - " + id );
        if(type.equals("updateTopic")){
            trainingService.updateTopic(value,lid);
        }
        else if(type.equals("updateLocation")){
            trainingService.updateLocation(value,lid);
        }
        else if(type.equals("updateStartDate")){
            java.util.Date utilDate = dateFormat.parse(value);
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            trainingService.updateStartDate(sqlDate,lid);
        }
        else if(type.equals("updateEndDate")){
            java.util.Date utilDate = dateFormat.parse(value);
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            trainingService.updateEndDate(sqlDate,lid);
        }
        return "SuccessPage";
    }


}
