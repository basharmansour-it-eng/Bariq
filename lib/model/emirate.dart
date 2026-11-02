enum Emirate {
  abuDhabi,
  dubai,
  sharjah,
  ajman,
  ummAlQuwain,
  rasAlKhaimah,
  fujairah,
}

extension EmirateX on Emirate {
  /// مفتاح الترجمة: emirate_dubai ...
  String get labelKey => 'emirate_$name';
}