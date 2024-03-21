import 'package:flutter/material.dart';
import 'package:kuis_tpm/detail_page.dart';
import 'package:kuis_tpm/groceries.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Produk (123210063)",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          final Groceries product = groceryList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(product: product),
                  ));
            },
            child: Card(
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: Image.network(product.productImageUrls[0]),
                  ),
                  Text(product.name),
                  Row(
                    children: [
                      Text(
                        "Rp.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        product.price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        itemCount: groceryList.length,
      ),
    );
  }
}
