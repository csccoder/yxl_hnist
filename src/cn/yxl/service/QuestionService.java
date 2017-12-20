package cn.yxl.service;

/**
 * Created by Administrator on 2017/6/19.
 */

import cn.yxl.entity.*;
import cn.yxl.util.DbUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 问答模块 service
 */
public class QuestionService {
    public int getAnswersCountByUserId(int userId){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        String sql="select count(1) from t_answer where answer_user_id=?";
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

    public List<Answer> getAnswersByUserIdAndQuestionId(int userId,int curPage,int count){
        String sql="select a.*,b.question_name from t_answer a,t_question  b where a.question_id=b.id and answer_user_id=?  ORDER BY a.create_time limit ?,?";
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        connection= DbUtil.getConnection();
        ArrayList<Answer> answers=null;
        preparedStatement=DbUtil.getPreparedStatement(connection, sql);
        try {
            preparedStatement.setInt(1,userId);
            int start=(curPage-1)*count;
            preparedStatement.setInt(2,start);
            preparedStatement.setInt(3,count);
            resultSet = preparedStatement.executeQuery();
            answers = new ArrayList<Answer>();
            while(resultSet.next()){
                Answer answer=new Answer();
                answer.setId(resultSet.getInt("id"));
                answer.setAnswerContent(resultSet.getString("answer_content"));

                Question question = new Question();
                question.setId(resultSet.getInt("question_id"));
                question.setName(resultSet.getString("question_name"));
                answer.setQuestion(question);
                answers.add(answer);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
        return answers;
    }


    public int getQuestionCountByUserId(int userId){
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        String sql="select count(1) from t_question where question_user_id=?";
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

    public List<Question> getQuestionsByUserId(int userId,int curPage,int count){
        String sql="select * from t_question where question_user_id=? ORDER BY create_time limit ?,?";

        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        connection= DbUtil.getConnection();
        List<Question> questions=new ArrayList<Question>();
        preparedStatement=DbUtil.getPreparedStatement(connection, sql);
        try {
            preparedStatement.setInt(1,userId);
            int start=(curPage-1)*count;
            preparedStatement.setInt(2,start);
            preparedStatement.setInt(3,count);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                Question question=new Question();
                question.setId(resultSet.getInt("id"));
                question.setName(resultSet.getString("question_name"));
                question.setContent(resultSet.getString("question_content"));

                questions.add(question);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
        return questions;
    }

    /**
     * 获取某各问题下的所有回答
     * @param questionId
     * @return
     */
    public List<Answer> getAnswerListByQuestionId(int questionId){
        String sql="select a.id,a.answer_content,b.id as user_id,b.username as user_name,b.img as user_img,a.create_time from t_answer a,t_user b,t_question c where a.question_id=c.id and a.answer_user_id=b.id and a.question_id=? order by a.create_time desc";
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        connection= DbUtil.getConnection();
        List<Answer> answers=new ArrayList<Answer>();
        preparedStatement=DbUtil.getPreparedStatement(connection, sql);
        try {
            preparedStatement.setInt(1,questionId);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                Answer answer = new Answer();
                answer.setId(resultSet.getInt("id"));
                answer.setAnswerContent(resultSet.getString("answer_content"));
                answer.setCreateTime(resultSet.getTimestamp("create_time"));
                User user = new User();
                user.setId(resultSet.getInt("user_id"));
                user.setUsername(resultSet.getString("user_name"));
                user.setImg(resultSet.getString("user_img"));
                answer.setUser(user);

                answers.add(answer);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
        return answers;

    }

    public List<Question> getQuestionList(int flag,int categoryId,int curPage,int pageSize){
        String sql="SELECT tab1.id, question_name, question_content, question_category, question_type , question_user_id, question_user_name, create_time, flag, img , IFNULL(tab2.answer_count, 0) AS answer_count FROM (SELECT a.id, question_name, question_content, b.question_category, question_type , question_user_id, question_user_name, create_time, flag, img FROM t_question a, t_question_category b, t_user c WHERE a.question_type = b.id AND a.question_user_id = c.id ) tab1 LEFT JOIN (SELECT question_id, COUNT(1) AS answer_count FROM t_answer GROUP BY question_id ) tab2 ON tab1.id = tab2.question_id where 1=1";
        if(flag>=0){
            sql+=" and flag="+flag;
        }
        if(categoryId>0){
            sql+=" and tab1.question_type="+categoryId;
        }
        int index=(curPage-1)*pageSize;
        sql+=" limit "+index+","+pageSize;

        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        connection= DbUtil.getConnection();
        List<Question> questions=new ArrayList<Question>();
        preparedStatement=DbUtil.getPreparedStatement(connection, sql);
        try {
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                Question question = new Question();
                int id = resultSet.getInt(1);
                String name=resultSet.getString(2);
                String content=resultSet.getString(3);
                String categoryName=resultSet.getString(4);
                categoryId=resultSet.getInt(5);
                QuestionCategory questionCategory = new QuestionCategory(categoryId, categoryName);
                int userId=resultSet.getInt(6);
                String userName = resultSet.getString(7);
                Timestamp createTime = resultSet.getTimestamp(8);
                flag = resultSet.getInt(9);
                String img = resultSet.getString(10);
                int answerNum=resultSet.getInt(11);

                question.setId(id);
                question.setName(name);
                question.setContent(content);
                question.setCategory(questionCategory);
                question.setCreateTime(createTime);
                question.setFlag(flag);
                User user = new User();
                user.setId(userId);
                user.setUsername(userName);
                user.setImg(img);
                question.setUser(user);
                question.setAnswerNum(answerNum);

                questions.add(question);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
        return questions;
    }

    public int getCountByCondition(int flag,int categoryId){
        String sql="select count(1) from t_question  where 1=1";
        if(flag>0){
            sql+=" and flag="+flag;
        }
        if(categoryId>0){
            sql+=" and question_type="+categoryId;
        }

        int count=0;
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        connection= DbUtil.getConnection();
        List<Question> questions=new ArrayList<Question>();
        preparedStatement=DbUtil.getPreparedStatement(connection, sql);
        try {
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                count=resultSet.getInt(1);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
        return count;
    }


    public Question getQuesitonById(int id){
        String sql="select a.id ,question_name,question_content,b.question_category,question_type,question_user_id,question_user_name,create_time,flag,img from t_question a,t_question_category b,t_user c where a.question_type=b.id and a.question_user_id=c.id and a.id=?";

        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        connection= DbUtil.getConnection();
        preparedStatement=DbUtil.getPreparedStatement(connection, sql);
        Question question=null;
        try {
            preparedStatement.setInt(1,id);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                 question = new Question();
                id = resultSet.getInt(1);
                String name=resultSet.getString(2);
                String content=resultSet.getString(3);
                String categoryName=resultSet.getString(4);
                int categoryId=resultSet.getInt(5);
                QuestionCategory questionCategory = new QuestionCategory(categoryId, categoryName);
                int userId=resultSet.getInt(6);
                String userName = resultSet.getString(7);
                User user = new User();
                user.setId(userId);
                user.setUsername(userName);
                Timestamp createTime = resultSet.getTimestamp(8);
                int flag = resultSet.getInt(9);
                String img = resultSet.getString(10);
                user.setImg(img);
                question.setId(id);
                question.setName(name);
                question.setContent(content);
                question.setCategory(questionCategory);
                question.setUser(user);
                question.setCreateTime(createTime);
                question.setFlag(flag);

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
        return question;
    }

    public List<Question> getHotQuestion(){
        String sql="select tab1.*,IFNULL(tab2.answer_count,0) as answer_count FROM (select a.img,b.question_name,b.id from  t_hot_question a,t_question b where a.questionId=b.id order by a.id desc limit 4)tab1 left join(select question_id,count(1) answer_count from t_answer group by question_id) tab2 on tab1.id=tab2.question_id";

        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        connection= DbUtil.getConnection();
        List<Question> questions=new ArrayList<Question>();
        preparedStatement=DbUtil.getPreparedStatement(connection, sql);
        try {
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                Question question = new Question();
                String img = resultSet.getString("img");
                String name=resultSet.getString("question_name");
                int id=resultSet.getInt("id");
                int answerNum=resultSet.getInt("answer_count");

                question.setId(id);
                question.setName(name);
                question.setImg(img);
                questions.add(question);
                question.setAnswerNum(answerNum);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
        return questions;
    }

    public int saveQuestion(Question question) {
        String sql="insert into t_question(question_name,question_type,question_content,question_user_id,question_user_name,create_time,flag) values(?,?,?,?,?,?,?)";

        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        connection= DbUtil.getConnection();
        preparedStatement=DbUtil.getPreparedStatement(connection, sql,PreparedStatement.RETURN_GENERATED_KEYS);
        try {
            preparedStatement.setString(1,question.getName());
            preparedStatement.setInt(2,question.getCategory().getId());
            preparedStatement.setString(3,question.getContent());
            preparedStatement.setInt(4,question.getUser().getId());
            preparedStatement.setString(5,question.getUser().getUsername());
            preparedStatement.setTimestamp(6,question.getCreateTime());
            preparedStatement.setInt(7,question.getFlag());
            //执行插入
            preparedStatement.executeUpdate();
            //获取自动生成的主键
            resultSet = preparedStatement.getGeneratedKeys();

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

    public void addComment(Answer answer) {
        String sql="insert into t_answer(answer_content,question_id,answer_user_id,create_time) VALUES(?,?,?,?)";

        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        connection= DbUtil.getConnection();
        preparedStatement=DbUtil.getPreparedStatement(connection, sql,PreparedStatement.RETURN_GENERATED_KEYS);
        try {
            preparedStatement.setString(1,answer.getAnswerContent());
            preparedStatement.setInt(2,answer.getQuestion().getId());
            preparedStatement.setInt(3,answer.getUser().getId());
            preparedStatement.setTimestamp(4,answer.getCreateTime());
            //执行插入
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }

        //更新问题状态
        updateQuestionFlag(answer.getQuestion().getId());
    }

    public void updateQuestionFlag(int questionId){
        String sql="update t_question set flag=1 where id=?";

        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        connection= DbUtil.getConnection();
        preparedStatement=DbUtil.getPreparedStatement(connection, sql);
        try {
           preparedStatement.setInt(1,questionId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            DbUtil.closeAll(connection, preparedStatement, resultSet);
        }
    }
}
