import 'package:get/get.dart';

/// استخدمها هكذا: Text('book_now'.tr)
/// قاعدة: أي نص جديد يُضاف هنا بالعربية والإنجليزية معاً.
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'ar': {
      // عام
      'app_name': 'بريق',
      'tagline': 'سيارتك تلمع.. ونحن نأتي إليك',
      'language': 'اللغة',
      'switch_language': 'English',
      'loading': 'جاري التحميل...',
      'skip': 'تخطَّ',
      'next': 'التالي',
      'get_started': 'ابدأ الآن',
      'continue_btn': 'متابعة',
      'verify': 'تأكيد',

      // الترحيب
      'onb1_title': 'نأتي إلى موقعك',
      'onb1_desc':
          'احجز من هاتفك وسيصل فني محترف إلى بيتك أو مكتبك أو موقف سيارتك.',
      'onb2_title': 'غسيل بدون ماء',
      'onb2_desc':
          'تقنية الغسيل الجاف تحافظ على طلاء سيارتك من حرارة الإمارات وتوفّر المياه.',
      'onb3_title': 'خدمة موثوقة وأسعار واضحة',
      'onb3_desc': 'أسعار ثابتة، وتتبّع مباشر للفني، وصور قبل وبعد الغسيل.',

      // تسجيل الدخول
      'login_title': 'مرحباً بك في بريق',
      'login_subtitle': 'أدخل رقم هاتفك لتسجيل الدخول أو إنشاء حساب جديد',
      'phone_label': 'رقم الهاتف',
      'phone_invalid': 'أدخل رقماً إماراتياً من 9 أرقام يبدأ بـ 5',
      'send_code': 'إرسال رمز التحقق',
      'terms_notice': 'بالمتابعة فأنت توافق على شروط الاستخدام وسياسة الخصوصية',

      // رمز التحقق
      'otp_title': 'رمز التحقق',
      'otp_subtitle': 'أرسلنا رمزاً من 6 أرقام إلى @phone',
      'resend_in': 'إعادة الإرسال بعد @time',
      'resend_code': 'إعادة إرسال الرمز',
      'code_resent': 'تم إرسال رمز جديد',

      // إكمال الملف الشخصي
      'profile_setup_title': 'أخبرنا عن نفسك',
      'profile_setup_subtitle':
          'سنستخدم اسمك لمناداتك ولينسّق الفني معك عند الوصول',
      'full_name': 'الاسم الكامل',
      'full_name_hint': 'مثال: أحمد محمد',
      'email_optional': 'البريد الإلكتروني (اختياري)',
      'email_invalid': 'البريد الإلكتروني غير صحيح',

      // الرئيسية
      'hello': 'مرحباً 👋',
      'home_subtitle': 'متى تريد أن نغسل سيارتك؟',
      'book_now': 'احجز غسلة الآن',
      'schedule': 'جدولة موعد',
      'our_services': 'خدماتنا',
      'see_all': 'عرض الكل',

      // الخدمات
      'service_exterior': 'غسيل خارجي',
      'service_interior': 'تنظيف داخلي',
      'service_full': 'باقة كاملة',
      'service_waterless': 'غسيل بدون ماء',
      'service_polish': 'تلميع وحماية',
      'service_ceramic': 'سيراميك',
      'from_price': 'من @price د.إ',
      'eco_badge': 'صديق للبيئة',

      // التنقل
      'tab_home': 'الرئيسية',
      'tab_orders': 'طلباتي',
      'tab_offers': 'العروض',
      'tab_profile': 'حسابي',

      'coming_soon': 'قريباً',

      // حسابي
      'section_account': 'الحساب',
      'section_general': 'عام',
      'profile_my_cars': 'سياراتي',
      'profile_addresses': 'عناويني المحفوظة',
      'profile_subscriptions': 'اشتراكاتي',
      'profile_invite': 'ادعُ أصدقاءك',
      'profile_help': 'المساعدة والدعم',
      'profile_terms': 'الشروط والخصوصية',
      'logout': 'تسجيل الخروج',
      'logout_confirm': 'هل تريد تسجيل الخروج من حسابك؟',
      'cancel': 'إلغاء',
      'guest_user': 'مستخدم بريق',

      // السيارات
      'cars_empty_title': 'لا توجد سيارات بعد',
      'cars_empty_desc': 'أضف سيارتك لتتمكن من حجز الغسيل بسرعة',
      'add_car': 'إضافة سيارة',
      'car_default': 'الافتراضية',
      'set_default': 'تعيين كافتراضية',
      'delete': 'حذف',
      'delete_car_title': 'حذف السيارة',
      'delete_car_confirm': 'هل تريد حذف @car؟',
      'car_type_sedan': 'سيدان',
      'car_type_suv': 'دفع رباعي',
      'car_type_hatchback': 'هاتشباك',
      'car_type_coupe': 'كوبيه',
      'car_type_pickup': 'بيك أب',
      'emirate_abuDhabi': 'أبوظبي',
      'emirate_dubai': 'دبي',
      'emirate_sharjah': 'الشارقة',
      'emirate_ajman': 'عجمان',
      'emirate_ummAlQuwain': 'أم القيوين',
      'emirate_rasAlKhaimah': 'رأس الخيمة',
      'emirate_fujairah': 'الفجيرة',

      // إضافة سيارة
      'car_brand': 'الماركة',
      'car_brand_hint': 'مثال: Toyota',
      'car_model': 'الموديل',
      'car_model_hint': 'مثال: Camry',
      'car_type': 'نوع السيارة',
      'car_type_hint': 'يؤثر نوع السيارة على سعر الغسيل',
      'car_color': 'اللون',
      'plate_title': 'لوحة السيارة',
      'plate_code': 'الرمز',
      'plate_number': 'الرقم',
      'save_car': 'حفظ السيارة',
      'car_added': 'تمت إضافة السيارة',

      // العناوين
      'addresses_empty_title': 'لا توجد عناوين محفوظة',
      'addresses_empty_desc': 'أضف عنوانك ليصلك الفني بسرعة',
      'add_address': 'إضافة عنوان',
      'address_default': 'الافتراضي',
      'address_type_home': 'المنزل',
      'address_type_work': 'العمل',
      'address_type_other': 'آخر',
      'delete_address_title': 'حذف العنوان',
      'delete_address_confirm': 'هل تريد حذف عنوان «@name»؟',

      // إضافة عنوان
      'pick_on_map': 'تحديد الموقع على الخريطة',
      'pick_on_map_hint': 'سيتوفر قريباً',
      'manual_entry': 'أو أدخل العنوان يدوياً',
      'address_type_label': 'نوع العنوان',
      'address_emirate': 'الإمارة',
      'address_area': 'المنطقة',
      'address_area_hint': 'مثال: Dubai Marina',
      'address_building': 'المبنى أو الفيلا',
      'address_building_hint': 'مثال: Marina Tower',
      'address_details': 'الشقة / الطابق / رقم الموقف (اختياري)',
      'address_details_hint': 'مثال: شقة 502 • موقف B2',
      'save_address': 'حفظ العنوان',
      'address_added': 'تمت إضافة العنوان',

      // تفاصيل الخدمة
      'service_details_includes': 'ما تشمله الخدمة',
      'service_choose_car_type': 'اختر نوع سيارتك',
      'service_car_price': 'سعر الخدمة لسيارتك',
      'service_addons': 'إضافات اختيارية',
      'total': 'الإجمالي',
      'continue_booking': 'متابعة الحجز',
      'price_aed': '@price د.إ',
      'addon_price': '+@price د.إ',
      'duration_min': '@min دقيقة',

      'service_exterior_desc':
          'غسيل يدوي كامل لهيكل السيارة من الخارج مع تنظيف الجنوط والزجاج.',
      'service_interior_desc':
          'تنظيف شامل لمقصورة السيارة من الغبار والأوساخ بالمكنسة والمنظفات الآمنة.',
      'service_full_desc':
          'الباقة الأشمل: غسيل خارجي وتنظيف داخلي كامل في زيارة واحدة.',
      'service_waterless_desc':
          'غسيل بدون ماء بمنتج متخصص يرفع الأتربة ويحمي الطلاء. مثالي لمواقف السيارات ويوفّر المياه.',
      'service_polish_desc':
          'تلميع الطلاء وإزالة الخدوش الخفيفة مع طبقة حماية تمنح السيارة لمعاناً يدوم.',
      'service_ceramic_desc':
          'طلاء سيراميك يحمي الطلاء من الحرارة والعوامل الجوية لفترة طويلة ويمنحه لمعاناً عميقاً.',

      'inc_hand_wash': 'غسيل يدوي بالرغوة',
      'inc_rims_tires': 'تنظيف الجنوط والإطارات',
      'inc_windows': 'تنظيف الزجاج',
      'inc_dry_finish': 'تجفيف بمناشف مايكروفايبر',
      'inc_vacuum': 'تنظيف المقاعد والأرضيات بالمكنسة',
      'inc_dashboard': 'تنظيف لوحة القيادة والأسطح',
      'inc_door_jambs': 'تنظيف حواف الأبواب',
      'inc_waterless_product': 'منتج غسيل جاف بدون ماء',
      'inc_polish': 'تلميع الطلاء',
      'inc_wax': 'طبقة حماية شمعية',
      'inc_paint_prep': 'تحضير الطلاء وتنظيفه بعمق',
      'inc_ceramic': 'طلاء سيراميك',
      'inc_gloss': 'لمعان وحماية طويلة الأمد',

      'addon_tire_shine': 'لمعان الإطارات',
      'addon_freshener': 'معطّر للسيارة',
      'addon_pet_hair': 'إزالة شعر الحيوانات',
      'addon_leather_care': 'ترطيب وعناية بالجلد',
      'addon_engine_bay': 'تنظيف حجرة المحرك',

      // الحجز
      'booking_title': 'تفاصيل الحجز',
      'booking_choose_car': 'اختر السيارة',
      'booking_choose_address': 'اختر العنوان',
      'booking_when': 'متى تريد الخدمة؟',
      'booking_choose_day': 'اختر اليوم',
      'booking_choose_time': 'اختر الفترة',
      'when_now': 'الآن',
      'when_now_hint': 'في أقرب وقت',
      'when_schedule': 'جدولة',
      'when_schedule_hint': 'اختر اليوم والوقت',
      'now_unavailable': 'الحجز الفوري متاح من 8 صباحاً حتى 10 مساءً',
      'add_new': 'إضافة',
      'no_addons': 'بدون إضافات',
      'review_order': 'مراجعة الطلب',
      'today': 'اليوم',
      'tomorrow': 'غداً',
      'weekday_1': 'الإثنين',
      'weekday_2': 'الثلاثاء',
      'weekday_3': 'الأربعاء',
      'weekday_4': 'الخميس',
      'weekday_5': 'الجمعة',
      'weekday_6': 'السبت',
      'weekday_7': 'الأحد',

      // مراجعة الطلب والدفع
      'checkout_title': 'مراجعة الطلب',
      'summary_service': 'الخدمة',
      'summary_car': 'السيارة',
      'summary_address': 'العنوان',
      'summary_time': 'الموعد',
      'promo_title': 'كود الخصم',
      'promo_hint': 'أدخل الكود',
      'promo_apply': 'تطبيق',
      'promo_invalid': 'الكود غير صالح',
      'promo_applied': 'تم تطبيق الكود',
      'promo_remove': 'إزالة',
      'promo_discount': 'خصم الكود',
      'payment_title': 'طريقة الدفع',
      'pay_card': 'بطاقة ائتمان أو خصم',
      'pay_card_hint': 'Visa / Mastercard',
      'pay_applePay': 'Apple Pay',
      'pay_googlePay': 'Google Pay',
      'pay_cash': 'نقداً عند الخدمة',
      'pay_cash_hint': 'ادفع للفني بعد انتهاء الغسيل',
      'price_details': 'تفاصيل السعر',
      'discount_value': '-@price د.إ',
      'confirm_booking': 'تأكيد الحجز',
      'booking_confirmed': 'تم تأكيد حجزك بنجاح',

      // حالات الطلب
      'order_status_pending': 'بانتظار التأكيد',
      'order_status_confirmed': 'مؤكد',
      'order_status_onTheWay': 'الفني في الطريق',
      'order_status_inProgress': 'جارٍ الغسيل',
      'order_status_completed': 'مكتمل',
      'order_status_cancelled': 'ملغي',

      // طلباتي
      'orders_active': 'الحالية',
      'orders_past': 'السابقة',
      'orders_empty_active_title': 'لا توجد طلبات حالية',
      'orders_empty_active_desc': 'احجز غسلة وسيصل الفني إلى موقعك',
      'orders_empty_past_title': 'لا توجد طلبات سابقة',
      'orders_empty_past_desc': 'ستظهر هنا طلباتك المكتملة والملغية',
      'book_now_short': 'احجز الآن',

      // تفاصيل الطلب
      'order_details_title': 'تفاصيل الطلب',
      'order_progress': 'حالة الطلب',
      'order_info': 'معلومات الطلب',
      'order_placed_at': 'تم الطلب في @date',
      'summary_payment': 'طريقة الدفع',
      'order_cancelled_banner': 'تم إلغاء هذا الطلب',
      'cancel_order': 'إلغاء الطلب',
      'cancel_order_title': 'إلغاء الطلب',
      'cancel_order_confirm':
          'هل تريد إلغاء هذا الطلب؟ لا يمكن التراجع عن ذلك.',
      'keep_order': 'تراجع',
      'cancel_not_allowed':
          'لا يمكن إلغاء الطلب بعد انطلاق الفني. للمساعدة تواصل مع الدعم.',
      'order_cancelled': 'تم إلغاء الطلب',

      // العروض
      'offers_plans_title': 'اشتراكات شهرية',
      'offers_plans_subtitle': 'وفّر أكثر مع غسيل منتظم لسيارتك',
      'offers_codes_title': 'أكواد الخصم',
      'offers_codes_subtitle': 'انسخ الكود واستخدمه عند مراجعة الطلب',
      'plan_basic': 'الأساسية',
      'plan_basic_desc': 'غسيل خارجي أسبوعي يبقي سيارتك نظيفة طوال الشهر.',
      'plan_eco': 'الصديقة للبيئة',
      'plan_eco_desc': 'غسيل بدون ماء كل أسبوع: نظافة دائمة وتوفير للمياه.',
      'plan_premium': 'المميزة',
      'plan_premium_desc':
          'باقة كاملة (خارجي وداخلي) كل أسبوع لسيارة تبدو جديدة دائماً.',
      'plan_washes': '@count غسلات شهرياً',
      'plan_save': 'وفّر @percent%',
      'plan_from': 'ابتداءً من',
      'plan_per_month': '/ شهر',
      'plan_subscribe': 'اشترك',
      'plan_popular': 'الأكثر طلباً',
      'promo_percent_off': 'خصم @value%',
      'promo_fixed_off': 'خصم @value د.إ',
      'promo_offer_desc': 'يُطبَّق عند مراجعة الطلب',
      'code_copied': 'تم نسخ الكود',

      // تفاصيل الباقة
      'plan_details_title': 'تفاصيل الباقة',
      'plan_includes': 'ما تشمله كل غسلة',
      'plan_weekday': 'يومك المفضل أسبوعياً',
      'plan_time': 'الفترة المفضلة',
      'plan_renewal': 'طريقة التجديد',
      'renewal_auto': 'تجديد تلقائي',
      'renewal_auto_hint': 'يُخصم كل شهر من وسيلة الدفع، وتوقفه متى شئت',
      'renewal_manual': 'تجديد يدوي',
      'renewal_manual_hint': 'نذكّرك قبل انتهاء الشهر لتجدّد بنفسك',
      'plan_summary': 'ملخص الاشتراك',
      'plan_regular_price': 'السعر بدون خصم',
      'plan_discount_line': 'خصم الاشتراك (@percent%)',
      'plan_monthly_total': 'الإجمالي الشهري',
      'renewal_auto_note':
          'سيُخصم @price من وسيلة الدفع المختارة تلقائياً في @date',
      'renewal_manual_note': 'سنذكّرك قبل @date لتجديد اشتراكك',
      'subscribe_now': 'اشترك الآن',
      'subscription_created': 'تم الاشتراك بنجاح',

      // اشتراكاتي
      'subs_empty_title': 'لا توجد اشتراكات',
      'subs_empty_desc': 'اشترك في باقة شهرية ووفّر على كل غسلة',
      'subs_browse': 'استعرض الباقات',
      'subs_washes_left': 'المتبقي @left من @total غسلات',
      'subs_schedule': 'كل @day • @time',
      'subs_renews_auto': 'يتجدد تلقائياً في @date',
      'subs_renews_manual': 'ينتهي في @date، ونذكّرك لتجدّد',
      'subs_cancelled_note': 'تم إلغاء هذا الاشتراك',
      'subs_status_active': 'فعّال',
      'subs_status_cancelled': 'ملغي',
      'subs_switch_to_manual': 'التحويل إلى تجديد يدوي',
      'subs_switch_to_auto': 'التحويل إلى تجديد تلقائي',
      'subs_auto_needs_card': 'التجديد التلقائي يتطلب الدفع ببطاقة أو محفظة',
      'subs_renewal_updated': 'تم تحديث طريقة التجديد',
      'subs_cancel': 'إلغاء الاشتراك',
      'subs_cancel_title': 'إلغاء الاشتراك',
      'subs_cancel_confirm': 'هل تريد إلغاء اشتراك «@plan»؟ لن يتجدد بعد الآن.',
      'keep_subscription': 'تراجع',
      'subs_cancelled': 'تم إلغاء الاشتراك',

      // الإحالات
      'ref_your_code': 'كودك الخاص',
      'ref_copy': 'نسخ',
      'ref_share': 'مشاركة',
      'ref_code_copied': 'تم نسخ الكود',
      'ref_share_text':
          'جرّب بريق، نغسل سيارتك عند باب بيتك! استخدم كودي @code واحصل على خصم @amount د.إ على أول غسلة.',
      'ref_stat_invited': 'أصدقاء',
      'ref_stat_rewarded': 'مكافآت مكتملة',
      'ref_stat_earned': 'رصيدك',
      'ref_how_title': 'كيف تعمل؟',
      'ref_step1': 'شارك كودك مع أصدقائك',
      'ref_step2': 'يحصل صديقك على خصم @amount د.إ على أول غسلة',
      'ref_step3': 'تحصل على @amount د.إ رصيداً بعد إتمام صديقك أول غسلة',
      'ref_redeem_title': 'لديك كود من صديق؟',
      'ref_redeem': 'تفعيل',
      'ref_code_invalid': 'الكود غير صحيح',
      'ref_own_code': 'لا يمكنك استخدام كودك الخاص',
      'ref_redeemed': 'تم تفعيل الكود',
      'ref_redeemed_note':
          'تم تفعيل الكود @code، وسيُطبَّق خصم @amount د.إ على أول غسلة',
      'ref_friends_title': 'أصدقاؤك',
      'ref_friends_empty':
          'لم يسجّل أحد بكودك بعد. شارك الكود وابدأ بكسب الرصيد!',
      'ref_status_pending': 'بانتظار أول غسلة',
      'ref_status_rewarded': 'تمت المكافأة',
      'ref_reward_plus': '+@amount د.إ',

      // التقييم والصور
      'order_photos': 'صور قبل وبعد',
      'order_photos_hint': 'اسحب الخط لمقارنة سيارتك قبل الغسيل وبعده',
      'photo_before': 'قبل',
      'photo_after': 'بعد',
      'rate_section': 'تقييم الخدمة',
      'rate_title': 'كيف كانت تجربتك؟',
      'rate_label_1': 'سيئة',
      'rate_label_2': 'مقبولة',
      'rate_label_3': 'جيدة',
      'rate_label_4': 'ممتازة',
      'rate_label_5': 'رائعة!',
      'rate_comment_hint': 'أخبرنا برأيك (اختياري)',
      'rate_submit': 'إرسال التقييم',
      'rate_thanks': 'شكراً لتقييمك!',
      'rate_sent': 'تم إرسال تقييمك',

      // تتبع الطلب
      'track_title': 'تتبع الطلب',
      'track_button': 'تتبع الفني',
      'track_on_the_way': 'الفني في الطريق إليك',
      'track_eta': 'يصل خلال @min دقيقة',
      'track_arrived': 'وصل الفني!',
      'track_arrived_desc': 'الفني بانتظارك عند موقعك',
      'track_washing_title': 'جاري غسل سيارتك',
      'track_washing_desc':
          'الفني يعمل على سيارتك الآن، وسنعرض لك صور قبل وبعد عند الانتهاء',
      'track_not_started_title': 'لم ينطلق الفني بعد',
      'track_not_started_desc': 'سيظهر موقع الفني هنا فور انطلاقه إليك',
      'track_unavailable_title': 'التتبع غير متاح',
      'track_unavailable_desc':
          'يتوفر التتبع عندما يكون الفني في الطريق أو أثناء الغسيل',
      'track_technician': 'فنيّك',
      'track_washes': '@count غسلة',
      'track_call': 'اتصال',
      'track_chat': 'محادثة',
      'track_action_soon': 'ستتوفر هذه الميزة قريباً',

      // المساعدة
      'help_title': 'كيف نساعدك؟',
      'help_hours': 'نرد عليك يومياً من @from إلى @to',
      'help_whatsapp': 'واتساب',
      'help_call': 'اتصال',
      'help_email': 'بريد',
      'help_faq': 'الأسئلة الشائعة',
      'help_open_failed': 'تعذّر فتح التطبيق المطلوب',
      'help_whatsapp_text': 'مرحباً، أحتاج مساعدة بخصوص طلبي في بريق',
      'help_email_subject': 'طلب مساعدة - بريق',

      'faq_1_q': 'كيف أحجز غسلة؟',
      'faq_1_a':
          'اختر الخدمة من الرئيسية، ثم حدّد السيارة والعنوان والموعد، وراجع الطلب وأكّده. سيصل الفني إلى موقعك في الوقت المحدد.',
      'faq_2_q': 'ما هو الغسيل بدون ماء؟',
      'faq_2_a':
          'تقنية تنظّف السيارة بمنتجات خاصة دون استخدام الماء، فتحافظ على الطلاء من حرارة الإمارات وتوفّر المياه.',
      'faq_3_q': 'كيف ألغي طلباً؟',
      'faq_3_a':
          'من «طلباتي» افتح الطلب واضغط «إلغاء الطلب». يمكن الإلغاء قبل انطلاق الفني فقط، وبعدها تواصل مع الدعم.',
      'faq_4_q': 'ما طرق الدفع المتاحة؟',
      'faq_4_a':
          'البطاقة، و Apple Pay أو Google Pay بحسب جهازك، والدفع نقداً عند الغسيل.',
      'faq_5_q': 'كيف أتتبع الفني؟',
      'faq_5_a':
          'عندما يكون الفني في الطريق يظهر زر «تتبع الفني» في تفاصيل الطلب، لترى موقعه والوقت المتوقع لوصوله.',
      'faq_6_q': 'كيف أدير اشتراكي؟',
      'faq_6_a':
          'من «حسابي ← اشتراكاتي» يمكنك تبديل التجديد بين تلقائي ويدوي، أو إلغاء الاشتراك.',
      'faq_7_q': 'أين أجد صور قبل وبعد الغسيل؟',
      'faq_7_a':
          'بعد اكتمال الغسيل تظهر الصور في تفاصيل الطلب، وتستطيع هناك تقييم الخدمة.',
      'faq_8_q': 'كيف تعمل الإحالات؟',
      'faq_8_a':
          'شارك كودك من «ادعُ أصدقاءك»، فيحصل صديقك على خصم على أول غسلة، وتحصل أنت على رصيد بعد إتمامه أول غسلة.',

      // الشروط والخصوصية
      'legal_terms': 'الشروط',
      'legal_privacy': 'الخصوصية',
      'legal_updated': 'آخر تحديث: نوفمبر 2026',

      'terms_1_t': 'استخدام الخدمة',
      'terms_1_b':
          'بريق خدمة غسيل سيارات متنقلة داخل الإمارات. باستخدامك التطبيق فإنك توافق على هذه الشروط.',
      'terms_2_t': 'الحجز والإلغاء',
      'terms_2_b':
          'تُحجز الخدمة بتحديد السيارة والعنوان والموعد. يمكن إلغاء الطلب قبل انطلاق الفني، وبعد انطلاقه يلزم التواصل مع الدعم.',
      'terms_3_t': 'الأسعار والدفع',
      'terms_3_b':
          'تُعرض الأسعار بالدرهم الإماراتي وتختلف بحسب نوع السيارة والإضافات. يتم الدفع بالوسيلة التي تختارها عند تأكيد الطلب.',
      'terms_4_t': 'الاشتراكات',
      'terms_4_b':
          'يتجدد الاشتراك الشهري تلقائياً أو يدوياً بحسب اختيارك، ويمكنك إلغاؤه من التطبيق.',
      'terms_5_t': 'مسؤوليات العميل',
      'terms_5_b':
          'يلتزم العميل بإتاحة الوصول إلى السيارة في الموعد المحدد وإبلاغ الفني بأي ملاحظات أو أضرار سابقة. نلتقط صوراً قبل الغسيل وبعده لتوثيق حالة السيارة.',
      'terms_6_t': 'التواصل',
      'terms_6_b': 'لأي استفسار تواصل معنا عبر «المساعدة والدعم» في التطبيق.',

      'privacy_1_t': 'البيانات التي نجمعها',
      'privacy_1_b':
          'الاسم ورقم الهاتف والبريد الإلكتروني (اختياري)، وبيانات سياراتك وعناوينك، وسجل الطلبات والاشتراكات، وصور قبل وبعد الغسيل.',
      'privacy_2_t': 'كيف نستخدمها',
      'privacy_2_b':
          'لتنفيذ طلباتك، وتتبع الفني، وإرسال الإشعارات، وتحسين خدماتنا.',
      'privacy_3_t': 'المشاركة',
      'privacy_3_b':
          'يطّلع الفني المكلّف على اسمك ورقم هاتفك وعنوانك ونوع سيارتك أثناء تنفيذ الطلب فقط. نشارك بيانات الدفع مع مزوّد الدفع لإتمام العملية، ولا نبيع بياناتك.',
      'privacy_4_t': 'الموقع',
      'privacy_4_b': 'نستخدم موقعك لتحديد عنوان الغسيل وتتبع وصول الفني.',
      'privacy_5_t': 'حقوقك',
      'privacy_5_b': 'يمكنك تعديل بياناتك أو طلب حذف حسابك بالتواصل معنا.',
      'privacy_6_t': 'الأمان والاحتفاظ',
      'privacy_6_b':
          'نحمي بياناتك بإجراءات تقنية مناسبة، ونحتفظ بها للمدة اللازمة لتقديم الخدمة والالتزام بالأنظمة.',
    },
    'en': {
      // General
      'app_name': 'Bariq',
      'tagline': 'Your car shines.. we come to you',
      'language': 'Language',
      'switch_language': 'العربية',
      'loading': 'Loading...',
      'skip': 'Skip',
      'next': 'Next',
      'get_started': 'Get started',
      'continue_btn': 'Continue',
      'verify': 'Verify',

      // Onboarding
      'onb1_title': 'We come to you',
      'onb1_desc':
          'Book from your phone and a professional arrives at your home, office or parking spot.',
      'onb2_title': 'Waterless wash',
      'onb2_desc':
          'Dry-wash technology protects your paint from the UAE heat and saves water.',
      'onb3_title': 'Trusted service, clear prices',
      'onb3_desc':
          'Fixed prices, live technician tracking, and before & after photos.',

      // Login
      'login_title': 'Welcome to Bariq',
      'login_subtitle':
          'Enter your phone number to sign in or create a new account',
      'phone_label': 'Phone number',
      'phone_invalid': 'Enter a 9-digit UAE number starting with 5',
      'send_code': 'Send verification code',
      'terms_notice':
          'By continuing you agree to our Terms of Use and Privacy Policy',

      // OTP
      'otp_title': 'Verification code',
      'otp_subtitle': 'We sent a 6-digit code to @phone',
      'resend_in': 'Resend in @time',
      'resend_code': 'Resend code',
      'code_resent': 'A new code has been sent',

      // Profile setup
      'profile_setup_title': 'Tell us about yourself',
      'profile_setup_subtitle':
          'We use your name to greet you and so the technician can reach you on arrival',
      'full_name': 'Full name',
      'full_name_hint': 'e.g. Ahmed Mohammed',
      'email_optional': 'Email (optional)',
      'email_invalid': 'Invalid email address',

      // Home
      'hello': 'Hello 👋',
      'home_subtitle': 'When should we wash your car?',
      'book_now': 'Book a wash now',
      'schedule': 'Schedule',
      'our_services': 'Our services',
      'see_all': 'See all',

      // Services
      'service_exterior': 'Exterior wash',
      'service_interior': 'Interior cleaning',
      'service_full': 'Full package',
      'service_waterless': 'Waterless wash',
      'service_polish': 'Polish & protect',
      'service_ceramic': 'Ceramic',
      'from_price': 'From AED @price',
      'eco_badge': 'Eco-friendly',

      // Navigation
      'tab_home': 'Home',
      'tab_orders': 'Orders',
      'tab_offers': 'Offers',
      'tab_profile': 'Profile',

      'coming_soon': 'Coming soon',

      // Profile
      'section_account': 'Account',
      'section_general': 'General',
      'profile_my_cars': 'My cars',
      'profile_addresses': 'Saved addresses',
      'profile_subscriptions': 'My subscriptions',
      'profile_invite': 'Invite friends',
      'profile_help': 'Help & support',
      'profile_terms': 'Terms & privacy',
      'logout': 'Log out',
      'logout_confirm': 'Do you want to log out of your account?',
      'cancel': 'Cancel',
      'guest_user': 'Bariq user',

      // Cars
      'cars_empty_title': 'No cars yet',
      'cars_empty_desc': 'Add your car so you can book a wash quickly',
      'add_car': 'Add a car',
      'car_default': 'Default',
      'set_default': 'Set as default',
      'delete': 'Delete',
      'delete_car_title': 'Delete car',
      'delete_car_confirm': 'Do you want to delete @car?',
      'car_type_sedan': 'Sedan',
      'car_type_suv': 'SUV',
      'car_type_hatchback': 'Hatchback',
      'car_type_coupe': 'Coupe',
      'car_type_pickup': 'Pickup',
      'emirate_abuDhabi': 'Abu Dhabi',
      'emirate_dubai': 'Dubai',
      'emirate_sharjah': 'Sharjah',
      'emirate_ajman': 'Ajman',
      'emirate_ummAlQuwain': 'Umm Al Quwain',
      'emirate_rasAlKhaimah': 'Ras Al Khaimah',
      'emirate_fujairah': 'Fujairah',

      // Add car
      'car_brand': 'Brand',
      'car_brand_hint': 'e.g. Toyota',
      'car_model': 'Model',
      'car_model_hint': 'e.g. Camry',
      'car_type': 'Car type',
      'car_type_hint': 'Car type affects the wash price',
      'car_color': 'Color',
      'plate_title': 'License plate',
      'plate_code': 'Code',
      'plate_number': 'Number',
      'save_car': 'Save car',
      'car_added': 'Car added',

      // Addresses
      'addresses_empty_title': 'No saved addresses',
      'addresses_empty_desc':
          'Add your address so the technician can reach you quickly',
      'add_address': 'Add an address',
      'address_default': 'Default',
      'address_type_home': 'Home',
      'address_type_work': 'Work',
      'address_type_other': 'Other',
      'delete_address_title': 'Delete address',
      'delete_address_confirm': 'Do you want to delete the "@name" address?',

      // Add address
      'pick_on_map': 'Pick location on map',
      'pick_on_map_hint': 'Coming soon',
      'manual_entry': 'Or enter the address manually',
      'address_type_label': 'Address type',
      'address_emirate': 'Emirate',
      'address_area': 'Area',
      'address_area_hint': 'e.g. Dubai Marina',
      'address_building': 'Building or villa',
      'address_building_hint': 'e.g. Marina Tower',
      'address_details': 'Apartment / floor / parking spot (optional)',
      'address_details_hint': 'e.g. Apt 502 • Parking B2',
      'save_address': 'Save address',
      'address_added': 'Address added',

      // Service details
      'service_details_includes': "What's included",
      'service_choose_car_type': 'Choose your car type',
      'service_car_price': 'Service price for your car',
      'service_addons': 'Optional extras',
      'total': 'Total',
      'continue_booking': 'Continue booking',
      'price_aed': 'AED @price',
      'addon_price': '+AED @price',
      'duration_min': '@min min',

      'service_exterior_desc':
          'A full hand wash of the car body, with rims and windows cleaned.',
      'service_interior_desc':
          'A thorough cabin clean: dust and dirt removed with a vacuum and safe cleaners.',
      'service_full_desc':
          'Our most complete package: exterior wash and full interior clean in one visit.',
      'service_waterless_desc':
          'A waterless wash with a specialist product that lifts dust and protects the paint. Ideal for parking lots and saves water.',
      'service_polish_desc':
          'Paint polish that removes light scratches, finished with a protective layer for a lasting shine.',
      'service_ceramic_desc':
          'A ceramic coating that protects the paint from heat and weather for a long time and adds deep gloss.',

      'inc_hand_wash': 'Foam hand wash',
      'inc_rims_tires': 'Rims & tires cleaning',
      'inc_windows': 'Window cleaning',
      'inc_dry_finish': 'Microfiber towel dry',
      'inc_vacuum': 'Seats & floors vacuum',
      'inc_dashboard': 'Dashboard & surfaces wipe-down',
      'inc_door_jambs': 'Door jambs cleaning',
      'inc_waterless_product': 'Waterless wash product',
      'inc_polish': 'Paint polish',
      'inc_wax': 'Wax protection layer',
      'inc_paint_prep': 'Deep paint prep & decontamination',
      'inc_ceramic': 'Ceramic coating',
      'inc_gloss': 'Long-lasting gloss & protection',

      'addon_tire_shine': 'Tire shine',
      'addon_freshener': 'Air freshener',
      'addon_pet_hair': 'Pet hair removal',
      'addon_leather_care': 'Leather care',
      'addon_engine_bay': 'Engine bay cleaning',

      // Booking
      'booking_title': 'Booking details',
      'booking_choose_car': 'Choose a car',
      'booking_choose_address': 'Choose an address',
      'booking_when': 'When do you need it?',
      'booking_choose_day': 'Pick a day',
      'booking_choose_time': 'Pick a time window',
      'when_now': 'Now',
      'when_now_hint': 'As soon as possible',
      'when_schedule': 'Schedule',
      'when_schedule_hint': 'Pick a day and time',
      'now_unavailable': 'Instant booking is available from 8 AM to 10 PM',
      'add_new': 'Add',
      'no_addons': 'No extras',
      'review_order': 'Review order',
      'today': 'Today',
      'tomorrow': 'Tomorrow',
      'weekday_1': 'Mon',
      'weekday_2': 'Tue',
      'weekday_3': 'Wed',
      'weekday_4': 'Thu',
      'weekday_5': 'Fri',
      'weekday_6': 'Sat',
      'weekday_7': 'Sun',

      // Checkout
      'checkout_title': 'Review order',
      'summary_service': 'Service',
      'summary_car': 'Car',
      'summary_address': 'Address',
      'summary_time': 'Time',
      'promo_title': 'Promo code',
      'promo_hint': 'Enter code',
      'promo_apply': 'Apply',
      'promo_invalid': 'Invalid code',
      'promo_applied': 'Code applied',
      'promo_remove': 'Remove',
      'promo_discount': 'Promo discount',
      'payment_title': 'Payment method',
      'pay_card': 'Credit or debit card',
      'pay_card_hint': 'Visa / Mastercard',
      'pay_applePay': 'Apple Pay',
      'pay_googlePay': 'Google Pay',
      'pay_cash': 'Cash on service',
      'pay_cash_hint': 'Pay the technician after the wash',
      'price_details': 'Price details',
      'discount_value': '-AED @price',
      'confirm_booking': 'Confirm booking',
      'booking_confirmed': 'Your booking is confirmed',

      // Order status
      'order_status_pending': 'Awaiting confirmation',
      'order_status_confirmed': 'Confirmed',
      'order_status_onTheWay': 'Technician on the way',
      'order_status_inProgress': 'Washing in progress',
      'order_status_completed': 'Completed',
      'order_status_cancelled': 'Cancelled',

      // Orders
      'orders_active': 'Current',
      'orders_past': 'Past',
      'orders_empty_active_title': 'No current orders',
      'orders_empty_active_desc':
          'Book a wash and the technician will come to you',
      'orders_empty_past_title': 'No past orders',
      'orders_empty_past_desc':
          'Your completed and cancelled orders will appear here',
      'book_now_short': 'Book now',

      // Order details
      'order_details_title': 'Order details',
      'order_progress': 'Order progress',
      'order_info': 'Order information',
      'order_placed_at': 'Placed on @date',
      'summary_payment': 'Payment',
      'order_cancelled_banner': 'This order was cancelled',
      'cancel_order': 'Cancel order',
      'cancel_order_title': 'Cancel order',
      'cancel_order_confirm':
          'Do you want to cancel this order? This cannot be undone.',
      'keep_order': 'Keep order',
      'cancel_not_allowed':
          "The order can't be cancelled once the technician is on the way. Contact support for help.",
      'order_cancelled': 'Order cancelled',

      // Offers
      'offers_plans_title': 'Monthly subscriptions',
      'offers_plans_subtitle': 'Save more with regular washes for your car',
      'offers_codes_title': 'Promo codes',
      'offers_codes_subtitle':
          'Copy a code and use it when reviewing your order',
      'plan_basic': 'Basic',
      'plan_basic_desc':
          'A weekly exterior wash to keep your car clean all month.',
      'plan_eco': 'Eco',
      'plan_eco_desc':
          'A waterless wash every week: always clean, and saves water.',
      'plan_premium': 'Premium',
      'plan_premium_desc':
          'A full package (exterior & interior) every week for a car that always looks new.',
      'plan_washes': '@count washes / month',
      'plan_save': 'Save @percent%',
      'plan_from': 'From',
      'plan_per_month': '/ month',
      'plan_subscribe': 'Subscribe',
      'plan_popular': 'Most popular',
      'promo_percent_off': '@value% off',
      'promo_fixed_off': 'AED @value off',
      'promo_offer_desc': 'Applied at checkout',
      'code_copied': 'Code copied',

      // Plan details
      'plan_details_title': 'Plan details',
      'plan_includes': 'Included in every wash',
      'plan_weekday': 'Your preferred weekday',
      'plan_time': 'Preferred time window',
      'plan_renewal': 'Renewal method',
      'renewal_auto': 'Auto-renew',
      'renewal_auto_hint':
          'Charged monthly to your payment method; stop anytime',
      'renewal_manual': 'Manual renewal',
      'renewal_manual_hint':
          'We remind you before the month ends so you renew yourself',
      'plan_summary': 'Subscription summary',
      'plan_regular_price': 'Price without discount',
      'plan_discount_line': 'Subscription discount (@percent%)',
      'plan_monthly_total': 'Monthly total',
      'renewal_auto_note':
          '@price will be charged automatically to your selected payment method on @date',
      'renewal_manual_note':
          'We will remind you before @date to renew your subscription',
      'subscribe_now': 'Subscribe now',
      'subscription_created': 'Subscribed successfully',

      // My subscriptions
      'subs_empty_title': 'No subscriptions',
      'subs_empty_desc': 'Subscribe to a monthly plan and save on every wash',
      'subs_browse': 'Browse plans',
      'subs_washes_left': '@left of @total washes left',
      'subs_schedule': 'Every @day • @time',
      'subs_renews_auto': 'Renews automatically on @date',
      'subs_renews_manual': 'Ends on @date; we will remind you to renew',
      'subs_cancelled_note': 'This subscription was cancelled',
      'subs_status_active': 'Active',
      'subs_status_cancelled': 'Cancelled',
      'subs_switch_to_manual': 'Switch to manual renewal',
      'subs_switch_to_auto': 'Switch to auto-renew',
      'subs_auto_needs_card': 'Auto-renew requires paying by card or wallet',
      'subs_renewal_updated': 'Renewal method updated',
      'subs_cancel': 'Cancel subscription',
      'subs_cancel_title': 'Cancel subscription',
      'subs_cancel_confirm':
          'Do you want to cancel your "@plan" subscription? It will no longer renew.',
      'keep_subscription': 'Keep subscription',
      'subs_cancelled': 'Subscription cancelled',

      // Referrals
      'ref_your_code': 'Your code',
      'ref_copy': 'Copy',
      'ref_share': 'Share',
      'ref_code_copied': 'Code copied',
      'ref_share_text':
          'Try Bariq, we wash your car at your door! Use my code @code to get AED @amount off your first wash.',
      'ref_stat_invited': 'Friends',
      'ref_stat_rewarded': 'Rewards earned',
      'ref_stat_earned': 'Your credit',
      'ref_how_title': 'How it works',
      'ref_step1': 'Share your code with friends',
      'ref_step2': 'Your friend gets AED @amount off their first wash',
      'ref_step3':
          'You get AED @amount credit once your friend completes their first wash',
      'ref_redeem_title': 'Got a code from a friend?',
      'ref_redeem': 'Apply',
      'ref_code_invalid': 'Invalid code',
      'ref_own_code': 'You cannot use your own code',
      'ref_redeemed': 'Code applied',
      'ref_redeemed_note':
          'Code @code applied. AED @amount off will be applied to your first wash',
      'ref_friends_title': 'Your friends',
      'ref_friends_empty':
          'No one has signed up with your code yet. Share it and start earning credit!',
      'ref_status_pending': 'Awaiting first wash',
      'ref_status_rewarded': 'Reward earned',
      'ref_reward_plus': '+AED @amount',

      // Rating & photos
      'order_photos': 'Before & after photos',
      'order_photos_hint':
          'Drag the line to compare your car before and after the wash',
      'photo_before': 'Before',
      'photo_after': 'After',
      'rate_section': 'Rate the service',
      'rate_title': 'How was your experience?',
      'rate_label_1': 'Poor',
      'rate_label_2': 'Fair',
      'rate_label_3': 'Good',
      'rate_label_4': 'Great',
      'rate_label_5': 'Excellent!',
      'rate_comment_hint': 'Tell us what you think (optional)',
      'rate_submit': 'Submit rating',
      'rate_thanks': 'Thanks for your rating!',
      'rate_sent': 'Your rating was sent',

      // Order tracking
      'track_title': 'Track order',
      'track_button': 'Track technician',
      'track_on_the_way': 'Your technician is on the way',
      'track_eta': 'Arrives in @min min',
      'track_arrived': 'Technician arrived!',
      'track_arrived_desc': 'Your technician is waiting at your location',
      'track_washing_title': 'Washing your car',
      'track_washing_desc':
          'Your technician is working on your car now. Before & after photos will appear when done',
      'track_not_started_title': 'Technician has not left yet',
      'track_not_started_desc':
          "You'll see the technician's location here as soon as they head to you",
      'track_unavailable_title': 'Tracking unavailable',
      'track_unavailable_desc':
          'Tracking is available while the technician is on the way or washing',
      'track_technician': 'Your technician',
      'track_washes': '@count washes',
      'track_call': 'Call',
      'track_chat': 'Chat',
      'track_action_soon': 'This feature is coming soon',

      // Help
      'help_title': 'How can we help?',
      'help_hours': 'We reply daily from @from to @to',
      'help_whatsapp': 'WhatsApp',
      'help_call': 'Call',
      'help_email': 'Email',
      'help_faq': 'Frequently asked questions',
      'help_open_failed': 'Could not open the requested app',
      'help_whatsapp_text': 'Hello, I need help with my Bariq order',
      'help_email_subject': 'Help request - Bariq',

      'faq_1_q': 'How do I book a wash?',
      'faq_1_a':
          'Pick a service on Home, choose your car, address and time, then review and confirm. The technician will arrive at your location on time.',
      'faq_2_q': 'What is a waterless wash?',
      'faq_2_a':
          'A technique that cleans your car with special products and no water, protecting the paint from the UAE heat while saving water.',
      'faq_3_q': 'How do I cancel an order?',
      'faq_3_a':
          'Open the order from Orders and tap "Cancel order". You can cancel only before the technician is on the way; after that, contact support.',
      'faq_4_q': 'Which payment methods are available?',
      'faq_4_a':
          'Card, Apple Pay or Google Pay depending on your device, and cash on delivery of the service.',
      'faq_5_q': 'How do I track my technician?',
      'faq_5_a':
          'When the technician is on the way, a "Track technician" button appears in the order details so you can see their location and estimated arrival.',
      'faq_6_q': 'How do I manage my subscription?',
      'faq_6_a':
          'From Profile > My subscriptions you can switch renewal between automatic and manual, or cancel the subscription.',
      'faq_7_q': 'Where do I find before & after photos?',
      'faq_7_a':
          'Once the wash is complete, the photos appear in the order details, where you can also rate the service.',
      'faq_8_q': 'How do referrals work?',
      'faq_8_a':
          'Share your code from "Invite friends". Your friend gets a discount on their first wash, and you get credit once they complete it.',

      // Terms & privacy
      'legal_terms': 'Terms',
      'legal_privacy': 'Privacy',
      'legal_updated': 'Last updated: November 2026',

      'terms_1_t': 'Using the service',
      'terms_1_b':
          'Bariq is a mobile car wash service in the UAE. By using the app you agree to these terms.',
      'terms_2_t': 'Booking and cancellation',
      'terms_2_b':
          'You book by choosing a car, address and time. An order can be cancelled before the technician is on the way; after that, please contact support.',
      'terms_3_t': 'Pricing and payment',
      'terms_3_b':
          'Prices are shown in UAE dirhams and vary by car type and add-ons. You pay with the method you choose when confirming the order.',
      'terms_4_t': 'Subscriptions',
      'terms_4_b':
          'A monthly subscription renews automatically or manually, as you choose, and you can cancel it from the app.',
      'terms_5_t': 'Customer responsibilities',
      'terms_5_b':
          'The customer must provide access to the car at the scheduled time and tell the technician about any notes or existing damage. We take before and after photos to document the car condition.',
      'terms_6_t': 'Contact',
      'terms_6_b':
          'For any question, contact us through "Help & support" in the app.',

      'privacy_1_t': 'Data we collect',
      'privacy_1_b':
          'Your name, phone number and email (optional), your cars and addresses, your orders and subscriptions history, and before and after photos.',
      'privacy_2_t': 'How we use it',
      'privacy_2_b':
          'To fulfil your orders, track the technician, send notifications and improve our services.',
      'privacy_3_t': 'Sharing',
      'privacy_3_b':
          'The assigned technician sees your name, phone number, address and car type only while fulfilling the order. We share payment details with the payment provider to complete the transaction, and we never sell your data.',
      'privacy_4_t': 'Location',
      'privacy_4_b':
          'We use your location to set the wash address and track the technician arrival.',
      'privacy_5_t': 'Your rights',
      'privacy_5_b':
          'You can update your data or request deletion of your account by contacting us.',
      'privacy_6_t': 'Security and retention',
      'privacy_6_b':
          'We protect your data with appropriate technical measures and keep it for as long as needed to provide the service and comply with regulations.',
    },
  };
}
