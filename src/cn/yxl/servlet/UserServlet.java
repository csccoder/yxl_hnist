package cn.yxl.servlet;

import cn.yxl.entity.User;
import cn.yxl.service.ArticleService;
import cn.yxl.service.QuestionService;
import cn.yxl.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Administrator on 2017/6/20.
 */
public class UserServlet extends HttpServlet {


    private UserService userService=new UserService();
    private ArticleService articleService=new ArticleService();
    private QuestionService questionService=new QuestionService();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        String action = req.getParameter("action");
        if(!isNull(action)){
            if("login".equals(action)){
                login(req,resp);
            }else if("register".equals(action)){
                register(req,resp);
            }else if("logout".equals(action)){
                logout(req,resp);
            }else if("info".equals(action)){
                int id=0;
                //如果id为空，看session中是否保存用户信息

                if(isNull(req.getParameter("id"))){
                    HttpSession session = req.getSession(false);
                    if(session!=null){
                        User user = (User) session.getAttribute("user");
                        if(user!=null){
                            id=user.getId();
                        }
                    }

                }else{
                    id=Integer.parseInt(req.getParameter("id"));
                }

                if(id==0){
                    req.setAttribute("msg","存在非法操作");
                    req.getRequestDispatcher("/error.jsp").forward(req,resp);
                    return;
                }
                User user=userService.getUserDetailInfo(id);
                int articlesCount = articleService.getArticleCountByUserId(id);
                int questionsCount = questionService.getQuestionCountByUserId(id);
                int answersCount = questionService.getAnswersCountByUserId(id);

                req.setAttribute("userDetailInfo",user);
                req.setAttribute("articlesCount",articlesCount);
                req.setAttribute("questionsCount",questionsCount);
                req.setAttribute("answersCount",answersCount);
                req.getRequestDispatcher("/module/user/user_info.jsp").forward(req,resp);
            }
        }
    }

    public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name=req.getParameter("username");
        String psd=req.getParameter("password");

        //boolean flag=us.login(name,psd);
        User user = userService.getuser(name, psd);

        String page;
        if (null != user) {
            req.getSession().setAttribute("user", user);
            page="/index.do";
        } else {
            page="/login.jsp";
        }
        resp.sendRedirect(req.getContextPath()+page);
    }

    public void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //删除掉session中的用户信息
        HttpSession session = req.getSession();
        session.removeAttribute("user");

        //跳转到登录页面
        resp.sendRedirect(req.getContextPath()+"/login.jsp");
    }

    public void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String pwd = req.getParameter("password");
        int age = Integer.parseInt(req.getParameter("age"));
        String sex = req.getParameter("sex");
        String img = req.getParameter("img");

        User user=new User();
        user.setUsername(username);
        user.setPassword(pwd);
        user.setSex(sex);
        user.setAge(age);
        user.setImg(img);


        userService.addUser(user);
        //把注册的用户信息保存到session
        req.getSession().setAttribute("user",user);
        //跳转到首页
        resp.sendRedirect(req.getContextPath()+"/index.do");
    }

    public boolean isNull(String str){
        if(str==null||"".equals(str.trim())){
            return true;
        }else{
            return false;
        }
    }


}
