// To parse this JSON data, do
//
//     final test = testFromJson(jsonString);

import 'dart:convert';

SimpleDataModel testFromJson(String str) =>
    SimpleDataModel.fromJson(json.decode(str));

String testToJson(SimpleDataModel data) => json.encode(data.toJson());

class SimpleDataModel {
  late String version;
  late List<dynamic> rollouts;
  late List<dynamic> typedAudiences;
  late bool anonymizeIp;
  late String projectId;
  late List<dynamic> variables;
  late List<dynamic> featureFlags;
  late List<dynamic> experiments;
  late List<Audience> audiences;
  late List<dynamic> groups;
  late List<Attribute> attributes;
  late bool botFiltering;
  late String accountId;
  late List<Event> events;
  late String revision;

  SimpleDataModel(
    this.version,
    this.rollouts,
    this.typedAudiences,
    this.anonymizeIp,
    this.projectId,
    this.variables,
    this.featureFlags,
    this.experiments,
    this.audiences,
    this.groups,
    this.attributes,
    this.botFiltering,
    this.accountId,
    this.events,
    this.revision,
  );

  SimpleDataModel.fromJson(Map<String, dynamic> json) {
    version = json["version"];
    rollouts = List<dynamic>.from(json["rollouts"].map((x) => x));
    typedAudiences = List<dynamic>.from(json["typedAudiences"].map((x) => x));
    anonymizeIp = json["anonymizeIP"];
    projectId = json["projectId"];
    variables = List<dynamic>.from(json["variables"].map((x) => x));
    featureFlags = List<dynamic>.from(json["featureFlags"].map((x) => x));
    experiments = List<dynamic>.from(json["experiments"].map((x) => x));
    audiences =
        List<Audience>.from(json["audiences"].map((x) => Audience.fromJson(x)));
    groups = List<dynamic>.from(json["groups"].map((x) => x));
    attributes = List<Attribute>.from(
        json["attributes"].map((x) => Attribute.fromJson(x)));
    botFiltering = json["botFiltering"];
    accountId = json["accountId"];
    events = List<Event>.from(json["events"].map((x) => Event.fromJson(x)));
    revision = json["revision"];
  }

  Map<String, dynamic> toJson() => {
        "version": version,
        "rollouts": List<dynamic>.from(rollouts.map((x) => x)),
        "typedAudiences": List<dynamic>.from(typedAudiences.map((x) => x)),
        "anonymizeIP": anonymizeIp,
        "projectId": projectId,
        "variables": List<dynamic>.from(variables.map((x) => x)),
        "featureFlags": List<dynamic>.from(featureFlags.map((x) => x)),
        "experiments": List<dynamic>.from(experiments.map((x) => x)),
        "audiences": List<dynamic>.from(audiences.map((x) => x.toJson())),
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "botFiltering": botFiltering,
        "accountId": accountId,
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
        "revision": revision,
      };
}

class Attribute {
  Attribute({
    required this.id,
    required this.key,
  });
  String id;
  String key;
  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        key: json["key"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
      };
}

class Audience {
  Audience({
    required this.conditions,
    required this.id,
    required this.name,
  });
  String conditions;
  String id;
  String name;
  factory Audience.fromJson(Map<String, dynamic> json) => Audience(
        conditions: json["conditions"],
        id: json["id"],
        name: json["name"],
      );
  Map<String, dynamic> toJson() => {
        "conditions": conditions,
        "id": id,
        "name": name,
      };
}

class Event {
  List<dynamic> experimentIds;
  String id;
  String key;
  Event({
    required this.experimentIds,
    required this.id,
    required this.key,
  });
  factory Event.fromJson(Map<String, dynamic> json) => Event(
        experimentIds: List<dynamic>.from(json["experimentIds"].map((x) => x)),
        id: json["id"],
        key: json["key"],
      );
  Map<String, dynamic> toJson() => {
        "experimentIds": List<dynamic>.from(experimentIds.map((x) => x)),
        "id": id,
        "key": key,
      };
}
