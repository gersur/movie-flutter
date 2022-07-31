import 'package:movie_flutter/pages/home.dart';
import 'package:movie_flutter/states/states.dart';

void main() {
  runApp(
    MultiProvider(
      providers: States.providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
