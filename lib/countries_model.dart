class CountriesModel {
  final List<Countries>? countries;

  CountriesModel({
    this.countries,
  });

  CountriesModel.fromJson(Map<String, dynamic> json)
      : countries = (json['countries'] as List?)?.map((dynamic e) => Countries.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'countries' : countries?.map((e) => e.toJson()).toList()
  };
}

class Countries {
  final String? name;
  final String? iso2;
  final String? iso3;

  Countries({
    this.name,
    this.iso2,
    this.iso3,
  });

  Countries.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        iso2 = json['iso2'] as String?,
        iso3 = json['iso3'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'iso2' : iso2,
    'iso3' : iso3
  };
}