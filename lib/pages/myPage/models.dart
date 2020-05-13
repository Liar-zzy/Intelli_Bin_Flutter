class Profile {
  String firstName;
  String lastName;
  String location;
  String numberOfFollowers;
  int numberFollowing;
  int totalLikes;

  String get fullName => "$firstName $lastName";

  String get numberOfFollowersString => _getA(numberOfFollowers);

  String get numberFollowingString => _abbreviatedCount(numberFollowing);

  String get totalLikesString => _abbreviatedCount(totalLikes);

  String _getA(String A) {
    return A;
  }

  String _abbreviatedCount(int num) {
    if (num < 1000) return "$num";
    if (num >= 1000 && num < 1000000) {
      String s = (num / 1000).toStringAsFixed(1);
      if (s.endsWith(".0")) {
        int idx = s.indexOf(".0");
        s = s.substring(0, idx);
      }
      return "${s}K";
    } else if (num >= 1000000 && num < 1000000000) {
      String s = (num / 1000000).toStringAsFixed(1);
      if (s.endsWith(".0")) {
        int idx = s.indexOf(".0");
        s = s.substring(0, idx);
      }
      return "${s}M";
    }
    return "";
  }
}

Profile getProfile() {
  return new Profile()
    ..firstName = "张"
    ..lastName = "振源"
    ..location = "NanJing"
    ..numberOfFollowers = "5H 32M"
    ..numberFollowing = 924
    ..totalLikes = 1700;
}
