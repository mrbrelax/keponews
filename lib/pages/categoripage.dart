import 'package:flutter/material.dart';
import 'package:newsapp/pages/duniapage.dart';
import 'package:newsapp/pages/ekonomipage.dart';
import 'package:newsapp/pages/hiburanpage.dart';
import 'package:newsapp/pages/hukumpage.dart';
import 'package:newsapp/pages/humaniorapage.dart';
import 'package:newsapp/pages/lifestylepage.dart';
import 'package:newsapp/pages/metropage.dart';
import 'package:newsapp/pages/olahraga.dart';
import 'package:newsapp/pages/otomotifpage.dart';
import 'package:newsapp/pages/politikpage.dart';
import 'package:newsapp/pages/rilisperspage.dart';
import 'package:newsapp/pages/sepakbola.dart';
import 'package:newsapp/pages/teknopage.dart';
import 'package:newsapp/pages/wartabumipage.dart';

class CategoriPage extends StatefulWidget {
  const CategoriPage({super.key});

  @override
  State<CategoriPage> createState() => _CategoriPageState();
}

class _CategoriPageState extends State<CategoriPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Kepo", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              "News",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.grey,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/Politik.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PolitikPage(),
                        ),
                      );
                    },
                    child: const Center(
                      child: Text(
                        "POLITIK",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, blurRadius: 10),
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/Hukum_Ilustrasi.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HukumPage(),
                        ),
                      );
                    },
                    child: const Center(
                      child: Text(
                        "HUKUM",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(blurRadius: 10, color: Colors.grey),
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/ekonomi_new.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EkonomiPage(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "EKONOMI",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(blurRadius: 10, color: Colors.grey),
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/metro_city.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MetroPage(),
                        ),
                      );
                    },
                    child: const Center(
                      child: Text(
                        "METRO",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.grey,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/Sepakbola.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SepakBolaPage(),
                        ),
                      );
                    },
                    child: const Center(
                      child: Text(
                        "SEPAKBOLA",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: const [
                      BoxShadow(blurRadius: 10, color: Colors.grey),
                    ],
                    image: const DecorationImage(
                      image: AssetImage("assets/images/Olahraga_new.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OlahragaPage(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "OLAHRAGA",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/humaniora.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HumanioraPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "HUMANIORA",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: const [
                      BoxShadow(blurRadius: 10, color: Colors.grey),
                    ],
                    image: const DecorationImage(
                      image: AssetImage("assets/images/lifestyle.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LifeStylePage(),
                        ),
                      );
                    },
                    child: const Center(
                      child: Text(
                        "LIFESTYLE",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/hiburan.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HiburanPage(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "HIBURAN",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: const [
                      BoxShadow(blurRadius: 10, color: Colors.grey),
                    ],
                    image: const DecorationImage(
                      image: AssetImage("assets/images/world.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DuniaPage(),
                        ),
                      );
                    },
                    child: const Center(
                      child: Text(
                        "DUNIA",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, blurRadius: 12),
                    ],
                    image: const DecorationImage(
                      image: AssetImage("assets/images/tekno.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TeknoPage(),
                        ),
                      );
                    },
                    child: const Center(
                      child: Text(
                        "TEKNO",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, blurRadius: 12),
                    ],
                    image: const DecorationImage(
                      image: AssetImage("assets/images/otomotif.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtomotifPage(),
                        ),
                      );
                    },
                    child: const Center(
                      child: Text(
                        "OTOMOTIF",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, blurRadius: 12),
                    ],
                    image: const DecorationImage(
                        image: AssetImage("assets/images/warta-bumi.jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WartaBumiPage(),
                        ),
                      );
                    },
                    child: const Center(
                      child: Text(
                        "WARTA\nBUMI",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, blurRadius: 10),
                    ],
                    image: const DecorationImage(
                        image: AssetImage("assets/images/rilis-pers.jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RilisPersPage(),
                        ),
                      );
                    },
                    child: const Center(
                      child: Text(
                        "RILIS PERS",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
