import 'package:flutter/material.dart';

import '../model/product_model.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  ProductWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.grey.withOpacity(0.4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              product.image ?? '',
              errorBuilder: (x, y, z) {
                return Center(
                  child: Icon(Icons.broken_image),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            product.title ?? 'Not Defined',
            maxLines: 1,
            overflow:
                TextOverflow.ellipsis, // when there is a rest for the text ...
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          Text(
            product.price.toString(),
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w600, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
