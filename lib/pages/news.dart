import '/utils/controllers.dart';
import '/utils/packages.dart';
import '/utils/widgets.dart';

// ignore: must_be_immutable
class NewsPage extends StatefulWidget {
  int categoryID;
  bool isReload;
  int totalRecords;

  NewsPage({
  
  required this.categoryID,
  required this.isReload,
  required this.totalRecords,
  });

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final PostsController postsController = Get.put(PostsController());
  GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();
  ScrollController _scrollController = ScrollController();
  int _page = 1;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      if (widget.isReload) {
        await postsController.fetchPosts(
          categoryId: widget.categoryID,
          pageNumber: 1,
          totalRecords: widget.totalRecords,
        );
      }
    });
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        await postsController.fetchPosts(
          pageNumber: ++_page,
          totalRecords: widget.totalRecords,
          categoryId: widget.categoryID,
        );
      }
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
                controller: _scrollController,
                itemBuilder: (context, index) {
                  if ((index == postsController.postsList.length -1) &&
                      postsController.postsList.length < widget.totalRecords) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).accentColor,
                        ),
                      ),
                    );
                  }
                  return NewsCard(model: postsController.postsList[index]);
                }),
          );
      }),
    );
  }
}
