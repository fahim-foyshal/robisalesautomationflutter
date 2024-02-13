class ItemInfo {
  final String? itemId;
  final String? itemName;
  final String? itemNameShort;
  final String? itemGroup;
  final String? categoryId;
  final String? subcategoryId;
  final String? finishGoodsCode;
  final String? unitName;
  final String? packSize;
  final String? tPrice;
  final String? nspPer;
  final String? salesItemType;
  final String? itemStock;
  String? totalAmount; // Define totalAmount as a nullable String
  String? totalQuantity; // Define totalQuantity as a nullable String

  ItemInfo(
      {this.itemId,
      this.itemName,
      this.itemNameShort,
      this.itemGroup,
      this.categoryId,
      this.subcategoryId,
      this.finishGoodsCode,
      this.unitName,
      this.packSize,
      this.tPrice,
      this.nspPer,
      this.salesItemType,
      this.totalAmount,
      this.totalQuantity,
      this.itemStock});

  // Add a setter for totalAmount
  setTotalAmount(String? amount) {
    totalAmount = amount;
  }

  // Add a setter for totalQuantity
  setTotalQuantity(String? quantity) {
    totalQuantity = quantity;
  }

  factory ItemInfo.fromJson(Map<String, dynamic> json) {
    return ItemInfo(
      itemId: json['item_id'],
      itemName: json['item_name'],
      itemNameShort: json['item_name_short'],
      itemGroup: json['item_group'],
      categoryId: json['category_id'],
      subcategoryId: json['subcategory_id'],
      finishGoodsCode: json['finish_goods_code'],
      unitName: json['unit_name'],
      packSize: json['pack_size'],
      tPrice: json['t_price'],
      nspPer: json['nsp_per'],
      salesItemType: json['sales_item_type'],
      totalAmount: json['total_amount'],
      totalQuantity: json['total_quantity'],
      itemStock: json['item_stock'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'item_id': itemId,
      'item_name': itemName,
      'item_name_short': itemNameShort,
      'item_group': itemGroup,
      'category_id': categoryId,
      'subcategory_id': subcategoryId,
      'finish_goods_code': finishGoodsCode,
      'unit_name': unitName,
      'pack_size': packSize,
      't_price': tPrice,
      'nsp_per': nspPer,
      'sales_item_type': salesItemType,
      'total_amount': totalAmount,
      'total_quantity': totalQuantity,
    };
  }
}
