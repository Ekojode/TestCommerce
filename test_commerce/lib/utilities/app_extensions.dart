extension AppStringExtensions on String {
  String get capitalizeFirst {
    if (isEmpty) {
      return '';
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get toCurrency {
    return 'NGN $this';
  }
}
