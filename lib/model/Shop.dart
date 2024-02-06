class Shop {
  final String? dealerCode;
  final String? empCode;
  final String? shopName;
  final String? shopOwnerName;
  final String? managerName;
  final String? managerMobile;
  final String? masterDealerCode;
  final String? productGroup;
  final String? targetShop;
  final String? marketId;
  final String? routeId;
  final String? areaId;
  final String? zoneId;
  final String? regionId;
  final String? shopClass;
  final String? shopType;
  final String? shopChannel;
  final String? shopRouteType;
  final String? shopIdentity;
  final String? mobile;
  final String? shopAddress;
  final String? status;
  final String? otp;
  final String? latitude;
  final String? longitude;
  final String? picture;
  final String? pictureSm;
  final String? imageCompress;
  final String? copyDone;
  final String? entryBy;
  final String? entryAt;

  Shop({
    this.dealerCode,
    this.empCode,
    this.shopName,
    this.shopOwnerName,
    this.managerName,
    this.managerMobile,
    this.masterDealerCode,
    this.productGroup,
    this.targetShop,
    this.marketId,
    this.routeId,
    this.areaId,
    this.zoneId,
    this.regionId,
    this.shopClass,
    this.shopType,
    this.shopChannel,
    this.shopRouteType,
    this.shopIdentity,
    this.mobile,
    this.shopAddress,
    this.status,
    this.otp,
    this.latitude,
    this.longitude,
    this.picture,
    this.pictureSm,
    this.imageCompress,
    this.copyDone,
    this.entryBy,
    this.entryAt,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      dealerCode: json['dealer_code'],
      empCode: json['emp_code'],
      shopName: json['shop_name'],
      shopOwnerName: json['shop_owner_name'],
      managerName: json['manager_name'],
      managerMobile: json['manager_mobile'],
      masterDealerCode: json['master_dealer_code'],
      productGroup: json['product_group'],
      targetShop: json['target_shop'],
      marketId: json['market_id'],
      routeId: json['route_id'],
      areaId: json['area_id'],
      zoneId: json['zone_id'],
      regionId: json['region_id'],
      shopClass: json['shop_class'],
      shopType: json['shop_type'],
      shopChannel: json['shop_channel'],
      shopRouteType: json['shop_route_type'],
      shopIdentity: json['shop_identity'],
      mobile: json['mobile'],
      shopAddress: json['shop_address'],
      status: json['status'],
      otp: json['otp'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      picture: json['picture'],
      pictureSm: json['picture_sm'],
      imageCompress: json['image_compress'],
      copyDone: json['copy_done'],
      entryBy: json['entry_by'],
      entryAt: json['entry_at'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dealer_code': dealerCode,
      'emp_code': empCode,
      'shop_name': shopName,
      'shop_owner_name': shopOwnerName,
      'manager_name': managerName,
      'manager_mobile': managerMobile,
      'master_dealer_code': masterDealerCode,
      'product_group': productGroup,
      'target_shop': targetShop,
      'market_id': marketId,
      'route_id': routeId,
      'area_id': areaId,
      'zone_id': zoneId,
      'region_id': regionId,
      'shop_class': shopClass,
      'shop_type': shopType,
      'shop_channel': shopChannel,
      'shop_route_type': shopRouteType,
      'shop_identity': shopIdentity,
      'mobile': mobile,
      'shop_address': shopAddress,
      'status': status,
      'otp': otp,
      'latitude': latitude,
      'longitude': longitude,
      'picture': picture,
      'picture_sm': pictureSm,
      'image_compress': imageCompress,
      'copy_done': copyDone,
      'entry_by': entryBy,
      'entry_at': entryAt,
    };
  }
}
