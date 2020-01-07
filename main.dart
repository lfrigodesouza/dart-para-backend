import 'extensions.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() {
  main3();
  print('Hello World!');
  main2();
  networkRequest();
}

void main2() {
  List<String> comida = ['Coxinha', 'Risoles', 'Pão de Queijo', 'Doce'];
  comida[0];

  for (var item in comida) {
    print('Comida ${item.trim()}');
  }

  'Hello Iteris'.imprimeString();

  Map<String, int> bebidas = Map();
  bebidas['Coca-Cola'] = 2;
  bebidas['Suco'] = 3;
  bebidas['Suco'];

  var pessoa = Pessoa()
    ..nome = 'Lucas'
    ..idade = 29
    ..endereco = 'São Paulo';

  print('Pessoa: ${pessoa.nome}, idade: ${pessoa.idade}');
  Pessoa(endereco: '', idade: 0, nome: '');
  Pessoa.constructoor('');
}

void main3() async {
  var texto = await asyncOperation();
  texto.imprimeString();
}

void networkRequest() async {
  var url = 'https://www.googleapis.com/books/v1/volumes?q={http}';

  var response = await http.get(url);

  var jsonResponse = convert.jsonDecode(response.body);
  var booksResponse = BooksResponse.fromJson(jsonResponse);
  print('Number of books about http: ${booksResponse.totalItems}.');
}

class BooksResponse {
  String kind;
  int totalItems;

  BooksResponse({this.kind, this.totalItems});

  BooksResponse.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    totalItems = json['totalItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['totalItems'] = this.totalItems;
    return data;
  }
}

Future<String> asyncOperation() {
  return Future.value('Olá!');
}

class Pessoa {
  String nome;
  int idade;
  String endereco;

  Pessoa({this.nome, this.idade, this.endereco});

  Pessoa.constructoor(String nome) {
    this.nome = nome;
  }
}
