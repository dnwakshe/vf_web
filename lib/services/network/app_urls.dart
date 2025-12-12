class AppUrls {
  static const String environment = 'DEV'; // App Environment
  static const String versionName = '1.0.0'; // App versionName
  static const String versionCode = '1'; // App versionCode

  // Will store all base URLs
  static dynamic baseEnvUrls = {
    'UAT': {'losBaseURL': ''},
    'LIVE': {'losBaseURL': ''}
  };

  // static dynamic baseURLs = baseEnvUrls[environment];
  // static dynamic baseURLsApiEngine = "https://apiengine.choicetechlab.com/";
<<<<<<< HEAD
  static dynamic baseURLs = "https://api.vfapp.choicetechlab.com/apis/";
  static dynamic imageBaseURLs = "https://api.vfapp.choicetechlab.com/apis";
=======
  static dynamic baseURLs = "https://shivmitra.choicetechlab.com/apis/";
  static dynamic imageBaseURLs = "https://shivmitra.choicetechlab.com/apis";
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853

  //Auth API's
  static String login = '${baseURLs}login';

  static String partyWings = '${baseURLs}partyWings-list';
  static String getPartyDesignationsList = "${baseURLs}party/designations";
  static String getMemberList = "${baseURLs}member/list";
  static String getLeadersList = "${baseURLs}ministers-list";

  //filter API
  static String getStateList = "${baseURLs}state/listing";
  static String getDistrictList = "${baseURLs}district-list";
  static String getConstituency = "${baseURLs}constituency-list";
  static String getTalukaList = "${baseURLs}taluka-list";
  static String getVillagesList = "${baseURLs}village-list";

}
