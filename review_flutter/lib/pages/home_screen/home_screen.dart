import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:review_flutter/boxes.dart';
import 'package:review_flutter/pages/material_list_page/hive_db/todo_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Row(
              children: [
                IconFilled(
                    colorBg: Colors.white,
                    colorIcon: Colors.black,
                    icon: Icons.notification_add_rounded),
                IconFilled(
                    colorBg: Color.fromARGB(255, 103, 16, 255),
                    colorIcon: Colors.white,
                    icon: Icons.person_2_outlined),
              ],
            ),
          )
        ],
        // leading: Icon(Icons.fl, color: Colors.white),
        backgroundColor: Colors.black,
        title: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(children: [
              const Icon(Icons.flutter_dash, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                'Review Flutter',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
              ),
            ])),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.black,
            child: const Column(children: [
              HomeScreenBody(),
              UpcomingTask(),
            ])),
      ),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text("Welcome Back Dito",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600)),
                const Spacer(),
                Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "August",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Have You Learn",
                    style: GoogleFonts.poppins(
                        fontSize: 40, fontWeight: FontWeight.w600)),
                Text("Flutter Today?",
                    style: GoogleFonts.poppins(fontSize: 30)),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const BasicCard(
              icon: Icons.book_online_outlined,
              route: "/material_list_page",
              title: "Material",
              desc: "Learn new material from any resources",
            ),
            const BasicCard(
              icon: Icons.settings_accessibility_outlined,
              route: "/user_list",
              title: "Practice",
              desc: "Practice new material with this page",
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),

      // const UpcomingTask(),
    );
  }
}

class UpcomingTask extends StatefulWidget {
  const UpcomingTask({
    super.key,
  });

  @override
  State<UpcomingTask> createState() => _UpcomingTaskState();
}

class _UpcomingTaskState extends State<UpcomingTask> {
  TextEditingController name = TextEditingController();
  TextEditingController date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(children: [
                  Text("Upcoming",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                  Text("  Task",
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w400)),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                  )
                ]),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: "Add new task",
                        prefixIcon: Icon(Icons.edit),
                      ),
                      style: GoogleFonts.poppins(fontSize: 17),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: date,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: "Add new task",
                        prefixIcon: Icon(Icons.edit),
                      ),
                      style: GoogleFonts.poppins(fontSize: 17),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      backgroundColor: const WidgetStatePropertyAll(
                          Color.fromARGB(255, 103, 16, 255)),
                    ),
                    onPressed: () {
                      boxTodoList.put('key_${name.text}',
                          TodoList(nameActivity: name.text, date: date.text));
                    },
                    child: const Text(
                      "Create Activity",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: boxTodoList.length,
                  itemBuilder: (context, index) {
                    TodoList todoList = boxTodoList.getAt(index);
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      child: ListTile(
                        leading: const Checkbox(
                          value: true,
                          onChanged: null,
                          checkColor: Colors.white,
                          fillColor: WidgetStatePropertyAll(
                              Color.fromARGB(255, 103, 16, 255)),
                        ),
                        title: Text(todoList.nameActivity),
                        subtitle: Text(todoList.date),
                        trailing: IconButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.red)),
                            onPressed: () {
                              boxTodoList.deleteAt(index);
                            },
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.white,
                            )),
                      ),
                    );
                  }),
            ],
          )),
    );
  }
}

class BasicCard extends StatelessWidget {
  final String title;
  final String desc;
  final IconData icon;
  final String route;

  const BasicCard({
    required this.title,
    required this.desc,
    required this.icon,
    required this.route,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Align(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 103, 16, 255),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      width: 35,
                      height: 35,
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                    const SizedBox(
                        width: 10), // Spacer kecil untuk memberikan jarak
                    Expanded(
                      // Expanded digunakan untuk memberikan ruang yang fleksibel
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            desc,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const IconFilled(
                        colorBg: Colors.black,
                        colorIcon: Colors.white,
                        icon: Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconFilled extends StatelessWidget {
  final IconData icon;
  final Color colorIcon;
  final Color colorBg;

  const IconFilled(
      {required this.icon,
      required this.colorIcon,
      required this.colorBg,
      super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.center,
      iconSize: 17,
      color: colorIcon,
      constraints: const BoxConstraints(
        minWidth: 24.0,
        minHeight: 24.0,
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(colorBg),
      ),
      onPressed: () {},
      icon: Icon(icon),
    );
  }
}
