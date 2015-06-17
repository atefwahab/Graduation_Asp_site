using System;
using System.Collections.Generic;
using System.Web;
using MySql.Data.MySqlClient;

/// <summary>
/// Summary description for ConnectDB
/// </summary>
public class ConnectDB
{
private MySqlConnection connection;
    private string server;
    private string database;
    private string uid;
    private string password; 
    int err;

    public ConnectDB(){
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

public List<string> Select(string query,string[] table_names){
 
      List<string> list = new List<string>();
    
    if (this.OpenConnection() == true)
    {
        //Create Command
        MySqlCommand cmd = new MySqlCommand(query, connection);
        //Create a data reader and Execute the command
        MySqlDataReader dataReader = cmd.ExecuteReader();
        
        //Read the data and store them in the list
        while (dataReader.Read())
        {
         try{
             
             for(int i=0; i<table_names.Length;i++){
                 list.Add(dataReader[table_names[i]] + "");
               
             }
         }catch(Exception e){
             err=0;
             
         }}
            

        }
        this.CloseConnection();
        return list;
    
}


  




//end of the class
}
