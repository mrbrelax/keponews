import 'package:flutter/material.dart';
import 'package:newsapp/models/berita_models.dart';
import 'package:newsapp/services/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class TerpopulerListHome extends StatefulWidget {
  const TerpopulerListHome({super.key});

  @override
  State<TerpopulerListHome> createState() => _TerpopulerListHomeState();
}

class _TerpopulerListHomeState extends State<TerpopulerListHome> {
  bool isLoading = true;
  List<BeritaModels>? beritamodelsTerpopuler = [];

  Future<void> _fetchTopNews() async {
    isLoading = true;
    final reusltmodelTerpopuler = await NetworkService.fetchTerpopuler();
    beritamodelsTerpopuler = reusltmodelTerpopuler;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _fetchTopNews();
  }

  Future<void> _refreshTopNews() async {
    await _fetchTopNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshTopNews,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: beritamodelsTerpopuler!.length > 3
                    ? 3
                    : beritamodelsTerpopuler!.length,
                itemBuilder: (BuildContext context, int index) {
                  final urlModelTopNews = beritamodelsTerpopuler![index];
                  return Card(
                    child: ListTile(
                      leading: Image(
                        image: NetworkImage(urlModelTopNews.image),
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        urlModelTopNews.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Text(
                        '${urlModelTopNews.description} ...',
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse(urlModelTopNews.link));
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
