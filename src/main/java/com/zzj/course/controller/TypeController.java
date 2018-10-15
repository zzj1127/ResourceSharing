package com.zzj.course.controller;

import com.zzj.course.model.Resources;
import com.zzj.course.model.Type;
import com.zzj.course.model.TypeOfName;
import com.zzj.course.service.ResourceService;
import com.zzj.course.service.TypeOfNameService;
import com.zzj.course.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class TypeController {
@Autowired
    TypeService typeService;
@Autowired
TypeOfNameService typeOfNameService;
@Autowired
    ResourceService resourceService;
//查询分类、具体分类、列表
@RequestMapping("/typeList")
   public String typeList(Model model ){
   List<Type> typeList=typeService.findAllType();
   List<TypeOfName> typeOfNames=typeOfNameService.findAllTON();



       model.addAttribute("typeList", typeList);
       model.addAttribute("typeOfNames", typeOfNames);
       return "header/head";
}
    @RequestMapping("/typeListPh")
    public String typeListPh(Model model ){
        List<Type> typeList=typeService.findAllType();
        List<TypeOfName> typeOfNames=typeOfNameService.findAllTON();


        List<Resources> resourceList=resourceService.findAllResource();
        model.addAttribute("resourceList",resourceList);
        model.addAttribute("typeList", typeList);
        model.addAttribute("typeOfNames", typeOfNames);
        return "/phonehtml/index";
    }
}
