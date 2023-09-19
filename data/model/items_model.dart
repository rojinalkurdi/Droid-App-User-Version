class ItemsModel {
  double itemsId;
  String itemsName;
  String itemsDesc;
  String itemsImage;
  double itemsCount;
  double itemsActive;
  double itemsPrice;
  double itemsDiscount;
  DateTime itemsDate;
  double itemsCat;
  double categoriesId;
  String categoriesName;
  String categoriesImage;
  DateTime categoriesDatetime;
  late String? favorite;
   double? itemsDiscountedPrice;
   //double? itemsDiscountedPrice;

  ItemsModel({
    required this.itemsId,
    required this.itemsName,
    required this.itemsDesc,
    required this.itemsImage,
    required this.itemsCount,
    required this.itemsActive,
    required this.itemsPrice,
    required this.itemsDiscount,
  required this.itemsDate,
    required this.itemsCat,
    required this.categoriesId,
    required this.categoriesName,
    required this.categoriesImage,
    required this.categoriesDatetime,
    this.favorite,
    this.itemsDiscountedPrice
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      itemsId: json["items_id"],
      itemsName: json["items_name"],
      itemsDesc: json["items_desc"],
      itemsImage: json["items_image"],
      itemsCount: json["items_count"],
      itemsActive: json["items_active"],
      itemsPrice: json["items_price"],
      itemsDiscount: json["items_discount"],
      itemsDate: DateTime.parse(json["items_date"]),
      itemsCat: json["items_cat"],
      categoriesId: json["categories_id"],
      categoriesName: json["categories_name"],
      categoriesImage: json["categories_image"],
      categoriesDatetime: DateTime.parse(json["categories_datetime"]),
      favorite: json["favorite"],
      itemsDiscountedPrice: json["items_discountedPrice"]
    );
  }

  Map<String, dynamic> toJson() => {
        "items_id": itemsId,
        "items_name": itemsName,
        "items_desc": itemsDesc,
        "items_image": itemsImage,
        "items_count": itemsCount,
        "items_active": itemsActive,
        "items_price": itemsPrice,
        "items_discount": itemsDiscount,
        "items_date": itemsDate.toIso8601String(),
        "items_cat": itemsCat,
        "categories_id": categoriesId,
        "categories_name": categoriesName,
        "categories_image": categoriesImage,
        "categories_datetime": categoriesDatetime.toIso8601String(),
        "favorite": favorite,
      };
}
