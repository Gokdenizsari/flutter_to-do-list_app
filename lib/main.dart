import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_to_do_list_app/data/local_storage.dart';
import 'package:flutter_to_do_list_app/models/task_model.dart';
import 'package:flutter_to_do_list_app/pages/main_page.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<LocalStorage>(MockLocalStorage());
}

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  var taskBox = await Hive.openBox<Task>("Tasks");
  
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await setupHive();

  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black)),
      ),
      home: MainPage(),
    );
  }
}
