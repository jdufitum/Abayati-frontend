//product

class Product {
  final String? id;
  final String? name;
  final String? description;
  final dynamic category;
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
        category: json["category"] == null
            ? null
            : json["category"] is String
                ? json["category"]
                : Category.fromJson(json["category"]),
        price: json["price"],
        imgUrl: json["imgUrl"],
        embedding: json["embedding"] == null
            ? []
            : List<dynamic>.from(json["embedding"]!.map((x) => x)),
        sizeVariations: json["sizeVariations"] == null
            ? []
            : List<dynamic>.from(json["sizeVariations"]!.map((x) => x)),
        materialDetails: json["materialDetails"] == null
            ? []
            : List<dynamic>.from(json["materialDetails"]!.map((x) => x)),
        colorVariations: json["colorVariations"] == null
            ? []
            : List<dynamic>.from(json["colorVariations"]!.map((x) => x)),
        ratingAndReviews: json["ratingAndReviews"] == null
            ? []
            : List<dynamic>.from(json["ratingAndReviews"]!.map((x) => x)),
        v: json["__v"],
      );
}

//category

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
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}

// class Wishlist {
//   final String? id;
//   final String? name;
//   final String? description;
//   final String? category;
//   final int? price;
//   final String? imgUrl;
//   final List<dynamic>? embedding;
//   final List<dynamic>? sizeVariations;
//   final List<dynamic>? materialDetails;
//   final List<dynamic>? colorVariations;
//   final List<dynamic>? ratingAndReviews;
//   final int? v;
//
//   Wishlist({
//     this.id,
//     this.name,
//     this.description,
//     this.category,
//     this.price,
//     this.imgUrl,
//     this.embedding,
//     this.sizeVariations,
//     this.materialDetails,
//     this.colorVariations,
//     this.ratingAndReviews,
//     this.v,
//   });
//
//   factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
//         id: json["_id"],
//         name: json["name"],
//         description: json["description"],
//         category: json["category"],
//         price: json["price"],
//         imgUrl: json["imgUrl"],
//         embedding: json["embedding"] == null
//             ? []
//             : List<dynamic>.from(json["embedding"]!.map((x) => x)),
//         sizeVariations: json["sizeVariations"] == null
//             ? []
//             : List<dynamic>.from(json["sizeVariations"]!.map((x) => x)),
//         materialDetails: json["materialDetails"] == null
//             ? []
//             : List<dynamic>.from(json["materialDetails"]!.map((x) => x)),
//         colorVariations: json["colorVariations"] == null
//             ? []
//             : List<dynamic>.from(json["colorVariations"]!.map((x) => x)),
//         ratingAndReviews: json["ratingAndReviews"] == null
//             ? []
//             : List<dynamic>.from(json["ratingAndReviews"]!.map((x) => x)),
//         v: json["__v"],
//       );
// }

// cart
class Cart {
  final ProductId? productId;
  final int? quantity;
  final String? id;

  Cart({
    this.productId,
    this.quantity,
    this.id,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        productId: json["productId"] == null
            ? null
            : ProductId.fromJson(json["productId"]),
        quantity: json["quantity"],
        id: json["_id"],
      );
}

//product id
class ProductId {
  final String? id;
  final String? name;
  final String? description;
  final String? category;
  final int? price;
  final String? imgUrl;
  final List<double>? embedding;
  final List<dynamic>? sizeVariations;
  final List<dynamic>? materialDetails;
  final List<dynamic>? colorVariations;
  final List<dynamic>? ratingAndReviews;
  final int? v;

  ProductId({
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

  factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        category: json["category"],
        price: json["price"],
        imgUrl: json["imgUrl"],
        embedding: json["embedding"] == null
            ? []
            : List<double>.from(json["embedding"]!.map((x) => x?.toDouble())),
        sizeVariations: json["sizeVariations"] == null
            ? []
            : List<dynamic>.from(json["sizeVariations"]!.map((x) => x)),
        materialDetails: json["materialDetails"] == null
            ? []
            : List<dynamic>.from(json["materialDetails"]!.map((x) => x)),
        colorVariations: json["colorVariations"] == null
            ? []
            : List<dynamic>.from(json["colorVariations"]!.map((x) => x)),
        ratingAndReviews: json["ratingAndReviews"] == null
            ? []
            : List<dynamic>.from(json["ratingAndReviews"]!.map((x) => x)),
        v: json["__v"],
      );
}

//stores
class ProductStore {
  final String? id;
  final String? name;
  final List<Category>? categories;
  final List<Product>? products;
  final String? description;
  final String? imgUrl;
  final List<dynamic>? ratingAndReviews;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  ProductStore({
    this.id,
    this.name,
    this.categories,
    this.products,
    this.description,
    this.imgUrl,
    this.ratingAndReviews,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ProductStore.fromJson(Map<String, dynamic> json) => ProductStore(
        id: json["_id"],
        name: json["name"],
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
        description: json["description"],
        imgUrl: json["imgUrl"],
        ratingAndReviews: json["ratingAndReviews"] == null
            ? []
            : List<dynamic>.from(json["ratingAndReviews"]!.map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}
