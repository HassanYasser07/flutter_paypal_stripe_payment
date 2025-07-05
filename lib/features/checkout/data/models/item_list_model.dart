class ItemListModel {
  final List<CartItem> items;

  ItemListModel({required this.items});

  factory ItemListModel.fromJson(Map<String, dynamic> json) {
    return ItemListModel(
      items: (json['items'] as List)
          .map((item) => CartItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

class CartItem {
  final String name;
  final int quantity;
  final String price;
  final String currency;

  CartItem({
    required this.name,
    required this.quantity,
    required this.price,
    required this.currency,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      price: json['price'] as String,
      currency: json['currency'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'currency': currency,
    };
  }
}
