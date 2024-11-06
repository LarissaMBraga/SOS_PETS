import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data'; // Para manipulação de bytes da imagem
import 'curiosidade.dart'; // Certifique-se de importar a página Curiosidade

class Cachorroperdido extends StatefulWidget {
  const Cachorroperdido({super.key});

  @override
  State<Cachorroperdido> createState() => _AdotarCachorrosState();
}

class _AdotarCachorrosState extends State<Cachorroperdido> {
  Uint8List? _imageData;
  String? _idade;
  String? _dono;
  String? _nome;
  String? _contato;
  String? _local;
  String? _detalhes;
  final List<Map<String, dynamic>> _animais = [];

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageData = bytes;
      });
    }
  }

  void _openAddPetDialog() {
    _imageData = null;
    _idade = null;
    _nome = null;
    _local = null;
    _dono = null;
    _contato = null;
    _detalhes = null;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar Animal'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _imageData == null
                        ? const Icon(Icons.add_a_photo, size: 40)
                        : Image.memory(
                            _imageData!,
                            fit: BoxFit.cover,
                            width: 300,
                            height: 300,
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Qual o seu nome',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => _nome = value,
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Você é dono do animal ou quem encontrou?',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => _dono = value,
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Idade do Animal',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _idade = value,
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Número de contato',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => _contato = value,
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Onde foi visto pela última vez?',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => _local = value,
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Detalhes Sobre o Animal',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  onChanged: (value) => _detalhes = value,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (_imageData != null) {
                  setState(() {
                    _animais.insert(0, {
                      'image': _imageData,
                      'idade': _idade,
                      'local': _local,
                      'dono': _dono,
                      'nomeDono': _nome,
                      'contato': _contato,
                      'detalhes': _detalhes,
                      'isExpanded': false,
                    });
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor, selecione uma imagem.'),
                    ),
                  );
                }
                Navigator.of(context).pop();
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _openAnimalDetailsDialog(Map<String, dynamic> animal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detalhes do Animal'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.memory(
                animal['image'],
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text('Idade: ${animal['idade'] ?? 'N/A'}'),
              Text('Contato: ${animal['contato'] ?? 'N/A'}'),
              Text(
                  'Você é o dono ou quem encontrou?: ${animal['dono'] ?? 'N/A'}'),
              Text(
                  'Onde foi visto pela última vez: ${animal['local'] ?? 'N/A'}'),
              Text('Detalhes: ${animal['detalhes'] ?? 'N/A'}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perdido - Cachorros'),
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
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _animais.length,
        itemBuilder: (context, index) {
          final animal = _animais[index];
          return Card(
            child: Column(
              children: [
                ListTile(
                  leading: animal['image'] != null
                      ? GestureDetector(
                          onTap: () => _openAnimalDetailsDialog(animal),
                          child: Image.memory(
                            animal['image'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(Icons.pets, size: 50),
                  title: Text('Idade: ${animal['idade'] ?? 'N/A'}'),
                  trailing: IconButton(
                    icon: Icon(animal['isExpanded']
                        ? Icons.expand_less
                        : Icons.expand_more),
                    onPressed: () {
                      setState(() {
                        animal['isExpanded'] = !animal['isExpanded'];
                      });
                    },
                  ),
                ),
                if (animal['isExpanded'])
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nome do Dono: ${animal['nomeDono'] ?? 'N/A'}'),
                        Text('Contato: ${animal['contato'] ?? 'N/A'}'),
                        Text('Detalhes: ${animal['detalhes'] ?? 'N/A'}'),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddPetDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
