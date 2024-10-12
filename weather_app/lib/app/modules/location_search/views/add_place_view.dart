import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/controllers/app_controller.dart';

class AddPlaceView extends GetView<AppController> {
  final TextEditingController _searchController = TextEditingController();
  final RxList<String> _filteredCities = RxList<String>();

  final List<String> _cities = [
    'London',
    'Paris',
    'New York',
    'Tokyo',
    'Sydney',
    "Shanghai",
    "Hong Kong",
    "Singapore",
    "Dubai",
    "São Paulo",
    "Los Angeles",
    "Beijing",
    "Moscow",
    "Berlin",
    "Seoul"
  ];

  final Map<String, String> _cityUrls = {
    'London':"https://images.pexels.com/photos/77171/pexels-photo-77171.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    'Paris':"https://images.pexels.com/photos/1530259/pexels-photo-1530259.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    'New York':"https://images.pexels.com/photos/64271/queen-of-liberty-statue-of-liberty-new-york-liberty-statue-64271.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    'Tokyo':"https://images.pexels.com/photos/3779816/pexels-photo-3779816.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    'Sydney':"https://images.pexels.com/photos/1680247/pexels-photo-1680247.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "Shanghai":"https://images.pexels.com/photos/36789/shanghai-oriental-pearl-tv-tower-night-view-people-s-republic-of-china.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "Hong Kong":"https://images.pexels.com/photos/792832/pexels-photo-792832.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "Singapore":"https://images.pexels.com/photos/3152124/pexels-photo-3152124.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "Dubai":"https://images.pexels.com/photos/162031/dubai-tower-arab-khalifa-162031.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "São Paulo":"https://images.pexels.com/photos/1535775/pexels-photo-1535775.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "Los Angeles":"https://images.pexels.com/photos/3166785/pexels-photo-3166785.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "Beijing":"https://images.pexels.com/photos/2412603/pexels-photo-2412603.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "Moscow":"https://images.pexels.com/photos/753339/pexels-photo-753339.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "Berlin":"https://images.pexels.com/photos/5273642/pexels-photo-5273642.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "Seoul":"https://images.pexels.com/photos/2128042/pexels-photo-2128042.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  };

  @override
  Widget build(BuildContext context) {
    _filteredCities.value = _cities;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Location'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterCities,
              decoration: InputDecoration(
                hintText: 'Search for a city',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: _filteredCities.length,
                itemBuilder: (context, index) {
                  final city = _filteredCities[index];
                  final cityImg = _cityUrls[city]!;
                  return ListTile(
                    title: Text(city),
                    trailing: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => _addCity(city, cityImg),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _filterCities(String query) {
    _filteredCities.value = _cities
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void _addCity(String city, String imgUrl) {
    controller.fetchWeatherData(city, imgUrl);
    Get.back();
  }
}
