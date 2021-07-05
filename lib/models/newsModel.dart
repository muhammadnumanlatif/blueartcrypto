import '/utils/packages.dart';
import 'package:intl/intl.dart';

List<NewsModel> postsFromJson(String str) => List<NewsModel>.from(
      json.decode(str).map(
            (x) => NewsModel.fromJson(x),
          ),
    );

NewsModel postDetailsFromJson(String str) =>
    NewsModel.fromJson(json.decode(str));

// String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.id,
    this.title,
    this.imageUrl,
    this.postedDate,
    this.categoryId,
    this.categoryName,
    this.postContent,
  });

  int? id;
  String? title;
  String? imageUrl;
  String? postedDate;
  int? categoryId;
  String? categoryName;
  String? postContent;

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // title = json['title'];
       if (json['title']!=false) {
      title = json['title'];
    }
    // imageUrl = json['image_url'];
    if (json['image_url']!=false) {
      imageUrl = json['image_url'];
    }
    postedDate = DateFormat("dd-MM-yyyy").format(DateTime.parse(
      json["post_date"],
    ));
    categoryName = json['category_name'];
    if (json['post_content']!=null) {
      postContent = json['post_content'];
    }
  }

  // factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
  //       id: json["id"],
  //       title: json["title"],
  //       imageUrl: json["image_url"],
  //       postedDate: DateFormat("dd-MM-yyyy").format(
  //         DateTime.parse(json["post_date"]),
  //       ),
  //       categoryName: json["category_name"],

  //       postContent: json["post_content"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "title": title,
  //       "image_url": imageUrl,
  //       "post_date": postedDate,
  //       "category_id": categoryId,
  //       "category_name": categoryName,
  //       "post_content": postContent,
  //     };
}
