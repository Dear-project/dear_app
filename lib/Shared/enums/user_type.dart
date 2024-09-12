class UserTypeUtils {
  static String typeToString(UserType type) {
    switch (type) {
      case UserType.STUDENT:
        return '학생';
      case UserType.PROFESSOR:
        return '교수';
      default:
        return '';
    }
  }
}

enum UserType {
  STUDENT("STUDENT"),
  PROFESSOR("PROFESSOR");

  final String key;

  const UserType(this.key);
}
