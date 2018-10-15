package com.zzj.course.controller;

import com.zzj.course.model.User;
import com.zzj.course.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

@Controller
public class UserController {
    @Autowired
    UserService userService;
    //登录
    @RequestMapping("/login")
    public String login(User user, Model model, HttpServletRequest request){
       User user1=userService.userLogin(user);

        if (user1!=null)
        {
            if ((user1.getUserState())==0||(user1.getUserState())==2||(user1.getUserState())==3){
            //user1.userImg = "111.img";
            request.getSession().setAttribute("user1",user1);

            return "index";
            }
           else if((user1.getUserState())==1)
           {
               request.getSession().setAttribute("user2",user);
               model.addAttribute("msg","正在审核。。");
               return "/login/login";
           }
           else {
                request.getSession().setAttribute("user2",user);
                model.addAttribute("msg","审核不通过，请联系管理员");
                return "/login/login";
            }
        }
        else{
            model.addAttribute("msg","密码错误或账户不存在");
            return "/login/login";
        }

    }
    @RequestMapping("/logining")
    public @ResponseBody
    int logining(User user, String username,String password,Model model,HttpServletRequest request){
        user.setPassword(password);
        user.setUsername(username);

        int flag=0;
        User user1=userService.userLogin(user);
        if(user1!=null)
        {
            if ((user1.getUserState())==0||(user1.getUserState())==2||(user1.getUserState())==3) {
                request.getSession().setAttribute("user1",user1);
                flag = 1;
            }
            else if((user1.getUserState())==1)
            {
                flag =2;
            }
           else {
                flag =3;
            }
        }



        return flag;
    }
    //退出
    @RequestMapping("/exit")
    public String exit(HttpServletRequest request){
        request.getSession().invalidate();
        return "index";
    }
    //注册
    @RequestMapping("/register")
    public String register(User user2, Model model ,MultipartFile file,HttpServletRequest request )throws IOException {
       //获取原来文件名
           String oldname = file.getOriginalFilename();


           //取随机名
           String newsstring = UUID.randomUUID().toString().replace("-", "");
           //获取文件格式
           String fix = oldname.substring(oldname.indexOf("."));
           //组成新的文件名
           String newName = newsstring + fix;

           //保持图片到本地图片服务器
           file.transferTo(new File("C:/ImgServer/" + newName));

           user2.setUserimg(newName);



        userService.register(user2);
        request.getSession().setAttribute("user2",user2);

        model.addAttribute("msg","您的账号"+user2.getUsername()+"注册成功");

        return "/login/login";

    }
    //检查用户名时候存在
    @RequestMapping("/checkUserNameExit")
    public @ResponseBody
    int checkUserNameExit(String username,Model model){
        int flag=0;
        User user = userService.findUserByName(username);
        if(user!=null)
        {
            flag=1;

        }


        return flag;
    }
    //个人信息-查询个人id
    @RequestMapping("/selectuser")
    public String selsctuser( Model model, String userId) {

        User user1=userService.userSelectById(userId);
        model.addAttribute("user1",user1);
        return "/user/user-information";
    }
    @RequestMapping("/changeUserInformation")
    public String changeInformation(Model model,User user,MultipartFile file,HttpServletRequest request)throws IOException {
        String oldname = file.getOriginalFilename();
        System.out.println(oldname);
            //取随机名
            String newsstring = UUID.randomUUID().toString().replace("-", "");
            //获取文件格式
            String fix = oldname.substring(oldname.indexOf("."));
            //组成新的文件名
            String newName = newsstring + fix;
            user.setUserimg(newName);
            //保存图片到本地图片服务器
            file.transferTo(new File("C:/ImgServer/" + newName));
            userService.changeInformation(user);
            model.addAttribute("msg", "成功");
            return selsctuser(model, user.getUserId());
    }
    @RequestMapping("/changeUserInformation2")
    public String changeInformation2(User user,Model model){
        User user2=userService.userSelectById(user.getUserId());
        System.out.println(user2.getUserimg());
        user.setUserimg(user2.getUserimg());
        userService.changeInformation(user);
        model.addAttribute("msg", "成功");
        return selsctuser(model, user.getUserId());

    }
    @RequestMapping("/reset")
    public String reset(User user,Model model){
        userService.resetpassword(user);
        model.addAttribute("msg", "密码修改成功");
        return "login/login";
    }




}
