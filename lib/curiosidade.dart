import 'package:flutter/material.dart';
import 'package:sos_pets/vaquinha.dart';
import 'package:sos_pets/veterinario.dart';

class Curiosidade extends StatelessWidget {
  const Curiosidade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curiosidade'),
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
                  Navigator.pop(context);
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
                    MaterialPageRoute(
                        builder: (context) => const Veterinario()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Curiosidades Sobre Cães e Gatos',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ..._buildCuriosityList(),
        ],
      ),
    );
  }

  List<Widget> _buildCuriosityList() {
    const curiosities = [
      "Cebola e alho são extremamente tóxicos para cães e gatos e podem causar anemia.",
      "Chocolate, especialmente o amargo, contém teobromina e é venenoso para pets.",
      "O abacate possui uma substância chamada persina, que é tóxica para cães e gatos.",
      "Uvas e passas podem causar insuficiência renal em cães e gatos.",
      "Xilitol, um adoçante comum, pode causar hipoglicemia e até falência hepática em cães.",
      "Ossos cozidos podem quebrar e causar lesões internas em cães e gatos.",
      "Em caso de envenenamento, leve seu pet ao veterinário imediatamente e evite induzir o vômito sem orientação profissional.",
      "Plantas como lírios e azaleias são tóxicas para gatos e devem ser mantidas fora do alcance.",
      "O álcool é extremamente tóxico para cães e gatos e nunca deve ser oferecido a eles.",
      "Produtos de limpeza com amônia e alvejantes podem ser perigosos para a saúde dos pets.",
      "O leite pode causar diarreia em gatos, pois muitos são intolerantes à lactose.",
      "Certifique-se de que seu pet tem acesso constante a água limpa e fresca.",
      "Cachorros não suam como os humanos; eles regulam a temperatura pela respiração.",
      "A vacinação anual é essencial para proteger cães e gatos de doenças graves.",
      "O sobrepeso em pets pode levar a diabetes, problemas cardíacos e articulares.",
      "É importante dar antipulgas regularmente para prevenir infestações e doenças.",
      "17. Animais devem ser escovados regularmente para evitar nós e problemas de pele.",
      "18. Os cães entendem tons emocionais de voz e respondem a comandos com entonação positiva.",
      "19. Os gatos são excelentes caçadores e preferem horários noturnos para explorar.",
      "20. Cachorros conseguem farejar doenças como o câncer e crises de epilepsia.",
      "21. A exposição ao sol é importante para cães, mas deve ser moderada em horários seguros.",
      "22. Gatos são extremamente limpos e dedicam até 50% do dia à sua higiene.",
      "23. Gatos e cães podem se adaptar à rotina dos donos, mas precisam de atividades diárias.",
      "24. Evite dar carne crua para cães e gatos, pois pode conter bactérias perigosas.",
      "25. Escovar os dentes dos pets ajuda a evitar doenças periodontais.",
      "26. Alguns cães gostam de frutas, como maçãs e bananas, mas sem sementes.",
      "27. Cães podem desenvolver ansiedade por separação; treine para isso desde cedo.",
      "28. Cães e gatos precisam de espaço seguro e confortável para descansar.",
      "29. Brinquedos de mastigação ajudam a manter a saúde dental dos cães.",
      "30. Gatos gostam de ambientes verticais, como prateleiras e arranhadores altos.",
      "31. A síndrome do gato parvo é uma doença viral que pode ser prevenida com vacina.",
      "32. Filhotes precisam de alimentação específica para o seu crescimento e energia.",
      "33. Cachorros precisam de pelo menos 30 minutos de exercício diário.",
      "34. Nunca force interações; respeite o espaço dos pets para evitar estresse.",
      "35. Cães de porte pequeno têm metabolismo mais rápido e precisam de porções menores.",
      "36. O contato com outros cães e gatos socializa o pet e previne comportamentos agressivos.",
      "37. A castração evita superpopulação e problemas hormonais em cães e gatos.",
      "38. Gatos ronronam para comunicar afeto, mas também quando estão com dor ou medo.",
      "39. A audição dos cães é muito mais aguçada que a dos humanos, detectando sons distantes.",
      "40. Manter as unhas aparadas evita arranhões e machucados tanto para o pet quanto para o dono.",
      "41. Os bigodes dos gatos são sensores de espaço, ajudando-os a navegar em ambientes escuros.",
      "42. Evite perfumes e produtos fortes, pois o olfato dos pets é extremamente sensível.",
      "43. Banhos regulares são essenciais para cães, mas menos frequentes para gatos.",
      "Cachorros podem ver em cores, mas com menos variedade do que os humanos.",
      "Gatos preferem água corrente e fresca; fontes de água são excelentes para eles.",
      "Alimentação balanceada é a chave para a saúde e longevidade dos pets.",
      "O estresse pode levar à queda de pelos em gatos; observe mudanças de comportamento.",
      "Caminhadas e jogos fortalecem o vínculo entre o dono e o cão.",
      "Atenção a sinais de dor ou desconforto: pets podem esconder sintomas de doenças.",
      "O ambiente ideal para um pet é limpo, seguro e enriquecido com brinquedos e arranhadores."
    ];

    return curiosities
        .map((curiosity) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                curiosity,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ))
        .toList();
  }
}
