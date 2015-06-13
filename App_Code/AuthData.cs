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
  public string gotUsername;
  private string gotPass;
    int err;
   public Boolean loginFlage= false;
  public  string message;
  List<string> list = new List<string>();
  private string [] arr = new string[]{"userName","userPass"};
  
  

    public AuthData(){
      
    }


    



public void getAuth(string x,string y){

   gotUsername=x;
   gotPass=y;
   this.LoginCheck();
    
}

public void LoginCheck(){
   
   list= obj.Select("SELECT  `userName`, `userPass` FROM `users` WHERE username='"+gotUsername+"'",arr);
    
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
       }}}
       
       
 
}

}
