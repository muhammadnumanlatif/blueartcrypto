import '/utils/pages.dart';
import '/utils/utils.dart';
import '/utils/packages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: BCIUtils.title,
      themeMode: ThemeMode.system,
      theme: BCIUtils.lightTheme,
      darkTheme: BCIUtils.darkTheme,
      home: HomePage(),
    );
  }
}
