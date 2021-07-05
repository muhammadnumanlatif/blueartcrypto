import '/utils/utils.dart';
import '/utils/pages.dart';
import '/utils/packages.dart';
import '/utils/controllers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Obx(
        () {
          if (categoryController.isLoading.value)
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).accentColor,
                ),
              ),
            );
          else
            return DefaultTabController(
              length: categoryController.categoryList.length,
              child: Scaffold(
                backgroundColor: Theme.of(context).primaryColor,
                appBar: AppBar(
                  elevation: 0,
                  centerTitle: true,
                  leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Image.asset(
            "assets/blueartcrypto.png",
          ),
                  ),
                  title: Text(
                    BCIUtils.title.toString(),
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  bottom: TabBar(
                    tabs: categoryController.categoryList
                        .map((model) => tab(model.categoryName))
                        .toList(),
                    isScrollable: true,
                    labelColor: Theme.of(context).accentColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor:
                        Theme.of(context).accentColor.withOpacity(0.5),
                  ),
                ),
                body: TabBarView(
                  children: categoryController.categoryList
                      .map(
                        (model) => NewsPage(
                          categoryID: model.categoryId,
                          isReload: true,
                          totalRecords: model.count,
                        ),
                      )
                      .toList(),
                ),
              ),
            );
        },
      ),
    );
  }

  Widget tab(String tabName) {
    return Tab(text: tabName);
  }
}
