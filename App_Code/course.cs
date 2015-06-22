using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// this class get every detail you will need to know for a single course
/// Author : Mohamed Atef 
/// </summary>
public class course
{
    private ConnectDB obj = new ConnectDB();
    public string course_id;
    public  string course_name;
    public string  course_prof="default";
    public string course_assistant;
    public string course_about;
    public string course_picture;
    public string course_location;
    public string course_map_link;
    public string course_begin_time;
    public string course_end_time;
    public string course_duration;
    public string course_department;
    public string course_grade;
    public string course_day;
   
    public course()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    // To know the ID of a course
    public void setID(string id){
        this.course_id=id;
        getDataFromCourse();
        getCourseStuff();
    }
    private void getDataFromCourse(){
        List<string> list = new List<string>();
        string [] arr=new string[]{"course_name","duration","grade","department_id","about"};
        list=obj.Select("SELECT `course_name`, `duration`, `grade`, `department_id`, `about` FROM `course` WHERE `course_id`="+course_id,arr);
        this.course_name=list[0];
        this.course_duration=list[1];
        this.course_grade=list[2];
        this.course_about=list[4];

        // Know name of department
        getDepartmentName(list[3]);
        

        
    }
    // Know name of department
    private void getDepartmentName(string department_id){
         List<string> list = new List<string>();
        string [] arr=new string[]{"department_name"};
        list=obj.Select("SELECT `department_name` FROM `department` WHERE `department_id`="+department_id,arr);
        this.course_department=list[0];
        
    }
 private void getCourseStuff(){

         List<string> list = new List<string>();
        string [] arr=new string[]{"stuff_id", "lab_id", "begin_time", "end_time","day"};
        list=obj.Select("SELECT `stuff_id`, `lab_id`, `begin_time`, `end_time`, `day` FROM `course_stuff` WHERE `course_id`="+this.course_id,arr);
        
        //know stuff name
        getProfName(list[0]);

        //know lab postition
        getLabName(list[1]);

        this.course_begin_time=list[2];
        this.course_end_time=list[3];
        
        //get the  day
        getDayName(list[4]);
        
    }

    private void getProfName(string stuff_id){
        List<string> list = new List<string>();
        string [] arr=new string[]{"stuff_name"};
        list=obj.Select("SELECT `stuff_name` FROM `stuff` WHERE `stuff_id`="+stuff_id,arr);
        this.course_prof=list[0];
        
    }

    private void getLabName(string lab_id){
         List<string> list = new List<string>();
        string [] arr=new string[]{"lab_name", "map_link"};
        list=obj.Select("SELECT `lab_name`, `map_link` FROM `lab` WHERE `lab_id`="+lab_id,arr);
        this.course_location=list[0];
        this.course_map_link=list[1];

    }

    /*
    GET DAY OF THE WEEK
    */
    private void getDayName(string day_id){
         List<string> list = new List<string>();
        string [] arr=new string[]{"day_name"};
        list=obj.Select("SELECT `day_name` FROM `day` WHERE `day_id`="+day_id,arr);
        this.course_day=list[0];
        
    }
    
    
}
