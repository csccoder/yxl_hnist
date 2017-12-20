package cn.yxl.service;

import cn.yxl.entity.*;
import cn.yxl.util.DbUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/6/18.
 */
public class ArticleService {

    public int getArticleCountByUserId(int userId){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        String sql="select count(1) from t_article where article_author_id=?";
        connection= DbUtil.getConnection();
        preparedStatement=DbUtil.getPreparedStatement(connection, sql);
        try {
            preparedStatement.setInt(1,userId);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
        return 0;
    }

    public List<Article> getArticleByUserId(int userId,int curPage,int count){
        String sql="select id,article_title,article_author_id,article_author_name,article_img,article_views,article_praises from t_article where article_author_id=? limit ?,?";

        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        connection= DbUtil.getConnection();
        List<Article> articles=new ArrayList<Article>();
        preparedStatement=DbUtil.getPreparedStatement(connection, sql);
        try {
            preparedStatement.setInt(1,userId);
            int start=(curPage-1)*count;
            preparedStatement.setInt(2,start);
            preparedStatement.setInt(3,count);
            resultSet = preparedStatement.executeQuery();
            articles=resultSet2ArticleList(resultSet);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
        return articles;

    }


    /**
     * 通用转换类 将结果集封装为文章列表
     * @param resultSet
     * @return
     */
    private List<Article> resultSet2ArticleList(ResultSet resultSet){
        List<Article> articles=new ArrayList<Article>();
        try {
            while(resultSet.next()){
                Article article= new Article();
                int id = resultSet.getInt(1);
                String articleTitle=resultSet.getString(2);
                int userId=resultSet.getInt(3);
                String userName=resultSet.getString(4);
                String img=resultSet.getString(5);
                int views=resultSet.getInt(6);
                int praises=resultSet.getInt(7);

                article.setId(id);
                article.setTitle(articleTitle);
                User user = new User();
                user.setId(userId);
                user.setUsername(userName);
                article.setUser(user);
                article.setImg(img);
                article.setViews(views);
                article.setPraises(praises);

                articles.add(article);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return articles;
    }

    /**
     * 获取某个分类下的所有文章
     * @param categoryId  类目id
     * @param num   获取的数量限制
     * @return
     */
    public List<Article> getArticleListByCategoryId(int categoryId,int num){
            Connection connection=null;
            PreparedStatement preparedStatement=null;
            ResultSet resultSet=null;
            String sql=null;
            if(categoryId>0){
                 sql="select id,article_title,article_author_id,article_author_name,article_img,article_views,article_praises from t_article where article_category_id=? order by article_create_time limit ?";
            }else{
                sql= "select id,article_title,article_author_id,article_author_name,article_img,article_views,article_praises from t_article  order by article_create_time limit ?";
            }
            connection= DbUtil.getConnection();
            List<Article> articles=null;
            preparedStatement=DbUtil.getPreparedStatement(connection, sql);
            try {
               if(categoryId>0){
                   preparedStatement.setInt(1,categoryId);
                   preparedStatement.setInt(2,num);
               }else{
                   preparedStatement.setInt(1,num);
               }
                resultSet = preparedStatement.executeQuery();
                articles=resultSet2ArticleList(resultSet);
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }finally{
                DbUtil.closeAll(connection, preparedStatement, resultSet);
            }
            return articles;
    }

    /**
     * 获取所有文章
     * @param num 限制获取的数量
     * @return
     */
    public List<Article> getArticleList(int num){
       return getArticleListByCategoryId(-1,num);
    }


    /**
     * 查询全部。按时间倒序排序
     * @param curPage  当前页
     * @param pageSize  每页记录数
     * @return
     */
    public List<Article> getArticleListByPage(int curPage,int pageSize){
        return getArticleListByPage(curPage,pageSize,0,"article_create_time");
    }
    /**
     * 默认以时间倒序排序。 及查询最新的
     * @param curPage   当前页
     * @param pageSize  每页记录数
     * @param categoryId  类目id
     * @return
     */
    public List<Article> getArticleListByPage(int curPage,int pageSize,int categoryId){
        return getArticleListByPage(curPage,pageSize,categoryId,"article_create_time");
    }

    /**
     * 分页查询文章列表
     * @param curPage  当前页
     * @param pageSize 页大小
     * @param categoryId 类目Id
     * @param orderKey 排序的关键字
     * @return
     */
    public List<Article> getArticleListByPage(int curPage,int pageSize,int categoryId,String orderKey){
        String sql="select id,article_title,article_author_id,article_author_name,article_img,article_views,article_praises from t_article where 1=1";
        if(categoryId>0){
            sql+=" and article_category_id="+categoryId;
        }
        sql+=" order by "+orderKey+" desc";
        int index=(curPage-1)*pageSize;
        sql+=" limit "+index+","+pageSize;

        System.out.println(sql);

        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        connection= DbUtil.getConnection();
        List<Article> articles=new ArrayList<Article>();
        preparedStatement=DbUtil.getPreparedStatement(connection, sql);
        try {

            resultSet = preparedStatement.executeQuery();
            articles=resultSet2ArticleList(resultSet);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
            return articles;

    }

    /**
     * 获取某个分类下文章的总记录数
     * @param categoryId  文章类目id
     * @return
     */
    public int getPageCount(int categoryId){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        String sql=null;
        if(categoryId>0){
             sql="select count(1) from t_article where article_category_id=?";
        }else{
            sql="select count(1) from t_article";
        }
        connection= DbUtil.getConnection();
        preparedStatement=DbUtil.getPreparedStatement(connection, sql);
        try {
            if(categoryId>0){
                preparedStatement.setInt(1,categoryId);
            }
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
               return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
        return 0;
    }

    /**
     * 根据文章id获取文章的详细信息
     * @param id
     * @return
     */
    public Article getArticleById(int id){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        String sql="select " +
                "a.id," +
                "article_title," +
                "article_category_id," +
                "article_category_name," +
                "article_author_id," +
                "article_author_name," +
                "article_content," +
                "article_img," +
                "article_views," +
                "article_comments," +
                "article_praises," +
                "article_create_time" +
                " from t_article a,t_article_category b where a.id=? and a.article_category_id=b.id";

        connection= DbUtil.getConnection();
        Article article = new Article();
        preparedStatement=DbUtil.getPreparedStatement(connection, sql);
        try {
            preparedStatement.setInt(1,id);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                id = resultSet.getInt(1);
                String articleTitle=resultSet.getString(2);
                int categoryId=resultSet.getInt(3);
                String categoryName=resultSet.getString(4);
                int userId=resultSet.getInt(5);
                String userName=resultSet.getString(6);
                String content=resultSet.getString(7);
                String img=resultSet.getString(8);
                int views=resultSet.getInt(9);
                int comments=resultSet.getInt(10);
                int praises=resultSet.getInt(11);
                Timestamp createTime=resultSet.getTimestamp(12);

                article.setId(id);
                article.setTitle(articleTitle);
                ArticleCategory articleCategory = new ArticleCategory(categoryId, categoryName);
                article.setCatergory(articleCategory);
                User user = new User();
                user.setId(userId);
                user.setUsername(userName);
                article.setUser(user);
                article.setContent(content);
                article.setImg(img);
                article.setViews(views);
                article.setComments(comments);
                article.setPraises(praises);
                article.setCreateTime(createTime);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
        return article;
    }


    /**
     * 增加某篇文章的访问量
     * @param id
     */
    public void addViewsById(int id){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        String sql="update t_article set article_views=article_views+1 where id=?";

        connection= DbUtil.getConnection();
        preparedStatement=DbUtil.getPreparedStatement(connection, sql);
        try {
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }

    }



}
