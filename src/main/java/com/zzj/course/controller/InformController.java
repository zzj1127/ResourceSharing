package com.zzj.course.controller;

import com.zzj.course.model.Inform;
import com.zzj.course.service.InformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class InformController {
    @Autowired
    InformService informService;
    @RequestMapping("/tome")
    public String tome(Model model){
       List<Inform> informList=informService.selectAllInform();
        model.addAttribute("informList",informList);
        return "/phonehtml/our";
    }
    @RequestMapping("/findAllInformPh")
    public String findAllInformPh(int infid, Model model){

        List<Inform> inform1=informService.findAllInformPh(infid);
        List<Inform> informList=informService.selectAllInform();
        model.addAttribute("informList",informList);
        model.addAttribute("inform1",inform1);

        return "/phonehtml/inform";
    }
    @RequestMapping("/seacherinfA")
    public @ResponseBody
    List<Inform> seacherinfA(){
        List<Inform> informList=informService.selectAllInform();
        return informList;
    }
    @RequestMapping("/seacherInfP")
    public @ResponseBody
    List<Inform> seacherInfP(){
        List<Inform> informList=informService.selectInformByosition();
        return informList;
    }
    @RequestMapping("/seacherInfS")
    public @ResponseBody
    List<Inform> seacherInfS(){
        List<Inform> informList=informService.selectInformByStates();
        return informList;
    }
}
