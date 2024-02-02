class UserModel {
  final List<dynamic>? results;
  final dynamic info;

  UserModel({
    this.results,
    this.info,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        results: json["results"] == null
            ? []
            : List<dynamic>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "info": info?.toJson(),
      };
}

class Info {
  final dynamic seed;
  final dynamic results;
  final dynamic page;
  final dynamic version;

  Info({
    this.seed,
    this.results,
    this.page,
    this.version,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        seed: json["seed"],
        results: json["results"],
        page: json["page"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "seed": seed,
        "results": results,
        "page": page,
        "version": version,
      };
}

class Result {
  final dynamic gender;
  final dynamic name;
  final dynamic location;
  final dynamic email;
  final dynamic login;
  final dynamic dob;
  final dynamic registered;
  final dynamic phone;
  final dynamic cell;
  final dynamic id;
  final dynamic picture;
  final dynamic nat;

  Result({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.login,
    this.dob,
    this.registered,
    this.phone,
    this.cell,
    this.id,
    this.picture,
    this.nat,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        gender: json["gender"],
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        email: json["email"],
        login: json["login"] == null ? null : Login.fromJson(json["login"]),
        dob: json["dob"] == null ? null : Dob.fromJson(json["dob"]),
        registered: json["registered"] == null
            ? null
            : Dob.fromJson(json["registered"]),
        phone: json["phone"],
        cell: json["cell"],
        id: json["id"] == null ? null : Id.fromJson(json["id"]),
        picture:
            json["picture"] == null ? null : Picture.fromJson(json["picture"]),
        nat: json["nat"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name?.toJson(),
        "location": location?.toJson(),
        "email": email,
        "login": login?.toJson(),
        "dob": dob?.toJson(),
        "registered": registered?.toJson(),
        "phone": phone,
        "cell": cell,
        "id": id?.toJson(),
        "picture": picture?.toJson(),
        "nat": nat,
      };
}

class Dob {
  final dynamic date;
  final dynamic age;

  Dob({
    this.date,
    this.age,
  });

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "age": age,
      };
}

class Id {
  final dynamic name;
  final dynamic value;

  Id({
    this.name,
    this.value,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class Location {
  final dynamic street;
  final dynamic city;
  final dynamic state;
  final dynamic country;
  final dynamic postcode;
  final dynamic coordinates;
  final dynamic timezone;

  Location({
    this.street,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.coordinates,
    this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        street: json["street"] == null ? null : Street.fromJson(json["street"]),
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postcode: json["postcode"],
        coordinates: json["coordinates"] == null
            ? null
            : Coordinates.fromJson(json["coordinates"]),
        timezone: json["timezone"] == null
            ? null
            : Timezone.fromJson(json["timezone"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street?.toJson(),
        "city": city,
        "state": state,
        "country": country,
        "postcode": postcode,
        "coordinates": coordinates?.toJson(),
        "timezone": timezone?.toJson(),
      };
}

class Coordinates {
  final dynamic latitude;
  final dynamic longitude;

  Coordinates({
    this.latitude,
    this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Street {
  final dynamic number;
  final dynamic name;

  Street({
    this.number,
    this.name,
  });

  factory Street.fromJson(Map<String, dynamic> json) => Street(
        number: json["number"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
      };
}

class Timezone {
  final dynamic offset;
  final dynamic description;

  Timezone({
    this.offset,
    this.description,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        offset: json["offset"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "description": description,
      };
}

class Login {
  final dynamic uuid;
  final dynamic username;
  final dynamic password;
  final dynamic salt;
  final dynamic md5;
  final dynamic sha1;
  final dynamic sha256;

  Login({
    this.uuid,
    this.username,
    this.password,
    this.salt,
    this.md5,
    this.sha1,
    this.sha256,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        uuid: json["uuid"],
        username: json["username"],
        password: json["password"],
        salt: json["salt"],
        md5: json["md5"],
        sha1: json["sha1"],
        sha256: json["sha256"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "username": username,
        "password": password,
        "salt": salt,
        "md5": md5,
        "sha1": sha1,
        "sha256": sha256,
      };
}

class Name {
  final dynamic title;
  final dynamic first;
  final dynamic last;

  Name({
    this.title,
    this.first,
    this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}

class Picture {
  final dynamic large;
  final dynamic medium;
  final dynamic thumbnail;

  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}
