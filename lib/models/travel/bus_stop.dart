class BusStop
{

  late String name;
  late double lat;
  late double long;

  BusStop({required this.name, required this.lat, required this.long});

  BusStop.fromJson(Map<String, dynamic> json)
  {
    name = json['name'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['long'] = this.long;

    return data;
  }

}