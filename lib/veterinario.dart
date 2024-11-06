import 'package:flutter/material.dart';
import 'package:sos_pets/curiosidade.dart';

class Veterinario extends StatelessWidget {
  const Veterinario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Veterinários'),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildVeterinarioCard(
                      'Veterinário 1', '(12) 3456-7890', 'Desconhecido'),
                  const SizedBox(width: 16),
                  _buildVeterinarioCard(
                      'Veterinário 2', '(12) 9876-5432', 'Desconhecido'),
                  const SizedBox(width: 16),
                  _buildVeterinarioCard(
                      'Veterinário 3', '(12) 1234-5678', 'Desconhecido'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVeterinarioCard(String nome, String telefone, String local) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/user_icon.png'),
          backgroundColor: Colors.grey[300],
        ),
        const SizedBox(height: 8),
        Text(
          nome,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Telefone: $telefone',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Text(
          'Local de Atendimento: $local',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
