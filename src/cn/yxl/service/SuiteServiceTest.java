package cn.yxl.service;

import cn.yxl.entity.Option;
import org.junit.Test;

import java.util.List;

/**
 * Created by Administrator on 2017/6/20.
 */
public class SuiteServiceTest {
    @Test
    public  void main(){
        SuiteService td=new SuiteService();
        //List<Question>list = td.getQuestion("S001");

        //for(Question n:list){

        //	System.out.println(n);
        //}

        //Suite Suite = td.getSuite("S003");
        //System.out.println(Suite);
        List<Option> list = td.getOptions("Q001");
        for(Option option:list){
            System.out.println(option);
        }
    }

}
