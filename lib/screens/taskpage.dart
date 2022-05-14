import 'package:flutter/material.dart';
import 'package:one_percent1/database_helper.dart';
import 'package:one_percent1/models/task.dart';
import 'package:one_percent1/widgets.dart';
import 'package:one_percent1/models/task.dart';

class Taskpage extends StatefulWidget {
  const Taskpage({Key? key}) : super(key: key);

  @override
  State<Taskpage> createState() => _TaskPageState();
}

class _TaskPageState extends State<Taskpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Stack(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 6.0,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ),
                        child: Image(
                          image:
                              AssetImage('assets/images/back_arrow_icon.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        onSubmitted: (value) async {
                          if (value != "") {
                            DatabaseHelper _dbHelper = DatabaseHelper();

                            Task _newTask = Task(title: value);

                            await _dbHelper.insertTask(_newTask);

                            // print("New Task has been created");
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: "Enter Task Title",
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF211551),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 12.0,
                ),
                child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter Description for the task...",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ))),
              ),
              TodoWidget(
                text: "Create your first task",
                isDone: true,
              ),
              TodoWidget(
                text: "Create your first todo as well",
                isDone: false,
              ),
              TodoWidget(
                text: "Just another todo",
                isDone: false,
              ),
              TodoWidget(
                isDone: true,
              ),
            ]),
            Positioned(
              bottom: 24.0,
              right: 24.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Taskpage()),
                  );
                },
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Image(
                    image: AssetImage(
                      "assets/images/trash_icon.png",
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
