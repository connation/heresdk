// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'heresdk_consent_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Vietnamese (`vi`).
class HereSdkConsentLocalizationsVi extends HereSdkConsentLocalizations {
  HereSdkConsentLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get consent_noThanks => 'Không, cảm ơn';

  @override
  String get consent_okSure => 'Đồng ý';

  @override
  String get consent_title =>
      'Ứng dụng này có thể thu thập thông tin về môi trường xung quanh bạn, chẳng hạn như tín hiệu Wi-Fi và mạng di động lân cận';

  @override
  String get consent_message =>
      'Khi bạn cho phép, thông tin này sẽ được gửi đến HERE để giúp cải thiện các dịch vụ của HERE. Thông tin này không xác định danh tính của bạn và HERE sẽ chỉ lưu giữ thông tin đã ẩn danh.';

  @override
  String get consent_mayChangeMind => 'Bạn có thể hủy đồng ý bất cứ lúc nào';

  @override
  String get consent_learnMore => 'Tìm hiểu thêm các biện pháp đảm bảo quyền riêng tư tại HERE';

  @override
  String get consent_question => 'Bạn có sẵn lòng cung cấp thông tin này cho HERE không?';
}
