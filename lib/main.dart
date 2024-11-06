import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sos_pets/cachorroadotar.dart';
import 'veterinario.dart';
import 'adocao.dart';
import 'perdido.dart';
import 'curiosidade.dart';
import 'vaquinha.dart';
import 'cachorroadotar.dart';
import 'cachorroperdido.dart';

void main() {
  runApp(const Pets());
}

class Pets extends StatelessWidget {
  const Pets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'S.O.S Pets',
      color: const Color.fromARGB(255, 158, 154, 154),
      home: const MyHomePage(title: 'S.O.S Pets'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: buildDrawer(context),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildHeaderImage(),
                const SizedBox(height: 50),
                const Text(
                  'O que é possível realizar?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                buildInfoRow([
                  InfoItem(
                    imagePath: 'lib/assets/adocao.PNG',
                    title: 'Adoção',
                    description: ['Você pode fazer novas', 'amizades'],
                  ),
                  InfoItem(
                    imagePath: 'lib/assets/vaquinha.PNG',
                    title: 'Vaquinha',
                    description: [
                      'Você pode ajudar as vaquinhas',
                      'de animais que precisam'
                    ],
                  ),
                ]),
                const SizedBox(height: 50),
                buildInfoRow([
                  InfoItem(
                    imagePath: 'lib/assets/perdido.PNG',
                    title: 'Animais Perdidos',
                    description: [
                      'Você pode ajudar os animais',
                      'a encontrar seus donos'
                    ],
                  ),
                  InfoItem(
                    imagePath: 'lib/assets/veterinario.PNG',
                    title: 'Veterinários',
                    description: [
                      'Você pode procurar pelos melhores',
                      'veterinários da sua cidade'
                    ],
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeaderImage() {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: Image.asset('lib/assets/principalpet.PNG', fit: BoxFit.fitWidth),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 143, 125, 125),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey[300]),
              child: const Text(
                'Menu',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text(
                'Página Inicial',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            buildExpansionTile(context, 'Adotar', [
              {'title': 'Cachorros', 'route': AdotarCachorros()},
              {'title': 'Gatos'}
            ]),
            buildExpansionTile(context, 'Animais Perdidos', [
              {'title': 'Cachorros', 'route': Cachorroperdido()},
              {'title': 'Gatos'},
            ]),
            ListTile(
              title: const Text(
                'Curiosidades',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Curiosidade()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Vaquinha',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Vaquinha()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Veterinários',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Veterinario()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  ExpansionTile buildExpansionTile(
      BuildContext context, String title, List<Map<String, dynamic>> items) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      children: items
          .map(
            (item) => ListTile(
              title: Text(item['title']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item['route']),
                );
              },
            ),
          )
          .toList(),
    );
  }

  Widget buildInfoRow(List<InfoItem> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((item) => buildInfoItem(item)).toList(),
      ),
    );
  }

  Widget buildInfoItem(InfoItem item) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            child: Image.asset(item.imagePath, fit: BoxFit.cover),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              ...item.description.map(
                  (desc) => Text(desc, style: const TextStyle(fontSize: 16))),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoItem {
  final String imagePath;
  final String title;
  final List<String> description;

  InfoItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}