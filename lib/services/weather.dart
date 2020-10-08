import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';

class WeatherModel {
  Future<Map> getCityWeather(String cityName) async {
    Map data = await NetworkHelper(
      '$kWeatherRequestURL'
      '?q=$cityName'
      '&appid=$kApiKey'
      '&units=metric',
    ).getData();

    return data;
  }

  Future<Map> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    Map data = await NetworkHelper(
      '$kWeatherRequestURL'
      '?lat=${location.latitude}'
      '&lon=${location.longitude}'
      '&appid=$kApiKey'
      '&units=metric',
    ).getData();

    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
