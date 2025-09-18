import "dart:convert";

IcecreamData icecreamDataFromJson(String str) {
  final jsonData = json.decode(str);
  return IcecreamData.fromJson(jsonData);
}

String icecreamDataToJson(IcecreamData data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class IcecreamData {
  List<Icecream>? icecreams;

  IcecreamData({this.icecreams});

  factory IcecreamData.fromJson(Map<String, dynamic> json) => new IcecreamData(
    icecreams: List<Icecream>.from(
      json["icecreams"].map((x) => Icecream.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "icecreams": List<dynamic>.from(icecreams!.map((x) => x.toJson())),
  };
}

class Icecream {
  String flavor;
  String? description;
  List<String>? toppings;
  List<Ingredient> ingredients;
  double price;
  String? image;

  Icecream({
    required this.flavor,
    this.description,
    this.toppings,
    required this.ingredients,
    required this.price,
    this.image,
  });

  factory Icecream.fromJson(Map<String, dynamic> json) => Icecream(
    flavor: json["flavor"],
    description: json["description"],
    toppings:
        json["toppings"] != null
            ? List<String>.from(json["toppings"].map((x) => x))
            : null,
    ingredients: List<Ingredient>.from(
      json["ingredients"].map((x) => Ingredient.fromJson(x)),
    ),

    price: (json["price"]),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "flavor": flavor,
    "description": description,
    "toppings":
        toppings != null ? List<dynamic>.from(toppings!.map((x) => x)) : null,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
    "price": price,
    "image": image,
  };
}

class Ingredient {
  String name;
  String quantity;

  Ingredient({required this.name, required this.quantity});

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      Ingredient(name: json["name"], quantity: json["quantity"]);

  Map<String, dynamic> toJson() => {"name": name, "quantity": quantity};
}
