using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for Courses
/// </summary>
public class Courses
{
    private ConnectDB obj=new ConnectDB();
    public List<string> list=new List<string>();
    public  course [] objs_list;
    public string message="لا توجد محاضرات حالياً";
    public Courses()
    {
        //
        // TODO: Add constructor logic here
        //
        this.message="لا توجد محاضرات حالياً";
        this.objs_list= new course[0]; 
    }
    // this Consrtuctor used in know the courses for a specific year and depratment
    public Courses(string department_id,string grade){
         List<string> list = new List<string>();
        string [] arr=new string[]{"course_id"};
        list=obj.Select("SELECT `course_id` FROM `course_stuff` WHERE `department_id`="+department_id+" AND `grade`="+grade,arr);
      this.list=list;
      
      createObjects(list.Count);
      
        
    }
    //this constructor used to know courses for a specific time
    public Courses(string time){
        
         List<string> list = new List<string>();
        string [] arr=new string[]{"course_id"};
        list=obj.Select("SELECT `course_id` FROM `course_stuff` WHERE `begin_time`<="+time+" And `end_time` > "+time,arr);
      this.list=list;
      
      createObjects(list.Count);
    }



    //this Constructor used for a specific student and specific time
    public Courses(string grade,string department_id,string time){
        
        List<string> list = new List<string>();
        string [] arr=new string[]{"course_id"};
        list=obj.Select("SELECT `course_id` FROM `course_stuff` WHERE `department_id`="+department_id+" AND `grade`="+grade+" AND `begin_time`<="+time+" And `end_time`>"+time,arr);
      this.list=list;
      
      createObjects(list.Count);
    }





    private void createObjects(int objects_num){
       course [] objs_list = new course[objects_num];
        for(int i=0; i<objects_num;i++){
            objs_list[i]=new course();
             objs_list[i].setID(list[i]);    
        }
        this.objs_list=objs_list;
          
    }
}
