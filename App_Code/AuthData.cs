using System;
using System.Collections.Generic;
using System.Web;
using MySql.Data.MySqlClient;

/// <summary>
/// Summary description for AuthData
/// </summary>
public class AuthData
{
    private MySqlConnection connection;
    private string server;
    private string database;
    private string uid;
    private string password;

  public  string query="";
  public string [] list=new string[2];
  public string gotUsername;
  private string gotPass;

    int err;
   public Boolean loginFlage= false;
  public  string message;

    public AuthData(){
        this.Initialize();
      
    }


    /* Intializing connection to db */

    private void Initialize()
    {
        server = "localhost";
        database = "project";
        uid = "root";
        password = "";
        string connectionString;
        connectionString = "SERVER=" + server + ";" + "DATABASE=" + 
		database + ";" + "UID=" + uid + ";" + "PASSWORD=" + password + ";";

        connection = new MySqlConnection(connectionString);
    }


    /* Open and Close Connection */

    private bool OpenConnection()
{
    try
    {
        connection.Open();
        return true;
    }
    catch (MySqlException ex)
    {
        //When handling errors, you can your application's response based 
        //on the error number.
        //The two most common error numbers when connecting are as follows:
        //0: Cannot connect to server.
        //1045: Invalid user name and/or password.
        switch (ex.Number)
        {
            case 0:
            err=0;
               // MessageBox.Show("Cannot connect to server.  Contact administrator");
                break;

            case 1045:
            err=1;
               // MessageBox.Show("Invalid username/password, please try again");
                break;
        }
        return false;
    }
}

//Close connection
private bool CloseConnection()
{
    try
    {
        connection.Close();
        return true;
    }
    catch (MySqlException ex)
    {
        err=2;
       // MessageBox.Show(ex.Message);
        return false;
    }
}
/* Select*/

public void Select(){
   // this.query="SELECT `userId`, `userName`, `userPass` FROM `users` WHERE 1 ";
   // string[]list=new string[3];
    
    if (this.OpenConnection() == true)
    {
        //Create Command
        MySqlCommand cmd = new MySqlCommand(query, connection);
        //Create a data reader and Execute the command
        MySqlDataReader dataReader = cmd.ExecuteReader();
        
        //Read the data and store them in the list
        while (dataReader.Read())
        {
           
            this.list[0]=(dataReader["userName"] + "");
            this.list[1]=(dataReader["userPass"] + "");
        }
            

        }
}

public void getAuth(string x,string y){

   gotUsername=x;
   gotPass=y;
   this.LoginCheck();
    
}
public void LoginCheck(){
    //check username
   // try{
       this.query= "SELECT  `userName`, `userPass` FROM `users` WHERE username='"+gotUsername+"'";
       Select();
       if(!(gotUsername.Equals(list[0]))){
           message="**أسم مستخدم غير صحيح";}
           else{if(gotPass.Equals(list[1])){

           loginFlage=true;
           
       } 
       else{
           message="** كلمة السر غير صحيحة";
       }}
       
       
  //  }
    /*catch(Exception e){
        message="invaild username";
       
    }*/
}

}
