import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MaterialApp(home: RestaurantScreen()));

// 1. Create a Model class to represent your Restaurant
class Restaurant {
  final String name;
  final String cuisine;

  Restaurant({required this.name, required this.cuisine});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json['name'] ?? 'Unknown Restaurant',
      cuisine: json['type'] ?? 'General',
    );
  }
}

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  late Future<List<Restaurant>> _restaurantFuture;

  @override
  void initState() {
    super.initState();
    // 2. Call the API once when the screen starts
    _restaurantFuture = fetchRestaurants();
  }

  // 3. The API call function
  Future<List<Restaurant>> fetchRestaurants() async {
    final response = await http.get(Uri.parse('https://dummyjson.com')); // Dummy API

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> recipes = data['recipes'];
      
      // Map the JSON data to our Restaurant objects
      return recipes.map((json) => Restaurant.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load restaurants');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Local Restaurants')),
      // 4. FutureBuilder handles the "waiting" vs "done" logic
      body: FutureBuilder<List<Restaurant>>(
        future: _restaurantFuture,
        builder: (context, snapshot) {
          // SHOW LOADING SPINNER
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } 
          
          // SHOW ERROR IF IT FAILS
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } 
          
          // SHOW LIST WHEN DATA ARRIVES
          else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final restaurant = snapshot.data![index];
                return ListTile(
                  leading: const Icon(Icons.restaurant),
                  title: Text(restaurant.name),
                  subtitle: Text(restaurant.cuisine),
                );
              },
            );
          }
          
          return const Center(child: Text('No data found'));
        },
      ),
    );
  }
}
