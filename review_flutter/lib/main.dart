import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:review_flutter/boxes.dart';

import 'package:review_flutter/pages/home_screen/home_screen.dart';
import 'package:review_flutter/pages/material_list_page/future_builder/future_builder_user.dart';
import 'package:review_flutter/pages/material_list_page/hive_db/hive_db.dart';
import 'package:review_flutter/pages/material_list_page/hive_db/todo_list.dart';
import 'package:review_flutter/pages/material_list_page/http_get/http_get.dart';
import 'package:review_flutter/pages/material_list_page/http_post/http_stateful.dart';
import 'package:review_flutter/pages/material_list_page/http_putPatch/http_putPatch.dart';
import 'package:review_flutter/pages/material_list_page/material_page.dart';
import 'package:review_flutter/pages/material_list_page/user_list/user_list_page/user_list.dart';
import 'package:review_flutter/pages/material_list_page/websocket_material/websocket_material.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoListAdapter());
  boxTodoList = await Hive.openBox('testBox');
  runApp(const MainRouting());
}

class MainRouting extends StatelessWidget {
  const MainRouting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home_screen",
      routes: {
        "/home_screen": (context) => const HomeScreen(),
        "/material_list_page": (context) => const MaterialListPage(),
        "/user_list": (context) => const UserList(),
        "/websocket_material": (context) => const WebsocketMaterial(),
        "/http_post": (context) => const HttpStateful(),
        "/http_get": (context) => const HttpGet(),
        "/http_putPatch": (context) => const HttpPutpatch(),
        "/future_builder_user": (context) => const FutureBuilderUser(),
        "/hive_db": (context) => const HiveDb(),
      },
    );
  }
}
