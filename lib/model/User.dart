class User {
  final String userId;
  final String user;
  final String password;
  final String fullName;
  final String mobile;
  final String dealerCode;
  final String regionId;
  final String zoneId;
  final String areaId;
  final String regionName;
  final String zoneName;
  final String areaName;
  final String userImage;

  User({
    required this.userId,
    required this.user,
    required this.password,
    required this.fullName,
    required this.mobile,
    required this.dealerCode,
    required this.regionId,
    required this.zoneId,
    required this.areaId,
    required this.regionName,
    required this.zoneName,
    required this.areaName,
    required this.userImage,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      user: json['user'],
      password: json['password'],
      fullName: json['full_name'],
      mobile: json['mobile'],
      dealerCode: json['dealer_code'],
      regionId: json['region_id'],
      zoneId: json['zone_id'],
      areaId: json['area_id'],
      regionName: json['region_name'],
      zoneName: json['zone_name'],
      areaName: json['area_name'],
      userImage: json['user_image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'user': user,
      'password': password,
      'full_name': fullName,
      'mobile': mobile,
      'dealer_code': dealerCode,
      'region_id': regionId,
      'zone_id': zoneId,
      'area_id': areaId,
      'region_name': regionName,
      'zone_name': zoneName,
      'area_name': areaName,
      'user_image': userImage,
    };
  }
}
