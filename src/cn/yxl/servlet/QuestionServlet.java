package cn.yxl.servlet;

import cn.yxl.entity.*;
import cn.yxl.service.QuestionCategoryService;
import cn.yxl.service.QuestionService;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/6/19.
 */
public class QuestionServlet  extends HttpServlet{

    private QuestionCategoryService questionCategoryService=new QuestionCategoryService();
    private QuestionService questionService=new QuestionService();
    private ObjectMapper objectMapper=new ObjectMapper();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        //接收动作类型参数
        String action = req.getParameter("action");
        //判断动作类型
        if (isNull(action) || "list".equals(action)) {//查询问题列表，并转发到问题列表页面
            selectQuestionList(req, resp);
        } else if ("info".equals(action)) {//查询具体问题，并转发到问题详细页面
            selectQuestionInfo(req, resp);
        } else if ("goAdd".equals(action)) {//查询问题类目列表，并转发到页面
            req.setAttribute("questionCategories", questionCategoryService.getAll());
            req.getRequestDispatcher("/module/question/question_add.jsp").forward(req, resp);
        } else if ("addQuestion".equals(action)) {//提交问题，并转发到问题详细页
            saveQuestion(req, resp);
        } else if ("addComment".equals(action)) {
            addComment(req, resp);
        } else if ("selectQuestionsByUserId".equals(action)) {
            String userId = req.getParameter("userId");
            if (isNull(userId)) {    //id为空 跳转到错误页面
                req.setAttribute("msg", "存在非法操作");
                req.getRequestDispatcher("/error.jsp").forward(req, resp);
            } else {
                String curPage = req.getParameter("curPage");
                String pageSize = req.getParameter("pageSize");
                if (isNull(curPage)) {
                    curPage = "1";
                }
                if (isNull(pageSize)) {
                    pageSize = "5";
                }
                List<Question> questions = questionService.getQuestionsByUserId(Integer.parseInt(userId), Integer.parseInt(curPage), Integer.parseInt(pageSize));
                int counts = questionService.getQuestionCountByUserId(Integer.parseInt(userId));
                PageTool<Question> pageTool = new PageTool<Question>();
                pageTool.setCount(counts);
                pageTool.setCurPage(Integer.parseInt(curPage));
                pageTool.setPageSize(5);
                pageTool.setContents(questions);

                String json = objectMapper.writeValueAsString(pageTool);
                resp.setCharacterEncoding("utf-8");
                resp.setContentType("application/json");
                resp.getWriter().write(json);
            }
        }else if ("selectAnswersByUserId".equals(action)) {
            String userId = req.getParameter("userId");
            if (isNull(userId)) {    //id为空 跳转到错误页面
                req.setAttribute("msg", "存在非法操作");
                req.getRequestDispatcher("/error.jsp").forward(req, resp);
            } else {
                String curPage = req.getParameter("curPage");
                String pageSize = req.getParameter("pageSize");
                if (isNull(curPage)) {
                    curPage = "1";
                }
                if (isNull(pageSize)) {
                    pageSize = "5";
                }
                List<Answer> answers = questionService.getAnswersByUserIdAndQuestionId(Integer.parseInt(userId), Integer.parseInt(curPage), Integer.parseInt(pageSize));
                int counts = questionService.getAnswersCountByUserId(Integer.parseInt(userId));
                PageTool<Answer> pageTool = new PageTool<Answer>();
                pageTool.setCount(counts);
                pageTool.setCurPage(Integer.parseInt(curPage));
                pageTool.setPageSize(5);
                pageTool.setContents(answers);

                String json = objectMapper.writeValueAsString(pageTool);
                resp.setCharacterEncoding("utf-8");
                resp.setContentType("application/json");
                resp.getWriter().write(json);
            }
        }
    }

    public void addComment(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String userId=req.getParameter("userId");
        String content=req.getParameter("content");
        Answer answer = new Answer();
        Question question = new Question();
        question.setId(Integer.parseInt(id));
        answer.setQuestion(question);
        User user = new User();
        user.setId(Integer.parseInt(userId));
        answer.setUser(user);
        answer.setAnswerContent(content);
        answer.setCreateTime(new Timestamp(new Date().getTime()));

        questionService.addComment(answer);
        //重定向到详细问题页面
        resp.sendRedirect(req.getContextPath()+"/questionServlet?action=info&id="+id);


    }

    public void saveQuestion(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //组装参数
        Question question = new Question();
        question.setName(req.getParameter("name"));
        question.setContent(req.getParameter("content"));
        question.setCategory(new QuestionCategory(Integer.parseInt(req.getParameter("categoryId")),null));
        question.setUser(new User(Integer.parseInt(req.getParameter("userId")),req.getParameter("userName")));
        question.setCreateTime(new Timestamp(new Date().getTime()));
        question.setFlag(0);
        //调用service方法保存问题,并返回保存后的自动生成的id
        int questionId=questionService.saveQuestion(question);

        //跳转到问题id的详细页面
        resp.sendRedirect(req.getContextPath()+"/questionServlet?action=info&id="+questionId);
    }

    public void selectQuestionInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if(!isNull(id)){
            //查询问题详细信息
            Question question = questionService.getQuesitonById(Integer.parseInt(id));
            //查询问题的所有评论
            List<Answer> answers = questionService.getAnswerListByQuestionId(Integer.parseInt(id));
            question.setAnswers(answers);
            
            //查询问题分类
            List<QuestionCategory> questionCategories = questionCategoryService.getAll();

            req.setAttribute("question",question);
            req.setAttribute("questionCategories",questionCategories);
            req.getRequestDispatcher("/module/question/question.jsp").forward(req,resp);
        }
    }

    public void selectQuestionList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryId = req.getParameter("categoryId");
        String curPage = req.getParameter("curPage");
        String pageSize = req.getParameter("pageSize");
        String flag=req.getParameter("flag");
        //参数校验
        if(isNull(categoryId)){
            categoryId="0";
        }
        if(isNull((curPage))){
            curPage="1";
        }
        if(isNull((pageSize))){
            pageSize="10";
        }
        if(isNull(flag)){
            flag="-1";
        }

        //查询推荐问题
        List<Question> hotQuestions = questionService.getHotQuestion();

        //带条件的分页查询
        List<Question> questionList = questionService.getQuestionList(Integer.parseInt(flag), Integer.parseInt(categoryId), Integer.parseInt(curPage), Integer.parseInt(pageSize));

        //查询所有的问题分类
        List<QuestionCategory> questionCategories = questionCategoryService.getAll();
        questionCategories.add(0,new QuestionCategory(0,"全部"));



        PageTool<Question> pageTool = new PageTool<Question>();
        pageTool.setCurPage(Integer.parseInt(curPage));
        pageTool.setCount(questionService.getCountByCondition(Integer.parseInt(flag),Integer.parseInt(categoryId)));
        pageTool.setPageSize(10);
        pageTool.setContents(questionList);

        req.setAttribute("pageTool",pageTool);
        req.setAttribute("questionCategories",questionCategories);
        req.setAttribute("hotQuestions",hotQuestions);

        //参数回显
        req.setAttribute("categoryId",categoryId);
        req.setAttribute("flag",flag);

        req.getRequestDispatcher("/module/question/question_list.jsp").forward(req,resp);
    }


    public boolean isNull(String str){
        if(str==null||"".equals(str.trim())){
            return true;
        }else{
            return false;
        }
    }
}
