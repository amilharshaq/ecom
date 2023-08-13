import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Data> data = [];

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  Future<void> fetchdata() async {
    try {
      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      var response_body = jsonDecode(response.body);
      print(response_body);

      setState(() {
        data = response_body
            .map<Data>((item) => Data(
          item['title'],
          "₹ ${item['id']}", // Assuming 'id' should represent the price.
          item['body'],
        ))
            .toList();
      });
    } catch (e) {
      // Handle error if the HTTP request fails.
      print("Error fetching data: $e");
    }
  }


  Future<void> _refreshData() async {
    // When you pull to refresh, fetch the data again.
    await fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(icon: const Icon(Icons.menu),splashRadius: 20,onPressed: (){
          Fluttertoast.showToast(msg: "hello");
        },),
        title: const SizedBox(

          width: 100,
          child: Center(
            child: Text("E- mart"),
          ),
        ),
        actions: const [
          Icon(Icons.notifications),
          SizedBox(width: 20),
        ],
      ),
      body:
      RefreshIndicator(onRefresh: _refreshData,color: Colors.white,backgroundColor: Colors.black,child:
      Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 10)),
          Column(
          children:[

            SizedBox(width: 350,
            child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Icons.search),border: OutlineInputBorder(),focusColor: Colors.black,hintText: "hello"),
          ),
          ),
          ]

          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                Data item = data[index];
                return Card(
                  elevation: 2,
                  child: SizedBox(
                    height: 150,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                        ),
                        Card(
                          elevation: 3,
                          child: Container(
                            width: 125,
                            height: 125,
                            child: Image.network(
                              "https://picsum.photos/200",
                              width: 125,
                              height: 125,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(20)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              item.price,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 200,
                              height: 100,
                              child: Text(
                                item.description,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      ),
    );
  }
}

class Data {
  final String title;
  final String price;
  final String description;

  const Data(this.title, this.price, this.description);
}
