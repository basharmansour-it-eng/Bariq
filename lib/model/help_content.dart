/// محتوى المساعدة. النصوص نفسها في app_translations.dart بالمفاتيح:
/// faq_N_q / faq_N_a  و  terms_N_t / terms_N_b  و  privacy_N_t / privacy_N_b
/// لإضافة بند: زد العدد هنا وأضف مفاتيحه بالعربية والإنجليزية.

class FaqItem {
  final String questionKey;
  final String answerKey;
  const FaqItem(this.questionKey, this.answerKey);
}

class LegalSection {
  final String titleKey;
  final String bodyKey;
  const LegalSection(this.titleKey, this.bodyKey);
}

final faqItems = List.generate(
  8,
  (i) => FaqItem('faq_${i + 1}_q', 'faq_${i + 1}_a'),
);

final termsSections = List.generate(
  6,
  (i) => LegalSection('terms_${i + 1}_t', 'terms_${i + 1}_b'),
);

final privacySections = List.generate(
  6,
  (i) => LegalSection('privacy_${i + 1}_t', 'privacy_${i + 1}_b'),
);