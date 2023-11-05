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
            return "redirect:/badRequest";
        } else{
            return "AddNewTrainingByAdmin";
        }
    }

    @PostMapping("/addTraining")
    public String AddTrainingPost(HttpSession session,
                                  @RequestParam(name = "startDate") String startDate,
                                  @RequestParam(name = "endDate") String endDate,
                                  @RequestParam(name = "topic") String topic,
                                  @RequestParam(name = "trainerName") String trainerName,
                                  @RequestParam(name = "location") String location)
    {
        System.out.println("afaeaefeffe");
        String userType = (String)session.getAttribute("userType");
        if(userType == null){
            return "redirect:/login";
        }
        else if (!userType.equals("admin")) {
            return "redirect:/badRequest";
        } else{
            System.out.println(startDate);
            System.out.println(endDate);


            Date startDateSql = java.sql.Date.valueOf(startDate);
            Date endDateSql = java.sql.Date.valueOf(endDate);
            trainingService.addNewTraining(topic,startDateSql,endDateSql,location,trainerName);
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
    public String ShowTraineedForSelection(ModelMap modelMap,@RequestParam(name = "trainingId",required = true) String trainingId, @RequestParam(name = "type",required = false) String type){
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
        if(type != null){
            System.out.println("type = " + type);
            modelMap.put("type",type);
        }
        else {
            System.out.println("type is null");
        }

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
            Date startDateSql = java.sql.Date.valueOf(value);
            trainingService.updateStartDate(startDateSql,lid);
        }
        else if(type.equals("updateEndDate")){
            Date EndDateSql = java.sql.Date.valueOf(value);
            trainingService.updateEndDate(EndDateSql,lid);
        }
        return "SuccessPage";
    }

    @GetMapping("/exploreStudent")
    public String exploreStudent(HttpSession session,ModelMap modelMap,@RequestParam(value = "sid", required = true) String sid,@RequestParam(value = "sName", required = true) String sName){
        String user = (String)session.getAttribute("user");
        String userType = (String) session.getAttribute("userType");
        System.out.println("hit!");
        System.out.println("user = " + user);
        System.out.println("usertype = " + userType);
        if(user == null  || userType == null){
            session.invalidate();;
            return "redirect:/login";
        }
        else if(userType.equals("admin")){
            String currentAssigned = "currentAssigned";
            String currentUnassigned = "currentUnassigned";
            String FutureAssigned = "FutureAssigned";
            String FutureUnassigned = "FutureUnassigned";
            Long studentId = Long.valueOf(String.valueOf(sid));
            HashMap<String,List<Training>> hm_cuurent = trainingService.findCurrTrainingsAssignedAndNotAssignedToEmployee(studentId);
            List<Training> currentAss = new ArrayList<>();
            List<Training> currentUnass = new ArrayList<>();
            List<Training> FutureAss = new ArrayList<>();
            List<Training> FutureUnass = new ArrayList<>();
            HashMap<String,List<Training>> hm_future = trainingService.findFutureTrainingsAssignedAndNotAssignedToEmployee(studentId);

            if(hm_cuurent.containsKey(currentAssigned)){
                System.out.println("a");
                currentAss = hm_cuurent.get(currentAssigned);
            }
            if(hm_cuurent.containsKey(currentUnassigned)){
                System.out.println("b");

                currentUnass = hm_cuurent.get(currentUnassigned);
            }
            if(hm_future.containsKey(FutureAssigned)){
                System.out.println("c");

                FutureAss = hm_future.get(FutureAssigned);
            }
            if(hm_future.containsKey(FutureUnassigned)){
                System.out.println("d");

                FutureUnass = hm_future.get(FutureUnassigned);
            }
            System.out.println("current assi = " );

            printer(currentAss);
            System.out.println("current unass = " );
            printer(currentUnass);


            System.out.println("fut ass = " + FutureAss);

            printer(FutureAss);
            System.out.println("fut unass = " + FutureUnass );

            printer(FutureUnass);



            modelMap.put(currentAssigned,currentAss);
            modelMap.put(currentUnassigned,currentUnass);

            modelMap.put(FutureAssigned,FutureAss);
            modelMap.put(FutureUnassigned,FutureUnass);

            modelMap.put("eid",sid);
            modelMap.put("name",sName);
            return "AssignTrainingsByAdmin";

        }
        else{
            return "redirect:/badRequest";
        }
    }

    private void printer(List<Training> list){
        for (Training t: list
             ) {
            System.out.println(t.getTopic());
        }
        System.out.println("******");
    }


}
