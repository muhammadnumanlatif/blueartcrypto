import '/utils/packages.dart';
import '/utils/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'blueartcrypto.com',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.amber,
        cardColor: Colors.transparent,
        textTheme: TextTheme(
          subtitle1: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.amber,
          size: 25,
        ),
      ),
      home: HomePage(),
    );
  }
}
