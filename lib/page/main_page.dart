
import 'package:flutter/material.dart';


import '../data/api.dart';
import '../data/data.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late Future<Album> post;
  late Future<List<Album>> album;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    album = getTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("앨범 파일"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.indigo,
      ),
      body: FutureBuilder<List<Album>>(
        future: album,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (ctx, idx) {
                        final albumList = snapshot.data![idx];
                    return Container(
                      child: imageCard(albumList.url, albumList.title),
                    );
                  }),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.hasError}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Widget imageCard(String image, String title) {
    return SizedBox(
      width: 400,
      height: 200,
      child: Column(
        children: [
          Image.network(
            image,
            fit: BoxFit.cover,
            width: 200,
            height: 150,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
