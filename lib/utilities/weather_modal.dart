// ignore_for_file: non_constant_identifier_names

class WeatherModal{
      String? name;
      Main? temperature;
      List<Weather>? weather;
      WeatherModal({required this.weather,required this.temperature,required this.name});
      factory WeatherModal.fromJson(Map< String, dynamic> json){
        var weathers = json['weather'];
        if(weathers == null) return WeatherModal(weather: null, temperature: null, name: null);
        return WeatherModal(weather: weathers.map<Weather>((w) => Weather.fromJson(w)).toList(), temperature: Main.fromJson(json['main']), name: json['name']);
      }}
class Main{
  double? temp;
  double? temp_max;
  double? temp_min;
  int? humidity;
  Main({
    required this.temp,required this.humidity,required this.temp_max,required this.temp_min
});
  Main.fromJson(Map<String, dynamic> json): temp = json['temp'], temp_max = json['temp_max'],
  temp_min = json['temp_min'], humidity = json['humidity'];
}
class Weather{
  String? description;
  int? id;
  Weather({required this.id,required this.description});
  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(id: json['id'], description: json['description']);
  }
}
