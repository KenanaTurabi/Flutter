import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/view/product_widget.dart';

import '../model/product_model.dart';

class EcommerceScreen extends StatelessWidget {
  List<String> imgs_url = [
    'https://images.unsplash.com/photo-1602143407151-7111542de6e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.unsplash.com/photo-1503602642458-232111445657?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
    'https://images.unsplash.com/photo-1586495777744-4413f21062fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80',
    'https://images.unsplash.com/photo-1572635196237-14b3f281503f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
  ];
  List<Product> convertMapToProducts() {
    return data.map((e) => Product.fromMap(e)).toList();
  }

  late List<Product> products;
  EcommerceScreen() {
    products = convertMapToProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ECOMMERCE')),
      //////List View//////
      ///it construct the elements inside the screen only ,while coulmn construct all the elements in the list

      /* body: ListView(
        children: products.map((e) => ProductWidget(e)).toList(),
      ), */

      ////////List View --> with ather named constructer

      /* body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (c, index) {
            return ProductWidget(products[index]);
          }), */

      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(.5)),
                    margin: EdgeInsets.all(10),
                    child: Image.network(imgs_url[i]),
                    height: 200,
                    width: 200,
                  )
              ],
            ),
          ),
          Text(
            'products',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  ///# of elements in line
                  mainAxisExtent:
                      400, //to control height of the grid coz by default its square shape
                  mainAxisSpacing: 20, //with next row
                  crossAxisSpacing: 20, //btw cols
                ),
                itemCount: products.length,
                itemBuilder: (c, index) {
                  return ProductWidget(products[index]);
                }),
          )
        ],
      ),
    );
  } //build
}//EcommerceScreen
