import 'package:clima_flutter/screens/location_screen.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter_spinkit/src/fading_circle.dart';
import 'package:clima_flutter/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 70.0,
        ),
      ),
    );
  }
}

//    double temperature = weatherData['main']['temp'];
//     int condition = decodedData['weather'][0]['id'];
//     String cityName = decodedData['name'];
//
//     print(temperature);
//     print(condition);
//     print(cityName);
