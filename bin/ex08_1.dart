library ex08;

part 'variables.dart';

void main() {
  adjectives.shuffle();
  nouns.shuffle();
  verbs.shuffle();
  adverbs.shuffle();
  print("------------------------------------------------------");  
  print("List of sentences by randomly using sentence elements:"); 
  print("------------------------------------------------------");
  print('${adjectives.elementAt(0)} ''${nouns.elementAt(0)} ''${verbs.elementAt(0)} ''${adverbs.elementAt(0)}.');
  print('${adjectives.elementAt(1)} ''${nouns.elementAt(1)} ''${verbs.elementAt(1)} ''${adverbs.elementAt(1)}.');
  print('${adjectives.elementAt(2)} ''${nouns.elementAt(2)} ''${verbs.elementAt(2)} ''${adverbs.elementAt(2)}.');
  print('${adjectives.elementAt(3)} ''${nouns.elementAt(3)} ''${verbs.elementAt(3)} ''${adverbs.elementAt(3)}.');
  print('${adjectives.elementAt(4)} ''${nouns.elementAt(4)} ''${verbs.elementAt(4)} ''${adverbs.elementAt(4)}.');
  print('${adjectives.elementAt(5)} ''${nouns.elementAt(5)} ''${verbs.elementAt(5)} ''${adverbs.elementAt(5)}.');
  print('${adjectives.elementAt(6)} ''${nouns.elementAt(6)} ''${verbs.elementAt(6)} ''${adverbs.elementAt(6)}.');
  print('${adjectives.elementAt(1)} ''${nouns.elementAt(2)} ''${verbs.elementAt(3)} ''${adverbs.elementAt(4)}.');
  }