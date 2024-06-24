import 'package:auth_register/ui/main_page.dart';
import 'package:auth_register/utels/theme_data_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDerectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDerectory.path);
  await Hive.openBox('auth');
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData2.self(),
      home: const MainPage(),
    );
  }
}
