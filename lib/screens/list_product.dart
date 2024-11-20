import 'package:flutter/material.dart';
import 'package:biiluved/models/product_entry.dart';
import 'package:biiluved/widgets/left_drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:biiluved/screens/product_detail.dart'; // Add this import

class ProductEntryPage extends StatefulWidget {
  const ProductEntryPage({super.key});

  @override
  State<ProductEntryPage> createState() => _ProductEntryPageState();
}

class _ProductEntryPageState extends State<ProductEntryPage> {
  Future<List<ProductEntry>> fetchMood(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');
    var data = response;
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('LUVs lists'),
        backgroundColor: Colors.pink[100],
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchMood(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'No LUVS here',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff59A5D8),
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: InkWell( // Make the card tappable
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            product: snapshot.data![index],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data![index].fields.name,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Rp ${snapshot.data![index].fields.price}",
                                  style: TextStyle(
                                    color: Colors.pink[700],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  snapshot.data![index].fields.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}