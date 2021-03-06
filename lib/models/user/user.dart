class User {
  int id, deviceId;
  String fullName,
      email,
      password,
      city,
      address,
      phone,
      deviceUsername,
      devicePassword,
      image;

  User(
      {this.id = 0,
      this.deviceId = 0,
      this.fullName = '',
      this.email = '',
      this.password = '',
      this.city = '',
      this.address = '',
      this.phone = '',
      this.deviceUsername = '',
      this.devicePassword = '',
      this.image = ''});

  factory User.formJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        deviceId: json['device_id'],
        fullName: json['full_name'],
        email: json['email'],
        password: json['password'],
        city: json['city'],
        address: json['address'],
        phone: json['phone'],
        deviceUsername: json['pin_username'],
        image: json['image'],
        devicePassword: json['pin_password']);
  }
}
