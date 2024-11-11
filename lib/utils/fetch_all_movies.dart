import 'dart:convert';
import 'package:http/http.dart' as http;

class Example {
  double? score;
  Show? show;

  Example({this.score, this.show});

  Example.fromJson(Map<String, dynamic> json) {
    score = json["score"];
    show = json["show"] == null ? null : Show.fromJson(json["show"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["score"] = score;
    if (show != null) {
      _data["show"] = show?.toJson();
    }
    return _data;
  }
}

class Show {
  int? id;
  String? url;
  String? name;
  String? type;
  String? language;
  List<String>? genres;
  String? status;
  int? runtime;
  int? averageRuntime;
  String? premiered;
  dynamic ended;
  String? officialSite;
  Schedule? schedule;
  Rating? rating;
  int? weight;
  Network? network;
  dynamic webChannel;
  dynamic dvdCountry;
  Externals? externals;
  Image? image;
  String? summary;
  int? updated;
  Links? links;

  Show(
      {this.id,
      this.url,
      this.name,
      this.type,
      this.language,
      this.genres,
      this.status,
      this.runtime,
      this.averageRuntime,
      this.premiered,
      this.ended,
      this.officialSite,
      this.schedule,
      this.rating,
      this.weight,
      this.network,
      this.webChannel,
      this.dvdCountry,
      this.externals,
      this.image,
      this.summary,
      this.updated,
      this.links});

  Show.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    url = json["url"];
    name = json["name"];
    type = json["type"];
    language = json["language"];
    genres = json["genres"] == null ? null : List<String>.from(json["genres"]);
    status = json["status"];
    runtime = json["runtime"];
    averageRuntime = json["averageRuntime"];
    premiered = json["premiered"];
    ended = json["ended"];
    officialSite = json["officialSite"];
    schedule =
        json["schedule"] == null ? null : Schedule.fromJson(json["schedule"]);
    rating = json["rating"] == null ? null : Rating.fromJson(json["rating"]);
    weight = json["weight"];
    network =
        json["network"] == null ? null : Network.fromJson(json["network"]);
    webChannel = json["webChannel"];
    dvdCountry = json["dvdCountry"];
    externals = json["externals"] == null
        ? null
        : Externals.fromJson(json["externals"]);
    image = json["image"] == null ? null : Image.fromJson(json["image"]);
    summary = json["summary"];
    updated = json["updated"];
    links = json["_links"] == null ? null : Links.fromJson(json["_links"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["url"] = url;
    _data["name"] = name;
    _data["type"] = type;
    _data["language"] = language;
    if (genres != null) {
      _data["genres"] = genres;
    }
    _data["status"] = status;
    _data["runtime"] = runtime;
    _data["averageRuntime"] = averageRuntime;
    _data["premiered"] = premiered;
    _data["ended"] = ended;
    _data["officialSite"] = officialSite;
    if (schedule != null) {
      _data["schedule"] = schedule?.toJson();
    }
    if (rating != null) {
      _data["rating"] = rating?.toJson();
    }
    _data["weight"] = weight;
    if (network != null) {
      _data["network"] = network?.toJson();
    }
    _data["webChannel"] = webChannel;
    _data["dvdCountry"] = dvdCountry;
    if (externals != null) {
      _data["externals"] = externals?.toJson();
    }
    if (image != null) {
      _data["image"] = image?.toJson();
    }
    _data["summary"] = summary;
    _data["updated"] = updated;
    if (links != null) {
      _data["_links"] = links?.toJson();
    }
    return _data;
  }
}

class Links {
  Self? self;
  Previousepisode? previousepisode;

  Links({this.self, this.previousepisode});

  Links.fromJson(Map<String, dynamic> json) {
    self = json["self"] == null ? null : Self.fromJson(json["self"]);
    previousepisode = json["previousepisode"] == null
        ? null
        : Previousepisode.fromJson(json["previousepisode"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (self != null) {
      _data["self"] = self?.toJson();
    }
    if (previousepisode != null) {
      _data["previousepisode"] = previousepisode?.toJson();
    }
    return _data;
  }
}

class Previousepisode {
  String? href;
  String? name;

  Previousepisode({this.href, this.name});

  Previousepisode.fromJson(Map<String, dynamic> json) {
    href = json["href"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["href"] = href;
    _data["name"] = name;
    return _data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json["href"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["href"] = href;
    return _data;
  }
}

class Image {
  String? medium;
  String? original;

  Image({this.medium, this.original});

  Image.fromJson(Map<String, dynamic> json) {
    medium = json["medium"];
    original = json["original"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["medium"] = medium;
    _data["original"] = original;
    return _data;
  }
}

class Externals {
  dynamic tvrage;
  int? thetvdb;
  String? imdb;

  Externals({this.tvrage, this.thetvdb, this.imdb});

  Externals.fromJson(Map<String, dynamic> json) {
    tvrage = json["tvrage"];
    thetvdb = json["thetvdb"];
    imdb = json["imdb"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["tvrage"] = tvrage;
    _data["thetvdb"] = thetvdb;
    _data["imdb"] = imdb;
    return _data;
  }
}

class Network {
  int? id;
  String? name;
  Country? country;
  String? officialSite;

  Network({this.id, this.name, this.country, this.officialSite});

  Network.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    country =
        json["country"] == null ? null : Country.fromJson(json["country"]);
    officialSite = json["officialSite"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    if (country != null) {
      _data["country"] = country?.toJson();
    }
    _data["officialSite"] = officialSite;
    return _data;
  }
}

class Country {
  String? name;
  String? code;
  String? timezone;

  Country({this.name, this.code, this.timezone});

  Country.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    code = json["code"];
    timezone = json["timezone"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["code"] = code;
    _data["timezone"] = timezone;
    return _data;
  }
}

class Rating {
  dynamic average;

  Rating({this.average});

  Rating.fromJson(Map<String, dynamic> json) {
    average = json["average"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["average"] = average;
    return _data;
  }
}

class Schedule {
  String? time;
  List<String>? days;

  Schedule({this.time, this.days});

  Schedule.fromJson(Map<String, dynamic> json) {
    time = json["time"];
    days = json["days"] == null ? null : List<String>.from(json["days"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["time"] = time;
    if (days != null) {
      _data["days"] = days;
    }
    return _data;
  }
}

Future<List<Show>> fetchAllMovies() async {
  final response =
      await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((item) => Show.fromJson(item['show'])).toList();
  } else {
    throw Exception('Failed to load movies');
  }
}

Future<List<Show>> searchMovie(String keyword) async {
  // Replace the URL with the keyword passed as parameter
  final response = await http
      .get(Uri.parse('https://api.tvmaze.com/search/shows?q=$keyword'));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((item) => Show.fromJson(item['show'])).toList();
  } else {
    throw Exception('Failed to load movies');
  }
}
