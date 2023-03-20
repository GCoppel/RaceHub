import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitch = false;
  bool? isCheckbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Learn Flutter"),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(
              onPressed: () {
                debugPrint("Actions");
              },
              icon: const Icon(
                Icons.info_outline,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("images/9x8.jpeg"),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.black,
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                color: Colors.blueGrey,
                width: double.infinity,
                child: const Center(
                  child: Text(
                    "This is a text widget",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: isSwitch ? Colors.red : Colors.blue,
                ),
                onPressed: () {
                  debugPrint("Elevated Button");
                },
                child: const Text("Elevated Button"),
              ),
              OutlinedButton(
                onPressed: () {
                  debugPrint("Outlined Button");
                },
                child: const Text("Outlined Button"),
              ),
              TextButton(
                onPressed: () {
                  debugPrint("Text Button");
                },
                child: const Text("Text Button"),
              ),
              GestureDetector(
                behavior: HitTestBehavior
                    .opaque, //Allows clicking on outside edges (because of centering)
                onTap: () {
                  debugPrint("This is the row");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, //**********************************************USEFUL */
                  children: const [
                    Icon(
                      Icons.local_fire_department,
                      color: Colors.red,
                    ),
                    Text("Row widget"),
                    Icon(
                      Icons.local_fire_department,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              Switch(
                  value: isSwitch,
                  onChanged: (bool newBool) {
                    setState(() {
                      isSwitch = newBool;
                    });
                  }),
              Checkbox(
                  value: isCheckbox,
                  onChanged: (bool? newBool) {
                    setState(() {
                      isCheckbox = newBool;
                    });
                  }),
              Image.network(
                  'https://www.wrcwings.tech/wp-content/uploads/2021/10/Craig01-by-HMS-scaled.jpg'),
            ],
          ),
        ));
  }
}
