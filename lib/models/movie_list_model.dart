// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

class MovieListModel {
  MovieListModel({
    required this.status,
    required this.data,
  });
  late final String status;
  late final List<Data> data;

  MovieListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.ratings,
    required this.description,
    required this.live,
    required this.thumbnail,
    required this.cloudinaryBannerId,
    required this.launchDate,
    required this.cloudinaryThumbnailId,
    required this.cloudinaryVideoId,
    required this.launchFlag,
    required this.video,
    required this.views,
    required this.Id,
    required this.directors,
    required this.type,
    required this.year,
    required this.image,
    required this.genres,
    required this.languages,
    required this.runtimeStr,
    required this.plot,
    required this.writers,
    required this.id,
    required this.title,
    required this.madeBy,
    required this.studioId,
    required this.actorsList,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.category,
    required this.banner,
  });
  late final Ratings ratings;
  late final String description;
  late final bool live;
  late final String thumbnail;
  late final String cloudinaryBannerId;
  late final String launchDate;
  late final String cloudinaryThumbnailId;
  late final String cloudinaryVideoId;
  late final bool launchFlag;
  late final String video;
  late final int views;
  late final String Id;
  late final String directors;
  late final String type;
  late final String year;
  late final String image;
  late final String genres;
  late final String languages;
  late final String runtimeStr;
  late final String plot;
  late final String writers;
  late final String id;
  late final String title;
  late final String madeBy;
  late final String studioId;
  late final List<ActorsList> actorsList;
  late final String createdAt;
  late final String updatedAt;
  late final int v;
  late final String? category;
  late final String? banner;

  Data.fromJson(Map<String, dynamic> json) {
    ratings = Ratings.fromJson(json['Ratings']);
    description = json['description'];
    live = json['live'];
    thumbnail = json['thumbnail'];
    cloudinaryBannerId = json['cloudinaryBanner_id'];
    launchDate = json['launchDate'];
    cloudinaryThumbnailId = json['cloudinaryThumbnail_id'];
    cloudinaryVideoId = json['cloudinaryVideo_id'];
    launchFlag = json['launch_flag'];
    video = json['video'];
    views = json['views'];
    directors = json['directors'];
    type = json['type'];
    year = json['year'];
    image = json['image'];
    genres = json['genres'];
    languages = json['Languages'];
    runtimeStr = json['RuntimeStr'];
    plot = json['Plot'];
    writers = json['Writers'];
    id = json['_id'];
    title = json['title'];
    madeBy = json['madeBy'];
    studioId = json['studio_id'];
    actorsList = List.from(json['Actors_list'])
        .map((e) => ActorsList.fromJson(e))
        .toList();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    category = json['category'];
    banner = json['banner'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Ratings'] = ratings.toJson();
    _data['description'] = description;
    _data['live'] = live;
    _data['thumbnail'] = thumbnail;
    _data['cloudinaryBanner_id'] = cloudinaryBannerId;
    _data['launchDate'] = launchDate;
    _data['cloudinaryThumbnail_id'] = cloudinaryThumbnailId;
    _data['cloudinaryVideo_id'] = cloudinaryVideoId;
    _data['launch_flag'] = launchFlag;
    _data['video'] = video;
    _data['views'] = views;
    _data['Id'] = Id;
    _data['directors'] = directors;
    _data['type'] = type;
    _data['year'] = year;
    _data['image'] = image;
    _data['genres'] = genres;
    _data['Languages'] = languages;
    _data['RuntimeStr'] = runtimeStr;
    _data['Plot'] = plot;
    _data['Writers'] = writers;
    _data['_id'] = id;
    _data['title'] = title;
    _data['madeBy'] = madeBy;
    _data['studio_id'] = studioId;
    _data['Actors_list'] = actorsList.map((e) => e.toJson()).toList();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = v;
    _data['category'] = category;
    _data['banner'] = banner;
    return _data;
  }
}

class Ratings {
  Ratings({
    required this.imDb,
    required this.metacritic,
    required this.theMovieDb,
    required this.rottenTomatoes,
    required this.tVCom,
    required this.filmAffinity,
  });
  late final String imDb;
  late final String metacritic;
  late final String theMovieDb;
  late final String rottenTomatoes;
  late final String tVCom;
  late final String filmAffinity;

  Ratings.fromJson(Map<String, dynamic> json) {
    imDb = json['imDb'];
    metacritic = json['metacritic'];
    theMovieDb = json['theMovieDb'];
    rottenTomatoes = json['rottenTomatoes'];
    tVCom = json['tV_com'];
    filmAffinity = json['filmAffinity'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['imDb'] = imDb;
    _data['metacritic'] = metacritic;
    _data['theMovieDb'] = theMovieDb;
    _data['rottenTomatoes'] = rottenTomatoes;
    _data['tV_com'] = tVCom;
    _data['filmAffinity'] = filmAffinity;
    return _data;
  }
}

class ActorsList {
  ActorsList({
    required this.Id,
    required this.id,
    required this.image,
    required this.name,
    required this.asCharacter,
  });
  late final String Id;
  late final String id;
  late final String image;
  late final String name;
  late final String asCharacter;

  ActorsList.fromJson(Map<String, dynamic> json) {
    Id = json['_id'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    asCharacter = json['asCharacter'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = Id;
    _data['id'] = id;
    _data['image'] = image;
    _data['name'] = name;
    _data['asCharacter'] = asCharacter;
    return _data;
  }
}
