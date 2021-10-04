class ServiceConstants {
  static const String apiKey = '97604a4cfe784fc7a9ae242ac28b2c87';
  static const String webUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';

  static String urlBuCountry(String country) {
    return 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$apiKey';
  }

  static const Map<String, String> countries = {
    "United States of America": "us",
    "Russia": "ru",
    "Türkiye": "tr",
    "Korea": "kr",
    "China": "ch"
  };
}
