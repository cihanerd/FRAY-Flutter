class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  bool? isPasswordPresent;
  dynamic oldPassword;
  dynamic password;
  String? passwordUpdatedAt;
  int? type;
  DateTime? expiresAt;
  String? createdAt;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.isPasswordPresent,
    this.oldPassword,
    this.password,
    this.passwordUpdatedAt,
    this.type,
    this.expiresAt,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        email: json['email'] as String?,
        isPasswordPresent: json['is_password_present'] as bool?,
        oldPassword: json['old_password'],
        password: json['password'],
        passwordUpdatedAt: json['password_updated_at'] as String?,
        type: json['type'] as int?,
        expiresAt: json['expires_at'] == null
            ? null
            : DateTime.parse(json['expires_at'] as String),
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'is_password_present': isPasswordPresent,
        'old_password': oldPassword,
        'password': password,
        'password_updated_at': passwordUpdatedAt,
        'type': type,
        'expires_at': expiresAt?.toIso8601String(),
        'created_at': createdAt,
      };
}
