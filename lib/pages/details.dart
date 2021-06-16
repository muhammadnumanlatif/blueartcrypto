import '/utils/utils.dart';
import '/utils/packages.dart';
import 'package:flutter_html/flutter_html.dart';

class HomeDetailsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: Theme.of(context).iconTheme,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: 'mainPic',
                  child: Image.network(
                    BCIUtils.crptoImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0.0,
              expandedHeight: MediaQuery.of(context).size.height * 0.3,
            ),
            SliverFillRemaining(
              child: detailSection(context),
            ),
          ],
        ),
      ),
    );
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
              '07 June 2021',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BCIUtils.sizedBoxHeight(context, 0.015),
          Text(
            'AltCoin',
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
            child: Html(
              style: {
                //'p': Colors.amber,
              },
              data: "<p>Description</p>",
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
              'Altcoin',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              //*day night
              Icon(Icons.lightbulb),
              BCIUtils.sizedBoxWidth(context, 0.05),
              Icon(Icons.bookmark),
              BCIUtils.sizedBoxWidth(context, 0.05),
            ],
          ),
        ),
      ],
    );
  }
}
