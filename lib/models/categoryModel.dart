import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
      json.decode(str).map(
            (x) => CategoryModel.fromJson(x),
          ),
    );

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.id,
    this.count,
    this.description,
    this.link,
    required this.name,
    this.slug,
    this.taxonomy,
    this.parent,
    // this.meta,
    //this.yoastHead,
    //this.links,
  });

 int id;
  int? count;
  String? description;
  String? link;
  String name;
  String? slug;
  String? taxonomy;
  int? parent;
//    List<dynamic> ?meta;
  //  String        ?yoastHead;
  // Links         ?links;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        count: json["count"],
        description: json["description"],
        link: json["link"],
        name: json["name"],
        slug: json["slug"],
        taxonomy: json["taxonomy"],
        parent: json["parent"],
        //    meta: List<dynamic>.from(json["meta"].map((x) => x)),
        //  yoastHead: json["yoast_head"],
        // links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "count": count,
        "description": description,
        "link": link,
        "name": name,
        "slug": slug,
        "taxonomy": taxonomy,
        "parent": parent,
        //"meta": List<dynamic>.from(meta.map((x) => x)),
        //"yoast_head": yoastHead,
        //"_links": links.toJson(),
      };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.about,
    this.wpPostType,
    this.curies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<About>? wpPostType;
  List<Cury>? curies;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection:
            List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        wpPostType: List<About>.from(
            json["wp:post_type"].map((x) => About.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //     "self": List<dynamic>.from(self.map((x) => x.toJson())),
  //     "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
  //     "about": List<dynamic>.from(about.map((x) => x.toJson())),
  //     "wp:post_type": List<dynamic>.from(wpPostType.map((x) => x.toJson())),
  //     "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
  // };
}

class About {
  About({
    this.href,
  });

  String? href;

  factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  String? name;
  String? href;
  bool? templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: json["name"],
        href: json["href"],
        templated: json["templated"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "href": href,
        "templated": templated,
      };
}
