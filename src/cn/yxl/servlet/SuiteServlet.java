package cn.yxl.servlet;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.yxl.entity.*;
import cn.yxl.service.SuiteService;

/**
 * Servlet implementation class TmoduleServlet
 */
public class SuiteServlet extends HttpServlet {
    SuiteService suiteService = new SuiteService();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String location="";
        String action = req.getParameter("action");
        if(isNULL(action)||"list".equals(action)){//查询所有的测试
            String moduleId = req.getParameter("moduleId");
            if(isNULL(moduleId)){
                moduleId="";
            }
            List<Category> moduleList = suiteService.getModuleList();
            List<Suite> hotSuiteList = suiteService.getHotSuiteList(moduleId,3);
            List<Suite> suitList = suiteService.getSuiteListByModuleId(moduleId,10);
            req.setAttribute("moduleList",moduleList );
            req.setAttribute("hotSuiteList",hotSuiteList );
            req.setAttribute("suiteList", suitList);

            location="/module/ceshi/ceshiList.jsp";
        }else if("info".equals(action)){//查询具体的测试信息
            String suiteId = req.getParameter("id");
            Suite suite = suiteService.getSuiteById(suiteId);
            req.setAttribute("suite",suite);

            location="/module/ceshi/ceshi_info.jsp";
        }else if("start".equals(action)){//开始测试 查询测试相关的题目和选项 并转发到测试页面
            //查询具体的测试信息
            String suiteId = req.getParameter("id");
            Suite suite = suiteService.getSuiteById(suiteId);
            //查询测试相关的所有题目
            List<SuiteQuestion> questions = suiteService.getQuestions(suiteId);
            //查询每个题目的所有选项
            for(int i=0,size=questions.size();i<size;i++){
                SuiteQuestion question = questions.get(i);
                //获取每个题目的所有选项
                List<Option> options = suiteService.getOptions(question.getQuestionCode());
                //把选项设置到question中
                question.setOptions(options);
            }

            //把问题设置到测试suite中
            suite.setSuiteQuestions(questions);

            //把问题保存到域中
            req.setAttribute("suite",suite);
            //转发到ceshi.jsp
            location="/module/ceshi/ceshi.jsp";
        }else if("done".equals(action)){//提交测试，获取测试结果
            int score=0;
            Enumeration<String> parameterNames = req.getParameterNames();
            Map<String,String> map=new HashMap<String,String>();
            String suiteCode = req.getParameter("suiteId");
            while(parameterNames.hasMoreElements()){
                String parameterName = parameterNames.nextElement();
                if(parameterName.startsWith("Q")){
                    System.out.println(parameterName+" "+req.getParameter(parameterName));
                    String optionId=req.getParameter(parameterName);
                    score+=suiteService.selectScoreByOptionId(optionId);
                    map.put(parameterName,req.getParameter(parameterName));
                }
            }
            //根据分数查出对应的结果
            Result result = suiteService.getSuiteResult(score, suiteCode);
            req.setAttribute("result",result);
            System.out.println(result);
            location="/module/ceshi/ceshi_result.jsp";

        }
        req.getRequestDispatcher(location).forward(req,resp);
    }
    public boolean isNULL(String str){
        if(str==null||"".equals(str)){
            return true;
        }
        return false;
    }
}
