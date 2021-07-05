import '/utils/utils.dart';
import '/utils/packages.dart';
import '/utils/controllers.dart';
import 'package:flutter_html/flutter_html.dart';

class HomeDetailsPage extends StatelessWidget {
  final PostDetailController newsDetailController =
      Get.put(PostDetailController());

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      await newsDetailController.fetchPostDetail(Get.arguments);
    });
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: Theme.of(context).iconTheme,
              // flexibleSpace: FlexibleSpaceBar(
              //   background: Hero(
              //     tag: 'BCIUtils.crptoImage',
              //     child: Image.network(
              //       BCIUtils.crptoImage,
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              title: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  BCIUtils.title,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: backgroundImage(context),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0.0,
              expandedHeight: MediaQuery.of(context).size.height * 0.3,
            ),
            SliverFillRemaining(
              // child: detailSection(context),
              child: Obx(() {
                if (newsDetailController.isLoading.value) {
                  return Center(
                    child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).accentColor,
                      ),
                    ),
                  );
                } else {
                  return detailSection(context);
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget backgroundImage(BuildContext context) {
    return Obx(() {
      if (newsDetailController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).accentColor,
            ),
          ),
        );
      } else {
        return Hero(
          tag: newsDetailController.postsModel.value.title.toString(),
          child: Image.network(
            newsDetailController.postsModel.value.imageUrl.toString(),
            fit: BoxFit.cover,
          ),
        );
      }
    });
  }

  //*detail section
  Widget detailSection(context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          rowPrime(context),
          BCIUtils.sizedBoxHeight(context, 0.015),
          BCIUtils.iconText(
            context,
            Icon(Icons.timer),
            Text(
              newsDetailController.postsModel.value.postedDate.toString(),
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BCIUtils.sizedBoxHeight(context, 0.015),
          Text(
            newsDetailController.postsModel.value.title.toString(),
            style: TextStyle(
              color: Theme.of(context).accentColor.withOpacity(0.5),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Divider(
              thickness: 2,
              color: Theme.of(context).accentColor.withOpacity(0.5),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Html(
                  style: {
                    "p": Style(
                      fontSize: FontSize.large,
                      color: Colors.amber,
                    ),
                    "h2": Style(
                      // fontSize: FontSize.medium,
                      fontWeight: FontWeight.bold,

                      fontSize: FontSize.xLarge,

                      color: Colors.amber,
                    ),
                    "h3": Style(
                      // fontSize: FontSize.medium,
                      fontSize: FontSize.large,
                      fontWeight: FontWeight.bold,

                      color: Colors.amber,
                    ),
                  
                    "ul": Style(
                      // fontSize: FontSize.medium,
                      fontSize: FontSize.large,
                      fontWeight: FontWeight.bold,

                      color: Colors.amber,
                    ),
                    "a": Style(
                      // fontSize: FontSize.medium,
                      fontSize: FontSize.large,
                      fontWeight: FontWeight.bold,

                      // fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  },
                  data: newsDetailController.postsModel.value.postContent.toString(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //*prime
  Widget rowPrime(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              newsDetailController.postsModel.value.categoryName.toString(),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.topLeft,
        //   child: Row(
        //     children: [
        //       //*day night
        //       Icon(Icons.lightbulb),
        //       BCIUtils.sizedBoxWidth(context, 0.05),
        //       Icon(Icons.bookmark),
        //       BCIUtils.sizedBoxWidth(context, 0.05),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
