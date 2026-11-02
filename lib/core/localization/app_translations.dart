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
    },
  };
}
