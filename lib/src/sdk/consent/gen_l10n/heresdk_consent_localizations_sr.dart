// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Serbian (`sr`).
class HereSdkConsentLocalizationsSr extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get consent_noThanks => 'Ne, hvala';

  @override
  String get consent_okSure => 'Da, naravno';

  @override
  String get consent_title =>
      'Ova aplikacija može da prikuplja podatke o vašem okruženju, npr. o Wi-Fi i signalima mobilne mreže';

  @override
  String get consent_message =>
      'Uz vaš dozvolu se ti podaci šalju kompaniji HERE radi poboljšanja njenih usluga. Ti podaci se ne koriste za vašu identifikaciju, a HERE zadržava isključivo anonimne podatke.';

  @override
  String get consent_mayChangeMind => 'Pristanak možete da povučete u bilo kom trenutku';

  @override
  String get consent_learnMore => 'Saznajte više o smernicama privatnosti kompanije HERE';

  @override
  String get consent_question => 'Da li biste ustupili te podatke kompaniji HERE?';
}
