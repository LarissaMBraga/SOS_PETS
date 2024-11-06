import 'package:flutter/material.dart';
import 'package:sos_pets/cachorroadotar.dart';
import 'veterinario.dart';
import 'adocao.dart';
import 'perdido.dart';
import 'curiosidade.dart';
import 'vaquinha.dart';
import 'cachorroadotar.dart';
import 'cachorroperdido.dart';

class Vaquinha extends StatelessWidget {
  const Vaquinha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vaquinha'),
      ),
      drawer: Drawer(
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
                onTap: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
              ),
              ExpansionTile(
                title: const Text(
                  'Adotar',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                children: ['Cachorros', 'Gatos']
                    .map((item) => ListTile(title: Text(item), onTap: () {}))
                    .toList(),
              ),
              ExpansionTile(
                title: const Text(
                  'Animais Perdidos',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                children: ['Cachorros', 'Gatos']
                    .map((item) => ListTile(title: Text(item), onTap: () {}))
                    .toList(),
              ),
              ListTile(
                title: const Text(
                  'Curiosidades',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Curiosidade()),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'Vaquinha',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
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
                    MaterialPageRoute(
                        builder: (context) => const Veterinario()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Página de Vaquinha',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
