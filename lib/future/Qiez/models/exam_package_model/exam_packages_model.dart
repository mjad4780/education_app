//model
class ExamPackagesModel {
  List<Data>? data;
  int? statusCode;
  Meta? meta;

  ExamPackagesModel({this.data, this.statusCode, this.meta});

  ExamPackagesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    statusCode = json['status_code'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = statusCode;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  int? price;
  String? description;
  String? image;
  int? examsCount;
  int? discountPrice;
  int? wishlist;

  Data(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.image,
      this.examsCount,
      this.discountPrice,
      this.wishlist});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    examsCount = json['exams_count'];
    discountPrice = json['discount_price'];
    wishlist = json['wishlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['image'] = image;
    data['exams_count'] = examsCount;
    data['discount_price'] = discountPrice;
    data['wishlist'] = wishlist;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? itemsCount;
  int? pagesCount;

  Meta({this.currentPage, this.itemsCount, this.pagesCount});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    itemsCount = json['items_count'];
    pagesCount = json['pages_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['items_count'] = itemsCount;
    data['pages_count'] = pagesCount;
    return data;
  }
}
