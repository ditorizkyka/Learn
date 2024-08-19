import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:review_flutter/boxes.dart';

import 'package:review_flutter/pages/home_screen/home_screen.dart';
import 'package:review_flutter/pages/material_list_page/LearnAuth/main.dart';
import 'package:review_flutter/pages/material_list_page/firestore/firestore.dart';
import 'package:review_flutter/pages/material_list_page/future_builder/future_builder_user.dart';
import 'package:review_flutter/pages/material_list_page/hive_db/hive_db.dart';
import 'package:review_flutter/pages/material_list_page/hive_db/todo_list.dart';
import 'package:review_flutter/pages/material_list_page/http_get/http_get.dart';
import 'package:review_flutter/pages/material_list_page/http_post/http_stateful.dart';
import 'package:review_flutter/pages/material_list_page/http_putPatch/http_putPatch.dart';
import 'package:review_flutter/pages/material_list_page/material_page.dart';
import 'package:review_flutter/pages/material_list_page/riverpod/rvp_main_page.dart';
import 'package:review_flutter/pages/material_list_page/riverpod/provider/scnd_rvp.dart';
import 'package:review_flutter/pages/material_list_page/user_list/user_list_page/user_list.dart';
import 'package:review_flutter/pages/material_list_page/websocket_material/websocket_material.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoListAdapter());
  boxTodoList = await Hive.openBox('testBox');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const ProviderScope(child: MainRouting()));
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
        "/rvp_main": (context) => const RvpMainPage(),
        "/scnd_rvp": (context) => const ScndRvp(),
        "/firestore_main": (context) => Firestore(),
        "/learn_auth": (context) => LearnAuth(),
      },
    );
  }
}
