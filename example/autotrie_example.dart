import 'package:autotrie/autotrie.dart';
import 'package:autotrie/src/autotrie_base.dart';

void main() {
  var engine = AutoComplete(engine: SortEngine.configMulti(Duration(seconds: 1), 15, 0.5, 0.5)); //You can also initialize with a starting databank.

  engine.enter('more'); // Enter more thrice.
  engine.enter('more');
  engine.enter('more');

  engine.enter('moody'); // Enter moody twice.
  engine.enter('moody');

  engine.enter('morose'); // Enter scattered words (with mo).
  engine.enter('morty');
  engine.enter('moment');
  engine.enter('momentum');

  engine.enter('sorose'); // Enter scattered words (without mo).
  engine.enter('sorty');

  engine.delete('morose'); // Delete morose.

  // Check if morose is deleted.
  print('Morose deletion check: ${!engine.contains('morose')}');

  // Check if engine is empty.
  print('Engine emptiness check: ${engine.isEmpty}');

  // Suggestions starting with 'mo'.
  // They've been ranked by frequency and recency. Since they're all so similar
  // in recency, frequency takes priority.
  print("'mo' suggestions: ${engine.suggest('mo')}");
  // Result: [more, moody, momentum, moment, morty]

  // Get all entries.
  // They've not been sorted.
  print('All entries: ${engine.allEntries}');
  // Result: [more, moody, sorty, sorose, momentum, moment, morty]
}

// Check the API Reference for the latest information and adv.
// methods from this class.