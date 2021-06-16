import '/utils/packages.dart';
import 'package:intl/intl.dart';

List<NewsModel> postsFromJson(String str) => List<NewsModel>.from(
      json.decode(str).map(
            (x) => NewsModel.fromJson(x),
          ),
    );

NewsModel postDetailsFromJson(String str) =>
    NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.id,
    this.title,
    this.imageUrl,
    this.postDate,
    this.categoryId,
    this.categoryName,
    this.postContent,
  });

  int? id;
  String? title;
  String? imageUrl;
  String? postDate;
  int? categoryId;
  String? categoryName;
  String? postContent;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["id"],
        title: json["title"],
        imageUrl: json["image_url"],
        postDate: DateFormat("dd-MM-yyyy").format(
          DateTime.parse(json["post_date"]),
        ),
        categoryName: json["category_name"],
        postContent: json["post_content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image_url": imageUrl,
        "post_date": postDate,
        "category_id": categoryId,
        "category_name": categoryName,
        "post_content": postContent,
      };
}