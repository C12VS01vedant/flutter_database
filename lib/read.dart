import 'package:flutter/material.dart';

import 'package:curd_operations/db_helper.dart';



class Read extends StatefulWidget{
  const Read({Key?key}):super(key:key);
@override
  State<Read> createState() => _ReadFunction();
}

class _ReadFunction extends State<Read>{

  List<Map<String,dynamic>> data=[];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Data'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            List<Map<String,dynamic>> queryRows=await DBHelper.instance.readAllDB();
            setState(() {
              data=queryRows;
            });
            print('Read Data:$data');
          },
          child: const Text('READ'),
        )
      )
    );
  }
}




