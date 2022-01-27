class UserTest {
  final String firstName;
  final String lastName;
  final int age;

  const UserTest({
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  UserTest copy({
    String? firstName,
    String? lastName,
    int? age,
  }) =>
      UserTest(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        age: age ?? this.age,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserTest &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          age == other.age;

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ age.hashCode;
}
