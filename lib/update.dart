
import 'package:flutter/material.dart';

class UpdateUI extends StatelessWidget{
  const UpdateUI({super.key});
  @override
  build(BuildContext context){
    return  Scaffold(
      body: Center(
        child:Column(
          children: [
           ElevatedButton(
          child: const Text("Open Popup"),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: true,
                  title: const Text("Login"),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Name",
                              icon: Icon(Icons.account_box),
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Email",
                              icon: Icon(Icons.email),
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Message",
                              icon: Icon(Icons.message),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      child: const Text("submit"),
                      onPressed: () {
                        // your code
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),  
          ],
        )
      )
    );
  }
}