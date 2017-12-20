package cn.yxl.service;

import cn.yxl.entity.Article;
import cn.yxl.entity.ArticleCategory;
import cn.yxl.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/6/18.
 */
public class ArticleCategoryService {
    public List<ArticleCategory> getAll(){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        String sql="select * from t_article_category";
        connection= DbUtil.getConnection();
        List<ArticleCategory> articleCategories=new ArrayList<ArticleCategory>();
        preparedStatement=DbUtil.getPreparedStatement(connection, sql);
        try {
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                ArticleCategory articleCategory= new ArticleCategory();
                int id = resultSet.getInt(1);
                String categoryName = resultSet.getString(2);
                articleCategory.setId(id);
                articleCategory.setCategoryName(categoryName);
                articleCategories.add(articleCategory);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
        return articleCategories;
    }

}
