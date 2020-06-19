@isTest
public class TaskUtilTest {
    @isTest static void myTest(){
        String priority = TaskUtil.getTaskPriority('CA');
        System.assertEquals('High',priority);
    }
    @isTest static void myTest1(){
        String priority = TaskUtil.getTaskPriority('IN');
        System.assertEquals('Normal',priority);
    }
    @isTest static void myTest2(){
        String priority = TaskUtil.getTaskPriority('India');
        System.assertEquals(null,priority);
    }
}