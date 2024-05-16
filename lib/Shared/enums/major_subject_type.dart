class MajorSubjectTypeUtils {

  static List<MajorSubjectType> majorSubjects = [
    MajorSubjectType.ALL,
    MajorSubjectType.HUMANITIES,
    MajorSubjectType.SOCIAL,
    MajorSubjectType.EDUCATION,
    MajorSubjectType.ENGINEERING,
    MajorSubjectType.NATURAL,
    MajorSubjectType.MEDICINE,
    MajorSubjectType.ARTS
  ];

  static String typeToString(MajorSubjectType type) {
    switch (type) {
      case MajorSubjectType.HUMANITIES:
        return '인문계열';
      case MajorSubjectType.SOCIAL:
        return '사회계열';
      case MajorSubjectType.EDUCATION:
        return '교육계열';
      case MajorSubjectType.ENGINEERING:
        return '공학계열';
      case MajorSubjectType.NATURAL:
        return '자연계열';
      case MajorSubjectType.MEDICINE:
        return '의약계열';
      case MajorSubjectType.ARTS:
        return '예체능계열';
      default:
        return '전체';
    }
  }
}

enum MajorSubjectType {
  ALL(""), // 전체
  HUMANITIES("100391"), // 인문계열
  SOCIAL("100392"), // 사회계열
  EDUCATION("100393"),  // 교육
  ENGINEERING("100394"),  // 공학
  NATURAL("100395"), //  자연
  MEDICINE("100396"),  //  의약
  ARTS("100397"); //  예체능

  final String key;

  const MajorSubjectType(this.key);
}
