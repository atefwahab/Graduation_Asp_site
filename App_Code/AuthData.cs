using System;
using System.Collections.Generic;
using System.Web;
using MySql.Data.MySqlClient;

/// <summary>
/// Summary description for AuthData
/// </summary>
public class AuthData
{
   
  ConnectDB obj = new ConnectDB();
  public int loginTry=0;
  public string gotUsername;
  private string gotPass;
  public string name="default";
  public string user_img;
  public int student_id;
  int stuff_id;
    int err;
   public Boolean loginFlage= false;
  public  string message;
  List<string> list = new List<string>();
  private string [] arr = new string[]{"userName","userPass","student_id","stuff_id"};
  
  

    public AuthData(){
      
    }


    



public void getAuth(string x,string y){

   gotUsername=x;
   gotPass=y;
   this.LoginCheck();
   loginTry++;
   if(loginFlage){
   this.getName();}
   
    
}

public void LoginCheck(){
   try{
   list= obj.Select("SELECT  `userName`, `userPass`, `student_id`, `stuff_id` FROM `users` WHERE username='"+gotUsername+"'",arr);
    student_id=int.Parse(list[2]);
    stuff_id=int.Parse(list[3]);
   //Check if the username is right or pass ?!
       if(list.Count==0){
           message="**أسم مستخدم غير صحيح";
       }else{

       if(!(gotUsername.Equals(list[0]))){

           message="**أسم مستخدم غير صحيح";
           }
           else{if(gotPass.Equals(list[1])){

           loginFlage=true;
          
           
       } 
       else{
           message="** كلمة السر غير صحيحة";
   }}}}catch(Exception e){
       loginFlage=false;
         message="**أسم مستخدم غير صحيح";
       
       
   }
       
       
 
}

private void getName(){
    List<string> lo = new List<string>();
    string [] arr = new string[2];

    if(this.student_id!=0){
         
         arr[0]="Student_name";
         arr[1]="Student_imgUrl";
         
         lo=(obj.Select("SELECT `Student_name`,`Student_imgUrl` FROM `students` WHERE `student_id`="+this.student_id,arr));
         this.name=lo[0];
         
         if(lo[1]==""){this.user_img="images/default.jpg";}else{
              this.user_img=lo[1];
         }
        
         
       
         }

         if(stuff_id!=0){
              arr[0]="stuff_name";
         arr[1]="stuff_imgurl";
         lo=(obj.Select("SELECT `stuff_name`,`stuff_imgurl`FROM `stuff` WHERE `stuff_id`="+this.stuff_id,arr));
         this.name=lo[0];
         if(lo[1]==""){this.user_img="images/default.jpg";}else{
              this.user_img=lo[1];
         }
         
         }
         
    
}

}
