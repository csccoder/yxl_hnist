package cn.yxl.service;

import cn.yxl.entity.ArticleCategory;
import cn.yxl.entity.QuestionCategory;
import cn.yxl.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/6/19.
 */
public class QuestionCategoryService {
    public List<QuestionCategory> getAll(){
        String sql="select id ,question_category from t_question_category";

        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        connection= DbUtil.getConnection();
        List<QuestionCategory> questionCategories=new ArrayList<QuestionCategory>();
        preparedStatement=DbUtil.getPreparedStatement(connection, sql);
        try {
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                int id = resultSet.getInt(1);
                String categoryName=resultSet.getString(2);
                QuestionCategory questionCategory = new QuestionCategory(id, categoryName);
                questionCategories.add(questionCategory);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
        return questionCategories;

    }
}
