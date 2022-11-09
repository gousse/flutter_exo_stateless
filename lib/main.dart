import 'package:flutter/material.dart';
import 'package:flutter_application_3_exo/section_title.dart';
import 'package:flutter_application_3_exo/title_texte.dart';
import 'post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  List<Post> posts = [
    Post(
        name: "name2",
        time: "10 minutes",
        imagePath: "images/maldive.jpg",
        description: "description2"),
    Post(
        name: "name",
        time: "5 minutes",
        imagePath: "images/maldive.jpg",
        description: "description",
        likes: 4,
        comments: 1),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exo"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              profileTop(),
              const TitleText(texte: "Foo Bar"),
              textLight("une phrase megacool"),
              modifyProfile(),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              aPropos(),
              listAmi(),
              listPost()
            ],
          ),
        ),
      ),
    );
  }

  Image photoCouv() {
    return Image.asset(
      "images/maldive.jpg",
      height: 300,
      fit: BoxFit.cover,
    );
  }

  CircleAvatar photoProfile(double radius) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: radius,
      child: CircleAvatar(
          radius: (radius - 1),
          foregroundImage: const AssetImage("images/dauphin.jpg")),
    );
  }

  Stack profileTop() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        photoCouv(),
        Padding(
            padding: const EdgeInsets.only(top: 260), child: photoProfile(40))
      ],
    );
  }

  Text textGras(String text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold));
  }

  Text textLight(String text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.grey,
            fontSize: 10,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w300));
  }

  Padding modifyProfile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                "Modifier le profile",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            width: 10,
          ),
          Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Icon(
                Icons.edit_sharp,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  Column aPropos() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            SectionTitle("A propos de moi"),
            // Spacer()
          ],
        ),
        Row(
          children: [Icon(Icons.home), Text("Lieu de naissance")],
        ),
        Row(
          children: [Icon(Icons.business_center_rounded), Text("developper")],
        ),
        Row(
          children: [Icon(Icons.favorite), Text("Marié")],
        ),
      ],
    );
  }

  Column listAmi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle("Amis"),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              stylizePhoto(
                  text: "langouste",
                  url:
                      "https://www.aquarium-larochelle.com/wp-content/uploads/2021/02/langouste-rouge-aquarium-la-rochelle-bloc3-560X560.jpg"),
              stylizePhoto(
                  text: "homard",
                  url:
                      "https://doris.ffessm.fr/var/doris/storage/images/images/curiosite-19907/172265-1-fre-FR/homarus-gammarus-sas91.jpg"),
              stylizePhoto(
                  text: "dromie",
                  url:
                      "https://doris.ffessm.fr/var/doris/storage/images/images/dromie-nue-23550/201409-1-fre-FR/dromia_personata-aps2011.jpg")
            ])),
      ],
    );
  }

  Column stylizePhoto({required String text, required String url}) {
    return Column(
      children: [
        Container(
            height: 200,
            width: 200,
            padding: EdgeInsets.only(left: 5),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                      image: NetworkImage(url), fit: BoxFit.fitHeight)),
            )),
        Text(text)
      ],
    );
  }

  Column listPost() {
    List<Widget> mesPostes = [];
    posts.forEach((p) {
      mesPostes.add(post(post: p));
    });

    return Column(
      children: mesPostes,
    );
  }

  Container post({required Post post}) {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 3, right: 3),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(225, 225, 225, 1)),
      child: Column(
        children: [
          Row(children: [
            photoProfile(20),
            Padding(padding: EdgeInsets.only(left: 8)),
            Text("Foo B"),
            Spacer(),
            Text(post.getTime())
          ]),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Image.asset(post.imagePath),
          ),
          Text(
            post.description,
            style: TextStyle(color: Colors.blueAccent),
          ),
          Divider(),
          Row(
            children: [
              Icon(Icons.favorite),
              Text(post.getLikes()),
              Spacer(),
              Icon(Icons.message),
              Text(post.getComments())
            ],
          )
        ],
      ),
    );
  }
}
