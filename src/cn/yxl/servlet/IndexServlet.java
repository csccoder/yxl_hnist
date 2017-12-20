package cn.yxl.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.yxl.entity.*;
import cn.yxl.service.ArticleCategoryService;
import cn.yxl.service.ArticleService;
import cn.yxl.service.QuestionService;
import cn.yxl.service.SuiteService;
import cn.yxl.service.index.IndexService;

public class IndexServlet extends HttpServlet{
	
	private IndexService indexService=new IndexService();
	private ArticleCategoryService articleCategoryService=new ArticleCategoryService();
	private ArticleService articleService=new ArticleService();
	private QuestionService questionService = new QuestionService();
	private SuiteService suiteService=new SuiteService();


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException ,IOException {

		//查询轮播图文章数据
		List<Article> indexSlides = indexService.getIndexSlides();

		//获取每周热文
		List<Article> recentWeekArticles = indexService.getRecentWeekArticles(5);

		//查询所有文章分类
		List<ArticleCategory> articleCategories=articleCategoryService.getAll();

		Map<ArticleCategory,List<Article>> articles=new LinkedHashMap<ArticleCategory,List<Article>>();
		//查询全部分类中最新的文章，并指定文章的数目
		articles.put(new ArticleCategory(0,"全部"),articleService.getArticleList(6));
		List<Article> articleList=null;
		//查询每个分类下的最新文章，并指定查询的数目
		for(int i=0,size=articleCategories.size();i<size;i++){
			ArticleCategory articleCategory = articleCategories.get(i);
			articleList = articleService.getArticleListByCategoryId(articleCategory.getId(), 6);
			articles.put(articleCategory,articleList);
		}

		//查询热门的问题  回复量最高，提问时间最新的排序
		List<Question> questions=indexService.getHotQuestion(8);

		//查询热门测试
		List<Suite> suites=suiteService.getHotSuiteList(3);

		//查每个问题最新的一条回答记录
		for(int i=0,size=questions.size();i<size;i++){
			/*Question question = questions.get(i);
			ArrayList<Answer> answers = new ArrayList<>();
			answers.add(indexService)*/
			System.out.println(questions.get(i));
		}


		req.setAttribute("indexSlides", indexSlides);
		req.setAttribute("recentWeekArticles",recentWeekArticles);
		req.setAttribute("articleCategories",articleCategories);
		req.setAttribute("hotSuiteList",suites);
		req.setAttribute("articles",articles);
		req.setAttribute("questions",questions);
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	};
}
