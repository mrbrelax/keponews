import 'package:flutter/material.dart';
import 'package:newsapp/models/berita_models.dart';
import 'package:newsapp/services/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class HumanioraPage extends StatefulWidget {
  const HumanioraPage({super.key});

  @override
  State<HumanioraPage> createState() => _HumanioraPageState();
}

class _HumanioraPageState extends State<HumanioraPage> {
  bool isLoading = true;
  List<BeritaModels>? beritamodelHumaniora = [];

  Future<void> _fetchHumaniora() async {
    isLoading = true;
    final resultHumaniora = await NetworkService.fetchHumaniora();
    beritamodelHumaniora = resultHumaniora;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _fetchHumaniora();
  }

  Future<void> refreshHumaniora() async {
    await _fetchHumaniora();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Kepo",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refreshHumaniora,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
              padding: const EdgeInsets.all(16.0),
                itemCount: beritamodelHumaniora!.length,
                itemBuilder: (BuildContext context, int index) {
                  final urlHumaniora = beritamodelHumaniora![index];
                  return Card(
                    child: ListTile(
                      leading: Image(
                        image: NetworkImage(urlHumaniora.image),
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        urlHumaniora.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Text(
                        '${urlHumaniora.description} ...',
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse(urlHumaniora.link));
                      },
                    ),
                  );
                }),
      ),
    );
  }
}
