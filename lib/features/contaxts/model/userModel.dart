class UserModel {
  String name;
  String id;
  String email;
  String password;
  String phoneNumber; 
  String about;
  String createdAt; 
  String aboutLastActivated;  
  String pushToken;
  bool online;  

  // Constructor
  UserModel({
    required this.name,
    required this.id,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.about,
    required this.createdAt,
    required this.aboutLastActivated,
    required this.pushToken,
    required this.online,
  });

  // fromJson method to create an instance from a map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      about: json['about'] ?? '',
      createdAt: json['createdAt'] ?? '',
      aboutLastActivated: json['aboutLastActivated'] ?? '',
      pushToken: json['pushToken'] ?? '',
      online: json['online'] ?? false,
    );
  }

  // toJson method to convert an instance to a map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'about': about,
      'createdAt': createdAt,
      'aboutLastActivated': aboutLastActivated,
      'pushToken': pushToken,
      'online': online,
    };
  }
}
