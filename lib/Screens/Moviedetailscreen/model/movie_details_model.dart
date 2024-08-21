class Moviedetailsmodel {
  Results? results;

  Moviedetailsmodel({this.results});

  Moviedetailsmodel.fromJson(Map<String, dynamic> json) {
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class Results {
  String? sId;
  String? id;
  PrimaryImage? primaryImage;
  TitleType? titleType;
  TitleText? titleText;
  TitleText? originalTitleText;
  ReleaseYear? releaseYear;
  ReleaseDate? releaseDate;

  Results(
      {this.sId,
      this.id,
      this.primaryImage,
      this.titleType,
      this.titleText,
      this.originalTitleText,
      this.releaseYear,
      this.releaseDate});

  Results.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    primaryImage = json['primaryImage'] != null
        ? new PrimaryImage.fromJson(json['primaryImage'])
        : null;
    titleType = json['titleType'] != null
        ? new TitleType.fromJson(json['titleType'])
        : null;
    titleText = json['titleText'] != null
        ? new TitleText.fromJson(json['titleText'])
        : null;
    originalTitleText = json['originalTitleText'] != null
        ? new TitleText.fromJson(json['originalTitleText'])
        : null;
    releaseYear = json['releaseYear'] != null
        ? new ReleaseYear.fromJson(json['releaseYear'])
        : null;
    releaseDate = json['releaseDate'] != null
        ? new ReleaseDate.fromJson(json['releaseDate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    if (this.primaryImage != null) {
      data['primaryImage'] = this.primaryImage!.toJson();
    }
    if (this.titleType != null) {
      data['titleType'] = this.titleType!.toJson();
    }
    if (this.titleText != null) {
      data['titleText'] = this.titleText!.toJson();
    }
    if (this.originalTitleText != null) {
      data['originalTitleText'] = this.originalTitleText!.toJson();
    }
    if (this.releaseYear != null) {
      data['releaseYear'] = this.releaseYear!.toJson();
    }
    if (this.releaseDate != null) {
      data['releaseDate'] = this.releaseDate!.toJson();
    }
    return data;
  }
}

class PrimaryImage {
  String? id;
  int? width;
  int? height;
  String? url;
  Caption? caption;
  String? sTypename;

  PrimaryImage(
      {this.id,
      this.width,
      this.height,
      this.url,
      this.caption,
      this.sTypename});

  PrimaryImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
    caption =
        json['caption'] != null ? new Caption.fromJson(json['caption']) : null;
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    if (this.caption != null) {
      data['caption'] = this.caption!.toJson();
    }
    data['__typename'] = this.sTypename;
    return data;
  }
}

class Caption {
  String? plainText;
  String? sTypename;

  Caption({this.plainText, this.sTypename});

  Caption.fromJson(Map<String, dynamic> json) {
    plainText = json['plainText'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plainText'] = this.plainText;
    data['__typename'] = this.sTypename;
    return data;
  }
}

class TitleType {
  DisplayableProperty? displayableProperty;
  String? text;
  String? id;
  bool? isSeries;
  bool? isEpisode;
  List<Categories>? categories;
  bool? canHaveEpisodes;
  String? sTypename;

  TitleType(
      {this.displayableProperty,
      this.text,
      this.id,
      this.isSeries,
      this.isEpisode,
      this.categories,
      this.canHaveEpisodes,
      this.sTypename});

  TitleType.fromJson(Map<String, dynamic> json) {
    displayableProperty = json['displayableProperty'] != null
        ? new DisplayableProperty.fromJson(json['displayableProperty'])
        : null;
    text = json['text'];
    id = json['id'];
    isSeries = json['isSeries'];
    isEpisode = json['isEpisode'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    canHaveEpisodes = json['canHaveEpisodes'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.displayableProperty != null) {
      data['displayableProperty'] = this.displayableProperty!.toJson();
    }
    data['text'] = this.text;
    data['id'] = this.id;
    data['isSeries'] = this.isSeries;
    data['isEpisode'] = this.isEpisode;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['canHaveEpisodes'] = this.canHaveEpisodes;
    data['__typename'] = this.sTypename;
    return data;
  }
}

class DisplayableProperty {
  Caption? value;
  String? sTypename;

  DisplayableProperty({this.value, this.sTypename});

  DisplayableProperty.fromJson(Map<String, dynamic> json) {
    value = json['value'] != null ? new Caption.fromJson(json['value']) : null;
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    data['__typename'] = this.sTypename;
    return data;
  }
}

class Categories {
  String? value;
  String? sTypename;

  Categories({this.value, this.sTypename});

  Categories.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['__typename'] = this.sTypename;
    return data;
  }
}

class TitleText {
  String? text;
  String? sTypename;

  TitleText({this.text, this.sTypename});

  TitleText.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['__typename'] = this.sTypename;
    return data;
  }
}

class ReleaseYear {
  int? year;
  Null? endYear;
  String? sTypename;

  ReleaseYear({this.year, this.endYear, this.sTypename});

  ReleaseYear.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    endYear = json['endYear'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['endYear'] = this.endYear;
    data['__typename'] = this.sTypename;
    return data;
  }
}

class ReleaseDate {
  int? day;
  int? month;
  int? year;
  String? sTypename;

  ReleaseDate({this.day, this.month, this.year, this.sTypename});

  ReleaseDate.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    month = json['month'];
    year = json['year'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['month'] = this.month;
    data['year'] = this.year;
    data['__typename'] = this.sTypename;
    return data;
  }
}
