import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return Clase();
  }
}

class Clase extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(flex: 1, child: Center(child: Text("Pagina Principal"))),
            Expanded(
              flex: 3,
              child: Column(mainAxisAlignment: MainAxisAlignment.center),
            ),
            Expanded(
              flex: 3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.network(
                    'https://townandcountryremovals.com/wp-content/uploads/2013/10/firefox-logo-200x200.png',
                  ),
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQszhtOwcIhG5vZbh6Ck3EgylGlFyuIO6XOoQ&s',
                  ),
                  Image.network(
                    'https://www.governmentjobs.com/AgencyPages/alantam/agencyImages/download/chrome-logo-200x200.png',
                  ),
                  Image.network(
                    'https://i.pinimg.com/200x/fb/85/67/fb8567391d0064cea7227ba88147c8d7.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
