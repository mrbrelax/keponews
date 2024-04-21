import 'package:flutter/material.dart';
import 'package:newsapp/models/berita_models.dart';
import 'package:newsapp/services/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class TerkiniPage extends StatefulWidget {
  const TerkiniPage({super.key});

  @override
  State<TerkiniPage> createState() => _TerkiniPageState();
}

class _TerkiniPageState extends State<TerkiniPage> {
  List<BeritaModels>? beritaModelsTerkini = [];
  bool isLoading = true;

  Future<void> _fetchNews() async {
    isLoading = true;
    final resultTerkini = await NetworkService.fetchURLTerkini();
    beritaModelsTerkini = resultTerkini;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _refreshTerkini() async{
    await _fetchNews();
  }

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
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshTerkini,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  final urlModels = beritaModelsTerkini![index];
                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image(image: NetworkImage(urlModels.image)),
                      title: Text(
                        urlModels.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Text(
                        '${urlModels.description}...',
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: (){
                        launchUrl(Uri.parse(urlModels.link));
                      },
                    ),
                  );
                },
                itemCount: beritaModelsTerkini!.length < 3 ? 3 : beritaModelsTerkini!.length,
              ),
      ),
    );
  }
}
