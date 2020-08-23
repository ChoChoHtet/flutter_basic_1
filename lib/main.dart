import 'package:flutter/material.dart';
//external package
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Start up Name Generator',
      home: RandomWords(),
      );
  }
}
class RandomWords extends StatefulWidget{
  @override
  _RandomWordState createState() => _RandomWordState();
}
class _RandomWordState extends State<RandomWords>{
  final  List<WordPair> _suggestions= <WordPair>[];
  final TextStyle _biggerFont= const TextStyle(fontSize: 18);
  //display suggest word paring
  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext _context,int i){
        if(i.isOdd){
          return Divider();
        }
        final int index= i~/2;
        if(index == _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      });
  }
  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(pair.asPascalCase,style: _biggerFont,),
    );
  }
  @override
  Widget build(BuildContext context) {
//    final wordPair= WordPair.random();
//    return Text(wordPair.asPascalCase);
  // Scaffold - the basic material design visual layout
  return Scaffold(
    appBar: AppBar(
      title: Text('Start up Name Generator'),
    ),
    body: _buildSuggestions(),
  );
  }
  
}