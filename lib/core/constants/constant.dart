class Constant {
  Constant._();

  factory Constant() => _singleton;

  static final Constant _singleton = Constant._();

  String get meroshareLink => "https://meroshare.cdsc.com.np/#/login";
  String get ipoResult => "https://iporesult.cdsc.com.np/";
}
