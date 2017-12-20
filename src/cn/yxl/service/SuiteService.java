package cn.yxl.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import cn.yxl.entity.*;
import cn.yxl.util.DbUtil;

public class SuiteService {

    public List<Category> getModuleList() {
        //存放获取出来的导航信息
        List<Category> list = null;
        //连接数据库对象
        Connection con = null;
        //取数据对象
        PreparedStatement ps = null;
        //存放结果数据对象
        ResultSet rs = null;
        try {
            //在DbUtil 里获取连接对象
            con = DbUtil.getConnection();
            //写一个sql，告诉 系统，我们要查询的什么
            String sql = "SELECT * FROM t_module";
            //在DbUtil里获取数据的对象
            ps = DbUtil.getPreparedStatement(con, sql);
            //执行查询操作，将结果给ResultSet对象

            rs = ps.executeQuery();
            list = new ArrayList<Category>();
            while (rs.next()) {
                Category td = new Category();
                String id = rs.getString("module_code");
                String name = rs.getString("module_name");
                td.setModule_code(id);
                td.setModule_name(name);
                list.add(td);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtil.closeAll(con, ps, rs);
        }

        return list;

    }

    public List<Suite> getHotSuiteList(int limit){
        return getHotSuiteList("", limit);
    }

    public List<Suite> getHotSuiteList(String moduleId,int limit) {
        List<Suite> list = null;
        Connection con = null;
        PreparedStatement ps = null;
        //PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DbUtil.getConnection();
            String sql = "SELECT * FROM t_suite where 1=1";
            if(!"".equals(moduleId)){
               sql+=" and module_code='"+moduleId+"'";
            }
            sql+=" ORDER BY testnum DESC LIMIT "+limit;
            //String sql2 = "SELECT * FROM t_suite WHERE module_code='M001' ORDER BY   creat_time DESC LIMIT 2";
            ps = DbUtil.getPreparedStatement(con, sql);
            //ps2 = DbUtil.getPreparedStatement(con1, sql2);
            rs = ps.executeQuery();
            list = new ArrayList<Suite>();
            while (rs.next()) {
                Suite Suite = new Suite();
                String SuiteCode = rs.getString("suite_code");
                String title = rs.getString("title");
                String description = rs.getString("description");
                String photo = rs.getString("photo");
                int testnum = rs.getInt("testnum");
                Suite.setSuiteCode(SuiteCode);
                Suite.setTitle(title);
                Suite.setDescription(description);
                Suite.setTestnum(testnum);
                Suite.setPhoto(photo);
                list.add(Suite);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtil.closeAll(con, ps, rs);
        }
        return list;
    }

    public List<Suite> getSuiteListByModuleId(String moduleId, int limit) {
        List<Suite> list = null;
        Connection con = null;
        PreparedStatement ps = null;
        //PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DbUtil.getConnection();
            String sql = "SELECT * FROM t_suite where 1=1";
            if (!moduleId.equals("")) {
                sql += " and module_code='" + moduleId+"'";
            }
            sql += " ORDER BY create_time";
            if (limit > 0) {
                sql += "  DESC LIMIT " + limit;
            }
            ps = DbUtil.getPreparedStatement(con, sql);
            rs = ps.executeQuery();
            list = new ArrayList<Suite>();
            while (rs.next()) {
                Suite Suite = new Suite();
                String SuiteCode = rs.getString("suite_code");
                String title = rs.getString("title");
                String description = rs.getString("description");
                int testnum = rs.getInt("testnum");
                String moduleCode = rs.getString("module_code");
                Suite.setSuiteCode(SuiteCode);
                Suite.setTitle(title);
                Suite.setDescription(description);
                Suite.setTestnum(testnum);
                Suite.setModuleCode(moduleCode);
                list.add(Suite);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtil.closeAll(con, ps, rs);
        }
        return list;

    }

    public Suite getSuiteById(String id) {
        Suite Suite = null;
        Connection con = null;
        PreparedStatement ps = null;
        //PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DbUtil.getConnection();
            String sql = "SELECT *FROM t_suite WHERE suite_code =?";
            ps = DbUtil.getPreparedStatement(con, sql);

            ps.setString(1, id);
            rs = ps.executeQuery();
            Suite = new Suite();
            while (rs.next()) {
                String Suiteecode = rs.getString("suite_code");
                String title = rs.getString("title");
                String description = rs.getString("description");
                String photo = rs.getString("photo");
                int testnum = rs.getInt("testnum");
                int issuggest = rs.getInt("issuggest");
                int questioncount = rs.getInt("question_count");
                String modulecode = rs.getString("module_code");
                Timestamp creattime = rs.getTimestamp("create_time");
                Suite.setSuiteCode(Suiteecode);
                Suite.setTitle(title);
                Suite.setDescription(description);
                Suite.setPhoto(photo);
                Suite.setTestnum(testnum);
                Suite.setIssuggest(issuggest);
                Suite.setQuestionCount(questioncount);
                Suite.setModuleCode(modulecode);
                Suite.setCreatTime(creattime);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtil.closeAll(con, ps, rs);
        }

        return Suite;

    }

    public List<SuiteQuestion> getQuestions(String Suiteecode) {
        List<SuiteQuestion> list = null;
        Connection con = null;
        PreparedStatement ps = null;
        //PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DbUtil.getConnection();
            String sql = "SELECT * FROM t_suite_question WHERE suite_code = ? ORDER BY order_no asc";
            ps = DbUtil.getPreparedStatement(con, sql);

            ps.setString(1, Suiteecode);
            rs = ps.executeQuery();
            list = new ArrayList<SuiteQuestion>();
            while (rs.next()) {
                SuiteQuestion question = new SuiteQuestion();
                String questioncode = rs.getString("question_code");
                String title = rs.getString("title");
                String suiteCode = rs.getString("suite_code");
                int orderNo = rs.getInt("order_no");
                question.setQuestionCode(questioncode);
                question.setTitle(title);
                question.setSuiteCode(suiteCode);
                question.setOrderNo(orderNo);
                list.add(question);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtil.closeAll(con, ps, rs);
        }

        return list;

    }

    public List<Option> getOptions(String quescode) {
        List<Option> list = null;
        Connection con = null;
        PreparedStatement ps = null;
        //PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DbUtil.getConnection();
            String sql = "SELECT * FROM t_options WHERE question_code = ?";
            ps = DbUtil.getPreparedStatement(con, sql);

            ps.setString(1, quescode);
            rs = ps.executeQuery();
            list = new ArrayList<Option>();
            while (rs.next()) {
                Option option = new Option();
                String optioncode = rs.getString("option_code");
                String title = rs.getString("title");
                String questioncode = rs.getString("question_code");
                int score = rs.getInt("score");
                String nextquestion = rs.getString("next_question");
                option.setOptionCode(optioncode);
                option.setTitle(title);
                option.setQuestionCode(questioncode);
                option.setScore(score);
                option.setNextQuestion(nextquestion);
                list.add(option);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtil.closeAll(con, ps, rs);
        }

        return list;

    }

    public int selectScoreByOptionId(String optionId) {
        List<Option> list = null;
        Connection con = null;
        PreparedStatement ps = null;
        //PreparedStatement ps = null;
        ResultSet rs = null;
        int score = 0;
        try {
            con = DbUtil.getConnection();
            String sql = "SELECT score FROM t_options WHERE option_code = ?";
            ps = DbUtil.getPreparedStatement(con, sql);

            ps.setString(1, optionId);
            rs = ps.executeQuery();
            while (rs.next()) {
                score = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtil.closeAll(con, ps, rs);
        }

        return score;
    }

    public Result getSuiteResult(int score, String suiteCode) {
        System.out.println(score + " " + suiteCode);
        List<Option> list = null;
        Connection con = null;
        PreparedStatement ps = null;
        //PreparedStatement ps = null;
        ResultSet rs = null;
        Result result = new Result();
        try {
            con = DbUtil.getConnection();
            String sql = "SELECT a.*,b.title FROM t_result a,t_suite b WHERE a.suite_code=b.suite_code and a.suite_code=? and min_score<=? and max_score>=?";
            ps = DbUtil.getPreparedStatement(con, sql);

            ps.setString(1, suiteCode);
            ps.setInt(2, score);
            ps.setInt(3, score);
            rs = ps.executeQuery();
            while (rs.next()) {
                result.setResultCode(rs.getString(1));
                result.setMinScore(rs.getInt(2));
                result.setMaxScore(rs.getInt(3));
                result.setResultDesc(rs.getString(4));
                Suite suite = new Suite();
                suite.setSuiteCode(rs.getString(5));
                result.setMiaoshu(rs.getString(6));
                suite.setTitle(rs.getString(7));
                result.setSuite(suite);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtil.closeAll(con, ps, rs);
        }

        return result;
    }
}
