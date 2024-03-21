import 'package:flutter/material.dart';
import 'package:kuis_tpm/groceries.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Groceries product;
  bool _isFavourite = false;
  DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                String text = "";

                if (!_isFavourite) {
                  _isFavourite = true;
                  text = "Menambahkan item ke favorit";
                  SnackBar snackBar = SnackBar(
                    content: Text(text),
                    backgroundColor: Colors.lightGreen,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  );
                } else {
                  _isFavourite = false;
                  text = "Menghapus item dari favorit";
                  SnackBar snackBar = SnackBar(
                    content: Text(text),
                    backgroundColor: Colors.red,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Icon(
                    Icons.favorite_outline,
                    color: Colors.red,
                  );
                }
              },
              icon: (_isFavourite)
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : Icon(
                      Icons.favorite_outline,
                      color: Colors.red,
                    ))
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            child: Image.network(product.productImageUrls[0]),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Rp."),
                    Text(
                      product.price,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 350,
                    ),
                    Text(
                      "Discount",
                      style: TextStyle(
                        decorationColor: Colors.red,
                        backgroundColor: Colors.red,
                      ),
                    ),
                    Text(
                      product.discount,
                      style: TextStyle(
                        decorationColor: Colors.red,
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Tersedia :"),
                    Text(
                      product.stock,
                    ),
                    SizedBox(
                      width: 350,
                    ),
                    Icon(Icons.favorite_border_outlined),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              children: [
                Icon(Icons.shopping_bag),
                Text(product.storeName),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(product.description),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchedURrl(product.productUrl);
        },
        child: Icon(Icons.open_in_browser),
      ),
    );
  }

  Future<void> _launchedURrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not Launch $_url');
    }
  }
}
