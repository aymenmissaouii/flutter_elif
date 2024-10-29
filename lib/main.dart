import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/auth/login.dart';
import 'package:flutter_application_1/auth/signup.dart';
import 'package:flutter_application_1/homepage.dart';
// import 'package:flutter_application_1/styles/styles.dart';
// import './product_box.dart' as product_box;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAgvVXrposY0CXedJi8AXjvpbZ_TFEg_Zc", 
      appId: "com.example.flutter_application_1", 
      messagingSenderId: "messagingSenderId", 
      projectId: "test-d934e"
      )
  );
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  MyApp({super.key});

    final List<Product> products = [
    Product(
      imageUrl: 'assets/Group-1.png', 
      price: '\$29.99',
      rating: 4.5,
    ),
    Product(
      imageUrl: 'assets/Group-2.png',
      price: '\$19.99',
      rating: 4.0,
    ),
    Product(
      imageUrl: 'assets/Group-3.png',
      price: '\$39.99',
      rating: 4.8,
    ),
    // Add more products as needed
  ];


  final List<Map> imageUrls = [
  {'link':"assets/Group-1.png", 'price':15, 'name':'Aymen'},
  {'link':"assets/Group-1.png", 'price':20, 'name':'Ali'},
  {'link':"assets/Group-1.png", 'price':25, 'name':'Kadhem'},
  ];

@override
State<MyApp> createState() => _MyAppState();
  
}


class _MyAppState extends State<MyApp> {


@override
  void initState() {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('=============User is currently signed out!');
    } else {
      print('==================User is signed in!');
    }
  });
    super.initState();
  }
// @override
// void initState() {
//     FirebaseAuth.instance
//   .userChanges()
//   .listen((User? user) {
//     if (user == null) {
//       print('==================User is currently signed out!');
//     } else {
//       print('===================User is signed in!');
//     }
//   });

//   super.initState();
//   }

 @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
      routes: {"signup": (context) => const Signup(), "homePage": (context) => Homepage(), "login": (context) => const Login()},
    );
 }
}




class Product {
  final String imageUrl;
  final String price;
  final double rating;

  Product({
    required this.imageUrl,
    required this.price,
    required this.rating,
  });
}