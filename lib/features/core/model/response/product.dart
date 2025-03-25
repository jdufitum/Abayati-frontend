class Product {
  final String? id;
  final String? name;
  final String? description;
  final Category? category;
  final int? price;
  final String? imgUrl;
  final List<dynamic>? embedding;
  final List<dynamic>? sizeVariations;
  final List<dynamic>? materialDetails;
  final List<dynamic>? colorVariations;
  final List<dynamic>? ratingAndReviews;
  final int? v;

  Product({
    this.id,
    this.name,
    this.description,
    this.category,
    this.price,
    this.imgUrl,
    this.embedding,
    this.sizeVariations,
    this.materialDetails,
    this.colorVariations,
    this.ratingAndReviews,
    this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    price: json["price"],
    imgUrl: json["imgUrl"],
    embedding: json["embedding"] == null ? [] : List<dynamic>.from(json["embedding"]!.map((x) => x)),
    sizeVariations: json["sizeVariations"] == null ? [] : List<dynamic>.from(json["sizeVariations"]!.map((x) => x)),
    materialDetails: json["materialDetails"] == null ? [] : List<dynamic>.from(json["materialDetails"]!.map((x) => x)),
    colorVariations: json["colorVariations"] == null ? [] : List<dynamic>.from(json["colorVariations"]!.map((x) => x)),
    ratingAndReviews: json["ratingAndReviews"] == null ? [] : List<dynamic>.from(json["ratingAndReviews"]!.map((x) => x)),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "category": category?.toJson(),
    "price": price,
    "imgUrl": imgUrl,
    "embedding": embedding == null ? [] : List<dynamic>.from(embedding!.map((x) => x)),
    "sizeVariations": sizeVariations == null ? [] : List<dynamic>.from(sizeVariations!.map((x) => x)),
    "materialDetails": materialDetails == null ? [] : List<dynamic>.from(materialDetails!.map((x) => x)),
    "colorVariations": colorVariations == null ? [] : List<dynamic>.from(colorVariations!.map((x) => x)),
    "ratingAndReviews": ratingAndReviews == null ? [] : List<dynamic>.from(ratingAndReviews!.map((x) => x)),
    "__v": v,
  };
}

class Category {
  final String? id;
  final String? name;
  final String? imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Category({
    this.id,
    this.name,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    name: json["name"],
    imageUrl: json["imageUrl"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "imageUrl": imageUrl,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}