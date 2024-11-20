import 'package:flutter/material.dart';
import 'package:kambing_ku/models/product_entry.dart'; // Sesuaikan path
import 'package:kambing_ku/widgets/left_drawer.dart'; // Sesuaikan path
import 'package:kambing_ku/screens/product_detail.dart'; // Sesuaikan path
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';


class KambingEntryPage extends StatefulWidget {
  const KambingEntryPage({super.key});

  @override
  State<KambingEntryPage> createState() => _KambingEntryPageState();
}

class _KambingEntryPageState extends State<KambingEntryPage> {
  Future<List<KambingEntry>> fetchMood(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/');

    var data = response;

    List<KambingEntry> listOrder = [];
    for (var d in data) {
      if (d != null) {
        listOrder.add(KambingEntry.fromJson(d));
      }
    }
    print(listOrder);
    return listOrder;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order List'),
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
                    'Belum ada order-an :(',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Card(
                  child: ListTile(
                    title: Text(
                      "Name: ${snapshot.data![index].fields.name}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Description: ${snapshot.data![index].fields.description}"),
                        Text("Price: ${snapshot.data![index].fields.price}"),
                      ],
                    ),
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