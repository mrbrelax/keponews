import 'package:flutter/material.dart';
import 'package:newsapp/components/terkinilisthome.dart';
import 'package:newsapp/components/terpopulerlisthome.dart';
import 'package:newsapp/models/image_pageview.dart';
import 'package:newsapp/pages/ekonomipage.dart';
import 'package:newsapp/pages/hukumpage.dart';
import 'package:newsapp/pages/metropage.dart';
import 'package:newsapp/pages/olahraga.dart';
import 'package:newsapp/pages/pageterkini.dart';
import 'package:newsapp/pages/politikpage.dart';
import 'package:newsapp/pages/sepakbola.dart';
import 'package:newsapp/pages/terpopulerpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<BeritaModels> beritaModels = [];
  bool isLoading = true;

  void fetchNews() async {
    isLoading = true;
    setState(() {});
    isLoading = false;
  }

  final List<SliderItemPageView> slidersPageView = [
    const SliderItemPageView(
      imageSliderPageView: 'assets/images/Politik.jpg',
      textSliderPageView: 'POLITIK',
      destinationPage: PolitikPage(),
    ),
    const SliderItemPageView(
      imageSliderPageView: 'assets/images/Hukum_Ilustrasi.jpg',
      textSliderPageView: 'HUKUM',
      destinationPage: HukumPage(),
    ),
    const SliderItemPageView(
      imageSliderPageView: 'assets/images/ekonomi_new.png',
      textSliderPageView: 'EKONOMI',
      destinationPage: EkonomiPage(),
    ),
    const SliderItemPageView(
      imageSliderPageView: 'assets/images/metro_city.jpg',
      textSliderPageView: 'METRO',
      destinationPage: MetroPage(),
    ),
    const SliderItemPageView(
      imageSliderPageView: 'assets/images/Sepakbola.jpg',
      textSliderPageView: 'SEPAK BOLA',
      destinationPage: SepakBolaPage(),
    ),
    const SliderItemPageView(
      imageSliderPageView: 'assets/images/Olahraga_new.jpeg',
      textSliderPageView: 'OLAHRAGA',
      destinationPage: OlahragaPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Kepo", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              "News",
              style: TextStyle(
                  color: Colors.blue[400], fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox.fromSize(
              size: const Size.fromHeight(180.0),
              child: PageView(
                children: slidersPageView,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Berita Terkini",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TerkiniPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Lihat Semua",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox.fromSize(
              size: const Size.fromHeight(400),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: TerkiniListHome(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Terpopuler",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TerpopulerPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Lihat Semua",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox.fromSize(
              size: const Size.fromHeight(400),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: TerpopulerListHome(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
