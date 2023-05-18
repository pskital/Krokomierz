String formatMinutes(int minutes) {
  final Duration d = Duration(minutes: minutes);
  final List<String> parts = d.toString().split(':');
  return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
}
