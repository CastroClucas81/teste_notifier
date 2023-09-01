enum CambioEnum {
  manual('Manual'),
  automatico('Automático');

  const CambioEnum(this.title);

  final String title;

  static CambioEnum? fromString(String text) {
    final cambio =
        CambioEnum.values.where((cambio) => cambio.title == text).toList();

    return cambio.isNotEmpty ? cambio.first : null;
  }
}
