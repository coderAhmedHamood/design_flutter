import 'package:flutter/material.dart';


class ProductTwo extends StatefulWidget {
  @override
  _ProductTwoState createState() => _ProductTwoState();
}

class _ProductTwoState extends State<ProductTwo> with SingleTickerProviderStateMixin {

  List<Product_class> products = [
    Product_class('Product 1', 'Description 1', 10.0),
    Product_class('Product 2', 'Description 2', 20.0),
    Product_class('Product 3', 'Description 3', 30.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
            tooltip: 'Favorites (10)',
          )
        ],
      ),
      body: Column(
        children: [
          // Horizontal ListView for categories
          // HorizontalListView(categories),

          // Vertical ListView for products
          Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2
                  ),
                  itemCount: products.length,
                  itemBuilder: (ctx, i) => ProductCard(products[i])
              )
          )
        ],
      ),
    );
  }

}
  class Product_class {
  final String name;
  final String description;
  final double price;

  const Product_class(this.name, this.description, this.price);
  }


// Product card
    class ProductCard extends StatelessWidget {
    final Product_class product;

    const ProductCard(this.product);

    @override
    Widget build(BuildContext context) {
      return Card(
         // تعديل هذه القيمة حسب متطلبات التصميم الخاصة بك
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon(Icons.production_quantity_limits),

            Image.asset('assets/download.jpg'),
            Text("product.name"),
            Text('\$${"22"}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            ElevatedButton.icon(
                onPressed: () => {},
                icon: Icon(Icons.favorite),
                label: Text('Add to Favorites')
            ),
            TextButton(
                onPressed: () => {},
                child: Text('More details...')
            )
          ],
        ),
      );

    }
    }


// Image.network('assets/icons/2.jpg'),