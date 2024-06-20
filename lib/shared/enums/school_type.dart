class SchoolTypeUtils {
  static String typeToString(SchoolType type) {
    switch (type) {
      case SchoolType.ELEM:
        return '초등학교';
      case SchoolType.MIDD:
        return '중학교';
      case SchoolType.HIGH:
        return '고등학교';
      case SchoolType.UNIV:
        return '대학교';
      case SchoolType.SEET:
        return '특수학교';
      case SchoolType.ALTE:
        return '기타';
      default:
        return '';
    }
  }
}

enum SchoolType {
  ELEM("ELEM_LIST"),
  MIDD("MIDD_LIST"),
  HIGH("HIGH_LIST"),
  UNIV("UNIV_LIST"),
  SEET("SEET_LIST"),
  ALTE("ALTE_LIST");

  final String key;

  const SchoolType(this.key);
}
