import 'package:blueartcrypto/utils/widgets.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:blueartcrypto/utils/controllers.dart';

import '/utils/packages.dart';
import '/utils/utils.dart';

class NewsPage extends StatefulWidget {
  int categoryID;
  bool isReload;

  NewsPage({
    Key? key,
    required this.categoryID,
    required this.isReload,
  }) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final PostsController postsController = Get.put(PostsController());
  GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await postsController.fetchPosts(
        categoryId: widget.categoryID,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return newsList();
  }

  Widget newsList() {
    return Container(
      child: Obx(() {
        if (postsController.isLoading.value)
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).accentColor,
              ),
            ),
          );
        else
          return RefreshIndicator(
            key: refreshKey,
            onRefresh: () => postsController.fetchPosts(
              categoryId: widget.categoryID,
            ),
            child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: postsController.postsList.length,
                itemBuilder: (context, index) {
                  return NewsCard(model: postsController.postsList[index]);
                }),
          );
      }),
    );
  }
}
