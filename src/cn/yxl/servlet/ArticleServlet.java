package cn.yxl.servlet;

import cn.yxl.entity.Article;
import cn.yxl.entity.ArticleCategory;
import cn.yxl.entity.PageTool;
import cn.yxl.service.ArticleCategoryService;
import cn.yxl.service.ArticleService;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ArticleServlet extends HttpServlet{

	private ArticleService articleService=new ArticleService();
	private ArticleCategoryService articleCategoryService=new ArticleCategoryService();
	private ObjectMapper objectMapper=new ObjectMapper();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action=req.getParameter("action");

		if(isNull(action)||"list".equals(action)) {//查询文章列表
			selectArcileList(req,resp);
		}else if("info".equals(action)){	//查询文章信息
			selectArticleInfo(req,resp);
		}else if("selectUserArticles".equals(action)){//查询用户的文章数据
			String userId = req.getParameter("userId");
			if(isNull(userId)){	//id为空 跳转到错误页面
				req.setAttribute("msg","存在非法操作");
				req.getRequestDispatcher("/error.jsp").forward(req,resp);
			}else{
				String curPage=req.getParameter("curPage");
				String pageSize=req.getParameter("pageSize");
				if(isNull(curPage)){
					curPage="1";
				}
				if(isNull(pageSize)){
					pageSize="5";
				}
				List<Article> articles = articleService.getArticleByUserId(Integer.parseInt(userId), Integer.parseInt(curPage), Integer.parseInt(pageSize));
				int counts = articleService.getArticleCountByUserId(Integer.parseInt(userId));
				PageTool<Article> pageTool = new PageTool<Article>();
				pageTool.setCount(counts);
				pageTool.setCurPage(Integer.parseInt(curPage));
				pageTool.setPageSize(5);
				pageTool.setContents(articles);

				String json = objectMapper.writeValueAsString(pageTool);
				resp.setCharacterEncoding("utf-8");
				resp.setContentType("application/json");
				resp.getWriter().write(json);
			}

		}
	}

	public void selectArticleInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		if(id!=null&&!"".equals(id)) {//查询具体文章
			//增加访问量
			articleService.addViewsById(Integer.parseInt(id));
			//查询具体的文章信息
			Article article = articleService.getArticleById(Integer.parseInt(id));
			req.setAttribute("article", article);
			req.getRequestDispatcher("module/article/article.jsp").forward(req, resp);
		}
	}

	/**
	 * 查询文章列表
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void selectArcileList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String curPage = req.getParameter("curPage");
		String pageSize=req.getParameter("pageSize");
		if(curPage==null||"".equals(curPage)){
			curPage="1";
		}
		if(pageSize==null||"".equals(pageSize)){
			pageSize="10";
		}
		String orderKey=req.getParameter("orderKey");
		String categoryId=req.getParameter("categoryId");
		if(orderKey==null||"".equals(orderKey)){
			orderKey="article_views";
		}
		if(categoryId==null||"".equals(categoryId)){
			categoryId="0";
		}

		//带条件的分页文章查询
		List<Article> articles = articleService.getArticleListByPage(Integer.parseInt(curPage), Integer.parseInt(pageSize), Integer.parseInt(categoryId), orderKey);
		//查询文章的所有类目
		List<ArticleCategory> articleCategories = articleCategoryService.getAll();
		//把默认的"全部"类型加入集合，方面jsp页面操作
		articleCategories.add(0,new ArticleCategory(0,"全部"));

		//封装分页助手工具类
		PageTool<Article> pageTool = new PageTool<>();
		pageTool.setCurPage(Integer.parseInt(curPage));
		pageTool.setPageSize(10);
		pageTool.setCount(articleService.getPageCount(Integer.parseInt(categoryId)));
		pageTool.setContents(articles);

		//保存从数据库查询出的数据到request域中
		req.setAttribute("pageTool",pageTool);
		req.setAttribute("articleCategories",articleCategories);

		//请求参数回显
		req.setAttribute("categoryId",categoryId);
		req.setAttribute("orderKey",orderKey);

		req.getRequestDispatcher("module/article/article_list.jsp").forward(req,resp);
	}

	public boolean isNull(String str){
		if(str==null||"".equals(str.trim())){
			return true;
		}else{
			return false;
		}
	}
}
