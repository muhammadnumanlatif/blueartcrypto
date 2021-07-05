
import '/utils/pages.dart';
import '/utils/utils.dart';
import '/utils/packages.dart';


// void main() => runApp(MyApp());

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: BCIUtils.title,
            themeMode: ThemeMode.system,
            theme: BCIUtils.lightTheme,
            darkTheme: BCIUtils.darkTheme,
            home: HomePage(),
          );
  }
}
