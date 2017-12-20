package cn.yxl.service.index;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.yxl.entity.Answer;
import cn.yxl.entity.Article;
import cn.yxl.entity.Question;
import cn.yxl.entity.User;
import cn.yxl.util.DbUtil;

public class IndexService {

    public List<Article> getIndexSlides() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "select * from t_index_slide order by id  desc limit 5";
        connection = DbUtil.getConnection();
        List<Article> indexSlides = new ArrayList<Article>();
        preparedStatement = DbUtil.getPreparedStatement(connection, sql);
        try {
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Article article = new Article();
                int id = resultSet.getInt(1);
                int articleId = resultSet.getInt(2);
                String articleTitle = resultSet.getString(3);
                String articleImg = resultSet.getString(4);
                article.setId(articleId);
                article.setTitle(articleTitle);
                article.setImg(articleImg);
                indexSlides.add(article);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
        return indexSlides;
    }


    public List<Article> getRecentWeekArticles(int limit) {
        String sql = "select id,article_title from t_article   order by article_views desc,article_create_time desc limit ?";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        connection = DbUtil.getConnection();
        List<Article> recentWeekArticles = new ArrayList<Article>();
        preparedStatement = DbUtil.getPreparedStatement(connection, sql);
        try {
            preparedStatement.setInt(1, limit);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Article article = new Article();
                int id = resultSet.getInt(1);
                String articleTitle = resultSet.getString(2);
                article.setId(id);
                article.setTitle(articleTitle);
                recentWeekArticles.add(article);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
        return recentWeekArticles;
    }

    public List<Question> getHotQuestion(int limit) {
        String sql = "SELECT tab1.id, question_name, IFNULL(tab2.answer_count, 0) AS answer_count FROM (SELECT a.id, question_name, question_content, b.question_category, question_type , question_user_id, question_user_name, create_time, flag AS flag, img FROM t_question a, t_question_category b, t_user c WHERE a.question_type = b.id AND a.question_user_id = c.id ) tab1 LEFT JOIN (SELECT question_id, COUNT(1) AS answer_count FROM t_answer GROUP BY question_id ) tab2 ON tab1.id = tab2.question_id ORDER BY answer_count DESC, create_time DESC LIMIT ?";


        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        connection = DbUtil.getConnection();
        List<Question> hotQuestions = new ArrayList<Question>();
        preparedStatement = DbUtil.getPreparedStatement(connection, sql);
        try {
            preparedStatement.setInt(1, limit);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Question question = new Question();
                question.setId(resultSet.getInt("id"));
                question.setName(resultSet.getString("question_name"));
                question.setAnswerNum(resultSet.getInt("answer_count"));
                ArrayList<Answer> answers = new ArrayList<>();
                answers.add(getLatestAnswer(question.getId()));
                question.setAnswers(answers);
                hotQuestions.add(question);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
        return hotQuestions;
    }


    public Answer getLatestAnswer(int questionId) {
        String sql = "select a.id,username from t_answer a ,t_user b where a.answer_user_id=b.id and question_id=? order by create_time desc limit 1";


        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        connection = DbUtil.getConnection();
        preparedStatement = DbUtil.getPreparedStatement(connection, sql);
        Answer answer = null;
        try {
            preparedStatement.setInt(1, questionId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                answer = new Answer();
                answer.setId(resultSet.getInt("id"));
                User user = new User();
                user.setUsername("username");
                answer.setUser(user);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
        return answer;
    }
}
