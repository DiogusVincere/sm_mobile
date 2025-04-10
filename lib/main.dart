import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SM Mobile App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/notas': (context) => NotasScreen(),
        '/informacoes': (context) => InformacoesScreen(),
        '/jogadores': (context) => JogadoresScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Text(
          'Bem-vindo ao SM Mobile!',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Notas',
            tooltip: 'Tela de Notas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Informações',
            tooltip: 'Tela de Informações Pessoais',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Jogadores',
            tooltip: 'Tela de Jogadores',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/notas');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/informacoes');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/jogadores');
          }
        },
      ),
    );
  }
}

// Tela 1: Notas do aluno
class NotasScreen extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController nota1Controller = TextEditingController();
  final TextEditingController nota2Controller = TextEditingController();
  final TextEditingController nota3Controller = TextEditingController();
  final TextEditingController nota4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notas do Aluno')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome do Aluno'),
            ),
            TextField(
              controller: nota1Controller,
              decoration: InputDecoration(labelText: 'Nota 1'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: nota2Controller,
              decoration: InputDecoration(labelText: 'Nota 2'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: nota3Controller,
              decoration: InputDecoration(labelText: 'Nota 3'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: nota4Controller,
              decoration: InputDecoration(labelText: 'Nota 4'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                double nota1 = double.tryParse(nota1Controller.text) ?? 0.0;
                double nota2 = double.tryParse(nota2Controller.text) ?? 0.0;
                double nota3 = double.tryParse(nota3Controller.text) ?? 0.0;
                double nota4 = double.tryParse(nota4Controller.text) ?? 0.0;

                double media = (nota1 + nota2 + nota3 + nota4) / 4;
                String situacao = media >= 6 ? 'Aprovado' : 'Reprovado';

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(nomeController.text),
                    content: Text('Média: $media\nSituação: $situacao'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Fechar'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Calcular Média'),
            ),
          ],
        ),
      ),
    );
  }
}

// Tela 2: Informações Pessoais
class InformacoesScreen extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Informações Pessoais')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: idadeController,
              decoration: InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: enderecoController,
              decoration: InputDecoration(labelText: 'Endereço'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: telefoneController,
              decoration: InputDecoration(labelText: 'Telefone'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Informações Pessoais'),
                    content: Text(
                      'Nome: ${nomeController.text}\n'
                      'Idade: ${idadeController.text}\n'
                      'Endereço: ${enderecoController.text}\n'
                      'Email: ${emailController.text}\n'
                      'Telefone: ${telefoneController.text}',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Fechar'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Exibir Informações'),
            ),
          ],
        ),
      ),
    );
  }
}

// Tela 3: Jogadores
class JogadoresScreen extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController golsController = TextEditingController();
  final List<Map<String, String>> jogadores = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jogadores')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome do Jogador'),
            ),
            TextField(
              controller: idadeController,
              decoration: InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: golsController,
              decoration: InputDecoration(labelText: 'Quantidade de Gols/Pontos'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                jogadores.add({
                  'nome': nomeController.text,
                  'idade': idadeController.text,
                  'gols': golsController.text,
                });

                nomeController.clear();
                idadeController.clear();
                golsController.clear();

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Jogadores'),
                    content: ListView.builder(
                      itemCount: jogadores.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(jogadores[index]['nome']!),
                          subtitle: Text(
                            'Idade: ${jogadores[index]['idade']} - Gols/Pontos: ${jogadores[index]['gols']}',
                          ),
                        );
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Fechar'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Adicionar Jogador'),
            ),
          ],
        ),
      ),
    );
  }
}
