class LogoModel {
  Status status;
  Data data;

  LogoModel({
    required this.status,
    required this.data,
  });

}

class Data {
  The1923 the1923;

  Data({
    required this.the1923,
  });

}

class The1923 {
  dynamic id;
  dynamic name;
  dynamic symbol;
  dynamic category;
  dynamic description;
  dynamic slug;
  dynamic logo;
  dynamic subreddit;
  dynamic notice;
  List<dynamic>? tags;
  List<dynamic>? tagNames;
  List<dynamic>? tagGroups;
  Urls? urls;
  dynamic platform;
  DateTime? dateAdded;
  String? twitterUsername;
  int? isHidden;
  dynamic dateLaunched;
  List<dynamic>? contractAddress;
  dynamic selfReportedCirculatingSupply;
  dynamic selfReportedTags;
  dynamic selfReportedMarketCap;
  dynamic infiniteSupply;

  The1923({
    this.id,
    this.name,
    this.symbol,
    this.category,
    this.description,
    this.slug,
    required this.logo,
    this.subreddit,
    this.notice,
    this.tags,
    this.tagNames,
    this.tagGroups,
    this.urls,
    this.platform,
    this.dateAdded,
    this.twitterUsername,
    this.isHidden,
    this.dateLaunched,
    this.contractAddress,
    this.selfReportedCirculatingSupply,
    this.selfReportedTags,
    this.selfReportedMarketCap,
    this.infiniteSupply,
  });

}

class Urls {
  List<String> website;
  List<String> twitter;
  List<dynamic> messageBoard;
  List<String> chat;
  List<dynamic> facebook;
  List<dynamic> explorer;
  List<String> reddit;
  List<String> technicalDoc;
  List<String> sourceCode;
  List<String> announcement;

  Urls({
    required this.website,
    required this.twitter,
    required this.messageBoard,
    required this.chat,
    required this.facebook,
    required this.explorer,
    required this.reddit,
    required this.technicalDoc,
    required this.sourceCode,
    required this.announcement,
  });

}

class Status {
  DateTime timestamp;
  int errorCode;
  dynamic errorMessage;
  int elapsed;
  int creditCount;
  dynamic notice;

  Status({
    required this.timestamp,
    required this.errorCode,
    required this.errorMessage,
    required this.elapsed,
    required this.creditCount,
    required this.notice,
  });

}
