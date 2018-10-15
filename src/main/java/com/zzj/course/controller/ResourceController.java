package com.zzj.course.controller;

import com.zzj.course.model.*;
import com.zzj.course.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class ResourceController {
    @Autowired
    ResourceService resourceService;
    @Autowired
    TypeService typeService;
    @Autowired
    TypeOfNameService typeOfNameService;
    @Autowired
    UserService userService;
    @Autowired
    CommentService commentService;
    @RequestMapping("/resourceList")
    public String resourceList(Model model ) {
        List<Resources> resourceList=resourceService.findAllResource();
        List<Type> typeList=typeService.findAllType();
        List<TypeOfName> typeOfNames=typeOfNameService.findAllTON();
        model.addAttribute("typeList", typeList);
        model.addAttribute("typeOfNames", typeOfNames);
        model.addAttribute("resourceList",resourceList);

        return "resource/re-index";
    }
    @RequestMapping("/selectAllPh")
    public @ResponseBody
    List<Resources> selectAllPh(){
        List<Resources> resourcesList=resourceService.findAllResource();
        return resourcesList;
    }
    @RequestMapping("findAllResources")
    public String findResourcesById(Model model,String reid){

        Resources resources1=resourceService.findResourceById(reid);
        User user2=userService.userSelectById(resources1.getUserid());
        List<Type> typeList=typeService.findAllType();

        List<TypeOfName> typeOfNames=typeOfNameService.findAllTON();
        List<Comment> commentList=commentService.findCommendById(reid);

        model.addAttribute("typeList", typeList);
        model.addAttribute("typeOfNames", typeOfNames);
        model.addAttribute("resources1",resources1);
        model.addAttribute("user2",user2);
        model.addAttribute("commentList",commentList);


        return "resource/re-detail";
    }
    @RequestMapping("findAllResourcesPh")
    public String findResourcesByIdPh(Model model,String reid){

        Resources resources2=resourceService.findResourceById(reid);

        List<Resources> resourceList=resourceService.findAllResource();
        User user2=userService.userSelectById(resources2.getUserid());
        List<Type> typeList=typeService.findAllType();
        List<TypeOfName> typeOfNames=typeOfNameService.findAllTON();
        List<Comment> commentList=commentService.findCommendById(reid);
        model.addAttribute("resourceList", resourceList);
        model.addAttribute("typeList", typeList);
        model.addAttribute("typeOfNames", typeOfNames);
        model.addAttribute("resources2",resources2);
        model.addAttribute("user2",user2);
        model.addAttribute("commentList",commentList);


        return "/phonehtml/zhengwen";
    }

    @RequestMapping("/addComment")
    public String addComment(Comment comment, String reid, String userId, Model model){

        comment.setCommenttime(new Timestamp(new Date().getTime()));
        comment.setUserid(userId);
        comment.setReid(reid);
        commentService.addComment(comment);
       return findResourcesById(model,reid);
    }

    @RequestMapping("/addCommentPh")
    public String addCommentPh(Comment comment, String reid, String userId, Model model){

        comment.setCommenttime(new Timestamp(new Date().getTime()));
        comment.setUserid(userId);
        comment.setReid(reid);
        commentService.addComment(comment);
        return findResourcesByIdPh(model,reid);
    }

    @RequestMapping("/selectTonById")
    public String selectTonById(String typeofnameid,Model model){
        List<Resources> resources=resourceService.selectTonById(typeofnameid);
        model.addAttribute("resources",resources);
        return "resource/re-ton";
    }
    @RequestMapping("/selectTonByIdPh")
    public @ResponseBody
    List<Resources> selectTonByIdPh(String typeofnameid){
        List<Resources> resourcesList=resourceService.selectTonById(typeofnameid);
      return resourcesList;
    }

    @RequestMapping("/selectTypeId")
    public  String selectTypeId(String typeid,Model model){
        List<Resources> resources=resourceService.selectTypeId(typeid);
        List<TypeOfName> typeOfNames=typeOfNameService.selectTonById(typeid);
        model.addAttribute("resources",resources);
        model.addAttribute("typeOfNames",typeOfNames);
        return "resource/re-type";
    }

    @RequestMapping("/selectTypeIdPh")
    public @ResponseBody
    List<Resources> selectTypeIdPh(String typeid){
        List<Resources> resourcesList=resourceService.selectTypeId(typeid);
        return resourcesList;
    }
    @RequestMapping("/addresource")
    public String addresource(Model model){
        List<Type> typeList=typeService.findAllType();
        List<TypeOfName> typeOfNames=typeOfNameService.findAllTON();
        model.addAttribute("typeList", typeList);
        model.addAttribute("typeOfNames", typeOfNames);
        return "user/user-provide";
    }
    @RequestMapping("/toAddResourceOfUser")
    public String toAddResourceOfUser(Resources resources2 , MultipartFile file, Model model)throws IOException {
        //获取原来文件名
        String oldname = file.getOriginalFilename();
        //取随机名
        String newsstring = UUID.randomUUID().toString().replace("-", "");
        //获取文件格式
        String fix = oldname.substring(oldname.indexOf("."));
        //组成新的文件名
        String newName = newsstring + fix;

        //保持图片到本地图片服务器
        file.transferTo(new File("C:/resourcesImg/" + newName));
        resources2.setReimg(newName);

     resourceService.addResource(resources2);
        model.addAttribute("msg","感谢你的分享");
          return addresource(model);
    }
    @RequestMapping("/toSeacher")
    public String toSearcher(String seacher,Model model){

        List<Resources> resources=resourceService.findAllResourceBySeacher(seacher);
        List<Type> typeList=typeService.findAllType();
        List<TypeOfName> typeOfNames=typeOfNameService.findAllTON();
        model.addAttribute("resources", resources);
        model.addAttribute("typeList", typeList);
        model.addAttribute("typeOfNames", typeOfNames);
        return "resource/re-seacher";
    }
    @RequestMapping("/toSeacherPh")
    public String toSearcherPh(String seacher,Model model){

        List<Resources> resourceList=resourceService.findAllResourceBySeacher(seacher);
        List<Type> typeList=typeService.findAllType();
        List<TypeOfName> typeOfNames=typeOfNameService.findAllTON();
        model.addAttribute("resourceList",resourceList);
        model.addAttribute("typeList", typeList);
        model.addAttribute("typeOfNames", typeOfNames);
        return "/phonehtml/index";
    }
    @RequestMapping("/tofindResourcesByUseridPh")
    public String findResourcesByUseridPh(String userid, Model model){

        List<Resources> resourceList=resourceService.findResourcesByUseridPh(userid);
        model.addAttribute("resourceList",resourceList);

        return "/phonehtml/myself";
    }
    @RequestMapping("/tofind")
    public String find(Model model){
        List<Type> typeList=typeService.findAllType();
        List<TypeOfName> typeOfNames=typeOfNameService.findAllTON();
        model.addAttribute("typeList", typeList);
        model.addAttribute("typeOfNames", typeOfNames);
        return "/phonehtml/provide";
    }
    @RequestMapping("/toAddResourcePh")
    public String toAddResourcePh(Resources resources2 , MultipartFile file, Model model, HttpServletResponse response)throws IOException {
        //获取原来文件名
        String oldname = file.getOriginalFilename();
        //取随机名
        String newsstring = UUID.randomUUID().toString().replace("-", "");
        //获取文件格式
        String fix = oldname.substring(oldname.indexOf("."));
        //组成新的文件名
        String newName = newsstring + fix;

        //保持图片到本地图片服务器
        file.transferTo(new File("C:/resourcesImg/" + newName));
        resources2.setReimg(newName);


        return find(model);
    }
}
