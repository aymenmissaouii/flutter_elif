import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/styles.dart';
import './product_box.dart' as product_box;

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // const MyApp({super.key});

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
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
           title: const Text('AppBar'),
        ),
        drawer: const Drawer(),
        body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          
          child: Column(
            children: [

              //Text here
               TextRoom(),

              Row(
                children: [
                 Container(
  decoration: const BoxDecoration(
   
  ),
  child: Container(
    width:MediaQuery.of(context).size.width * 0.75,
    height: 30,
    margin:EdgeInsets.only(top:10),
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
    decoration: BoxDecoration(
      border: Border.all(
        width: 0.5,
        color:Color.fromARGB(255, 239, 235, 235)
      ),
      
      borderRadius: BorderRadius.circular(5),
      color: const Color.fromARGB(255, 255, 255, 255),
    ),
    
    child:Row(
      children: [
       const Icon(Icons.search),
Text(
  'Search',textAlign: TextAlign.left,
      style: StylesClass().searchText
    ),
      ],
    )
     
  ),
),
Container(
  decoration: const BoxDecoration(
   
  ),
  child: Container(
    decoration: BoxDecoration(
      border: Border.all(
        width: 0.5,
        color:Color.fromARGB(255, 239, 235, 235)
      ),
      
      borderRadius: BorderRadius.circular(5),
      color: const Color.fromARGB(255, 255, 255, 255),
    ),
    height: 30,
    width:30,
    margin:const EdgeInsets.only(top:10,left:25),
    //margin:EdgeInsets.only(left:60),
    child: const Icon(Icons.sort)
      
    ),
  ),        
                ],
              ),

//single scroll

SingleChildScrollView(
  child: Column(
    children: [
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),  // Disable inner scrolling if necessary
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: product_box.ProductCard(),
          );
        },
      ),
    ],
  ),
),

product_box.ProductCard(),

//               Row(
//                 children: [
//  Expanded(child: 
//  Container(
// margin:const EdgeInsets.only(left:15),
//                     child: Column(
//                    children: [

//                     Image.asset(
//                       "../assets/room1.jpeg",
//                       width: 150,
//                       height:200
//                       ),                    
//                    ],        
//                   )
//                   ),),
//  Expanded(child: 
//  Container(
// margin:const EdgeInsets.only(left:15),
//                     child: Column(
//                    children: [

//                     Image.asset(
//                       "../assets/room1.jpeg",
//                       width: 150,
//                       height:200
//                       ),
//                    ],
//                   )
//                   ),),
//  Expanded(child: 
//  Container(
// margin:const EdgeInsets.only(left:15),
//                     child: Column(
//                    children: [
//                     Image.asset(
//                       "../assets/room1.jpeg",
//                       width: 150,
//                       height:200
//                       ),
//                    ],
//                   )
//                   ),),
//  Expanded(child:Container(
// margin:const EdgeInsets.only(left:15),
//                     child: Column(
//                    children: [

//                     Image.asset(
//                       "../assets/room1.jpeg",
//                       width: 150,
//                       height:200
//                       ),
//                    ],
//                   )
//                   ),),
//                 ]
//               ),
            ],
          )
        ),
      )),
    );
  }
}

class TextRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
                children: [
                  const Text("Find,"),
                  Text("Your Roommmmm",
                  style:StylesClass().textStyle)
                ],
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