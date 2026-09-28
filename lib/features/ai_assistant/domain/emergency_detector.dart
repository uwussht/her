/// Spots messages that need urgent care rather than an answer.
///
/// Runs on the device before anything is sent, so the urgent-care card
/// appears instantly and even with no connection. The backend checks again;
/// either side saying yes is enough.
class EmergencyDetector {
  const EmergencyDetector();

  /// Kazakhstan's ambulance number.
  static const String emergencyNumber = '103';

  /// Phrases that mean "go to a doctor now", in all three app languages.
  ///
  /// Matched as substrings against lowercased text, so Russian and Kazakh
  /// case endings are covered without a stemmer.
  static const List<String> _phrases = [
    // Heavy bleeding
    'обильное кровотечение',
    'сильное кровотечение',
    'кровотечение не останавлива',
    'много крови',
    'қатты қан кет',
    'қан тоқтама',
    'heavy bleeding',
    'bleeding heavily',
    "bleeding won't stop",
    'bleeding that will not stop',
    // Severe pain
    'невыносимая боль',
    'сильнейшая боль',
    'острая боль внизу живота',
    'шыдамайтын ауырсыну',
    'қатты ауырсыну',
    'severe pain',
    'unbearable pain',
    'worst pain',
    // Fainting and breathing
    'теряю сознание',
    'потеря сознания',
    'упала в обморок',
    'есімнен таң',
    'талып қал',
    'fainting',
    'passed out',
    'can\'t breathe',
    'cannot breathe',
    'не могу дышать',
    'тыныс ала алмай',
    // Pregnancy red flags
    'кровотечение при беременности',
    'подтекают воды',
    'отошли воды',
    'ребёнок не шевелится',
    'ребенок не шевелится',
    'бала қозғалмай',
    'baby is not moving',
    'baby stopped moving',
    'waters broke',
    // Self-harm
    'хочу умереть',
    'покончить с собой',
    'өз-өзіме қол',
    'want to die',
    'kill myself',
    'suicidal',
  ];

  /// True when [message] contains an emergency phrase.
  bool isEmergency(String message) {
    final text = message.toLowerCase();
    return _phrases.any(text.contains);
  }
}
