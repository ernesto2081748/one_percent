import 'package:flutter/material.dart';
import 'package:one_percent1/database_helper.dart';
import 'package:one_percent1/widgets.dart';
import 'package:one_percent1/screens/taskpage.dart';
import 'package:one_percent1/models/task.dart';
import 'package:one_percent1/main.dart';

// void main() {
//   runApp(const MyApp(
//     data: List<String>.generate(10000, (i) => 'Item $i'),
//   ));
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key, List<String>? data}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  get data => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        color: const Color(0xFFF6F6F6),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 32.0, bottom: 32.0),
                child: const Image(
                  image: AssetImage(
                    'assets/images/logo.png',
                  ),
                ),
              ),
              // Expanded(
              //   child: FutureBuilder(
              //     initialData: const [],
              //     future: _dbHelper.getTasks(),
              //     builder: (context, snapshot, length) {
              //       return ScrollConfiguration(
              //         behavior: NoGlowBehaviour(),
              //         child: ListView.builder(
              //           itemCount: snapshot.data?.length,
              //           itemBuilder: (context, index) {
              //             return TaskCardWidget(
              //               title: snapshot.data![index].title,
              //             );
              //           },
              //         ),
              //       );
              //     },
              //     ),
              //   )
              // ]),
              Positioned(
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Taskpage()),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Image(
                      image: AssetImage(
                        "assets/images/add_icon.png",
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    ));
  }
}
