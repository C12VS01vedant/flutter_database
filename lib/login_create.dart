import 'package:curd_operations/db_helper.dart';
import 'package:flutter/material.dart';


class Login_Form extends StatefulWidget{
  const Login_Form({super.key});
  @override
  State<Login_Form> createState() => _LoginFunctionality();
}

class _LoginFunctionality extends State<Login_Form>{
  
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final dbHelper=DBHelper.instance;
  
  @override
  void initState(){
    super.initState();
  }
  
  @override
  void dispose(){
    idController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
               controller: idController,
               decoration: InputDecoration(
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
               
                  hintText: 'Enter ID',
                    ),
            ),
            TextField(
              controller: nameController,
               decoration: InputDecoration(
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  hintText: 'Enter Name',
                    ),
            ),
            ElevatedButton(
              onPressed: () async{
                // database login
                Map<String,dynamic> row={
                    DBHelper.columnName:nameController.text,
                    DBHelper.columnDescription:idController.text
                };
                int id=await dbHelper.insertDB(row);
                print('inserted row id:$id');
                
              }, child: const Text('ENTER'))
          ],
        ),
      )
    );
  }

}