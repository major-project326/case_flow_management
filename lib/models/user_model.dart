class User {
  final String id;
  final String name;
  final String phone;
  final String role;
  final String location;
  final String? designation;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.role,
    required this.location,
    this.designation,
  });
}
