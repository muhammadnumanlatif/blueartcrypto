import '/utils/packages.dart';

class BCIUtils {
  static Widget iconText(BuildContext context, Icon icon, Text text) {
    return Row(
      children: [
        icon,
        SizedBox(width: MediaQuery.of(context).size.width * 0.03),
        text,
      ],
    );
  }

  static SizedBox sizedBoxWidth(context, double width) {
    return SizedBox(width: MediaQuery.of(context).size.width * width);
  }

  static SizedBox sizedBoxHeight(context, double height) {
    return SizedBox(height: MediaQuery.of(context).size.height * height);
  }

  static String apiURL = "https://blueartcrypto.com/wp-json/wp/v2/";
  static String categoryURL = "categories";
  static String postsURL =
      "https://blueartcrypto.com/wp-json/wp/v2/latest-posts/?category_id=";
  static String postDetailsURL = "post-details?id=";
  static String dateFormat = "dd-MMM-yyyy";

  static const crptoImage =
      'https://blueartcrypto.com/wp-content/uploads/Depositphotos_42771863_s-2019-e1590449164655.jpg';
  static String title = 'blueartcrypto.com';

  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.deepPurple,
    accentColor: Colors.amber,
    cardColor: Colors.transparent,
    textTheme: TextTheme(
      subtitle1: TextStyle(
        color: Colors.amber,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        color: Colors.amber,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.amber,
      size: 25,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    accentColor: Colors.black,
  );
}
