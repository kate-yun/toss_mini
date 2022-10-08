import 'package:chang_mini/pages/splash_page.dart';
import 'package:chang_mini/services/bank_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // main메소드에서 서버나 SharedPreferences 등 비동기로 데이터를 다룬 다음
  // runApp을 실행해야 하는 경우 반드시 추가.(runApp 메소드의 시작 지점에서 Flutter엔진과 위젯의 바인딩이 미리 완료되어 있게 함)

  SharedPreferences prefs = await SharedPreferences.getInstance();
  // await prefs.clear();
  // SharedPreferences 저장 데이터 삭제

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BankService(prefs)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
