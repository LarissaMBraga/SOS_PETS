import 'package:flutter/material.dart';


void main() {
  runApp(const Pets());
}


class Pets extends StatelessWidget {
  const Pets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'S.O.S Pets',
      theme: ThemeData(   
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'S.O.S Pets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
      
        title: Text(widget.title),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

 ListTile(title: const Text('Página Inicial'),
              onTap:()
                       {
                  
                   },
                 ),
           
            ListTile(title: const Text('Doação'),
              onTap:()
                       {
                  
                   },
                 ),

          ExpansionTile(
            title: const Text('Animais Perdidos'),
       children: [
         ListTile(title: const Text(''),
              onTap:()
                       {
                          //Tela de animais perdidos
                   },
                 ),
       ],
        ),

                 ListTile(title: const Text('Curiosidades'),
              onTap:()
                       {
                          //Tela de animais perdidos
                   },
                 ),
                  ListTile(title: const Text('Vaquinha'),
              onTap:()
                       {
                  
                   },
                 ),

                  ListTile(title: const Text('Veterinários'),
              onTap:()
                       {
                  
                   },
                 ),
               ],
             ) ,
           ),
           

      body: const Center(
    
        child: Column(

         children: [
               //imagem
          Padding(padding: EdgeInsets.all(16.0),
            child: Text ( ' Seja bem vindo(a) ao S.O.S Pets',
            style: TextStyle ( fontSize: 24,  fontWeight: FontWeight.bold, ),
           ),
          ),
        
          Padding(padding: EdgeInsets.all(16.0),
            child: Text ( ' Missão do projeto',
           style: TextStyle ( fontSize: 24, fontWeight: FontWeight.bold, ),
           ),
          ),
        ],
       ),
      ),
    );
  }
}

        