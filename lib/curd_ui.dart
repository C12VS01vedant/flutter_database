import 'package:flutter/material.dart';
import 'package:curd_operations/login_create.dart';
import 'package:curd_operations/read.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle CREATE button press
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login_Form()),
                );
              },
              child: const Text('CREATE'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle READ button press
                // Add your code for reading data
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Read()),
                );

              },
              child: const Text('READ'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle UPDATE button press
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      scrollable: true,
                      title: const Text('Update'),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Enter Id",
                                  icon: Icon(Icons.account_box),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          child: const Text("Submit"),
                          onPressed: () {
                            // Handle submit button press
                            Navigator.of(context).pop(); // Close the dialog
                            // Add your code for updating data
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('UPDATE'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle DELETE button press
                // Add your code for deleting data
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      scrollable: true,
                      title: const Text('delete data'),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Enter Id",
                                  icon: Icon(Icons.account_box),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          child: const Text("Submit"),
                          onPressed: () {
                            // Handle submit button press
                            Navigator.of(context).pop(); // Close the dialog
                            // Add your code for updating data
                          },
                        ),
                      ],
                    );
                  },
                );

              },
              child: const Text('DELETE'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
