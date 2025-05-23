import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainAppState();
  }
}

class MainAppState extends State<MainApp> {
  String task = "No Task Added Yet";

  List<String> tasks=[];

  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("TO - DO - APPLICATION"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child:Container(
                      padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: taskController,
                      decoration: InputDecoration(
                        labelText: "Enter the Task To Do",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    ),
                  ),
                  SizedBox(width: 10), // space between input and button
                  MaterialButton(
                    color: Colors.blue,
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      setState(() {
                        task=taskController.text;
                        tasks.add(task);
                        taskController.clear();
                      });
                    },
                    child: Text("Add"),
                    textColor: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: 20),



              Flexible(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder:(context,index)
                  {
                  return Row(
                  children: [
                    Expanded(
                      child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(tasks[index]),
                    )
                    ),
                    MaterialButton(
                      child: Icon(Icons.delete, color: Colors.red,),
                      onPressed:(){
                        setState(() {
                          tasks.removeAt(index);
                        });
                      },
                    )
                  ],
                );
                  }),
              ),




            ],
          ),
        ),
      );

  }
}
