/// Language types enum.
enum LanguageTypes {
  TR,
  EN,
  FR,
  DE,
}

/// Extension for language types enum.
/// Returns the value of the language type.
/// Throws an [Exception] if the language type is not defined.
extension LanguageTypesExtension on LanguageTypes {
  String get value {
    switch (this) {
      case LanguageTypes.TR:
        return 'TR';
      case LanguageTypes.EN:
        return 'EN';
      case LanguageTypes.FR:
        return 'FR';
      case LanguageTypes.DE:
        return 'DE';
      default:
        throw Exception('Language type is not defined.');
    }
  }
}
