class SongResults {
  int? count;
  String? previous;
  String? next;
  List<Results>? results;

  SongResults({this.count, this.previous, this.next, this.results});

  SongResults.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    previous = json['previous'];
    next = json['next'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['previous'] = this.previous;
    data['next'] = this.next;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? name;
  List<String>? tags;
  String? license;
  String? username;

  Results({this.id, this.name, this.tags, this.license, this.username});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tags = json['tags'].cast<String>();
    license = json['license'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tags'] = this.tags;
    data['license'] = this.license;
    data['username'] = this.username;
    return data;
  }
}