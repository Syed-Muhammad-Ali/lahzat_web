class PromoCodeItem {
  final String title;
  final String code;
  final String generationDate;
  final String validUntil;
  final String discount;
  final String status;

  PromoCodeItem({
    required this.title,
    required this.code,
    required this.generationDate,
    required this.validUntil,
    required this.discount,
    required this.status,
  });
}