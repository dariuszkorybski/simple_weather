import 'package:simple_weather/domain/models/weather_model.dart';

import '../../data/remote_data_sources/weather_remote_data_sources.dart';

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDataSource);

  final WeatherRemoteDataSource _weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final responseData = await _weatherRemoteDataSource.getWeatherData(
      city: city,
    );
    if (responseData == null) {
      return null;
    }

    final name = responseData['location']['name'] as String;
    final temperature = (responseData['current']['temp_c'] + 0.0) as double;
    return WeatherModel(city: city, temperature: temperature);
  }
}
