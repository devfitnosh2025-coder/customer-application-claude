import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('ta'),
  ];

  static AppLocalizations? of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  static const Map<String, Map<String, String>> _strings = {
    'en': {
      'appTitle': 'Kitchen OS',
      'profileFitProPlanActive': 'Fit Pro Plan • Active',
      'edit': 'Edit',
      'logout': 'Logout',
      'appVersion': 'Kitchen OS v1.0.0 • Made with love in India',
      'sectionSubscription': 'SUBSCRIPTION',
      'sectionPayments': 'PAYMENTS',
      'sectionAccount': 'ACCOUNT',
      'sectionSupport': 'SUPPORT',
      'mySubscription': 'My Subscription',
      'myOrders': 'My Orders',
      'billingHistory': 'Billing History',
      'paymentMethods': 'Payment Methods',
      'walletCredits': 'Wallet & Credits',
      'addresses': 'Addresses',
      'dietaryPreferences': 'Dietary Preferences',
      'referralProgram': 'Referral Program',
      'notifications': 'Notifications',
      'helpCenter': 'Help Center',
      'aboutKitchen': 'About Kitchen',
      'rateApp': 'Rate App',
      'logoutTitle': 'Logout?',
      'logoutMessage': 'You will need to sign in again to use the app.',
      'cancel': 'Cancel',
      'confirm': 'Logout',
      'chooseYourPlan': 'Choose Your Plan',
      'currentPlanLabel': 'Current: Fit Pro Plan • 7 meals/week • ₹2,499/mo',
      'planLite': 'Lite',
      'planPro': 'Pro',
      'planElite': 'Elite',
      'mostPopular': 'MOST POPULAR',
      'downgrade': 'Downgrade',
      'current': 'Current',
      'upgrade': 'Upgrade',
      'compareAllFeatures': 'Compare all features →',
      'featureComparison': 'Feature comparison',
      'featureColumn': 'Feature',
      'mealsPerDay': 'Meals per day',
      'mealTypes': 'Meal types',
      'portionSize': 'Portion size',
      'addOns': 'Add-ons',
      'liteSubtitle': '3 meals/week • ₹83/meal',
      'liteDesc': '1 meal/day • Lunch only • Standard portions',
      'proSubtitle': '7 meals/week • ₹71/meal',
      'proDesc': '2 meals/day • B+L • Standard portions • Free add-ons',
      'eliteSubtitle': '14 meals/week • ₹57/meal',
      'eliteDesc': '3 meals/day • B+L+D • Large portions • Priority delivery • Free add-ons • Nutritionist access',
      'priceLite': '₹999',
      'pricePro': '₹2,499',
      'priceElite': '₹4,999',
      'perMonth': 'month',
      'subscription': 'Subscription',
      'onDemand': 'On-Demand',
      'today': 'Today',
      'yesterday': 'Yesterday',
      'delivered': 'Delivered',
      'preparing': 'Preparing',
      'rateMeal': 'Rate meal',
      'myAddresses': 'My Addresses',
      'defaultLabel': 'DEFAULT',
      'home': 'Home',
      'office': 'Office',
      'gym': 'Gym',
      'addNewAddress': '+ Add New Address',
      'upi': 'UPI',
      'cards': 'CARDS',
      'wallet': 'WALLET',
      'default_': 'Default',
      'setDefault': 'Set Default',
      'topUp': 'Top Up',
      'addPaymentMethod': '+ Add Payment Method',
      'kitchenOsWallet': 'Kitchen OS Wallet',
      'walletBalance': 'Balance: ₹450',
      'availableBalance': 'Available Balance',
      'creditsRewards': 'Credits & Rewards',
      'autoApplyWallet': 'Auto-apply wallet to orders',
      'autoApplyDesc': 'Wallet balance will be used before payment method',
      'thisMonth': 'This month',
      'nextChargeAutoRenew': 'Next charge: Apr 28 • Auto-renew ON',
      'subscriptionInvoices': 'Subscription Invoices',
      'onDemandOrders': 'On-Demand Orders',
      'paid': 'Paid',
      'pdf': 'PDF',
      'referEarn': 'Refer & Earn',
      'giveGetTitle': 'Give ₹200, Get ₹200',
      'giveGetDesc': 'Share your code with friends. When they subscribe, you both get ₹200 wallet credit.',
      'unlimitedNoExpiry': 'Unlimited referrals • No expiry',
      'yourReferralCode': 'Your referral code',
      'copy': 'Copy',
      'share': 'Share',
      'shareVia': 'Share via',
      'whatsapp': 'WhatsApp',
      'sms': 'SMS',
      'email': 'Email',
      'more': 'More',
      'yourReferralStats': 'Your referral stats',
      'invited': 'Invited',
      'subscribed': 'Subscribed',
      'earned': 'Earned',
      'recentReferrals': 'Recent referrals',
      'pending': 'Pending',
      'aboutTitle': 'About FitKitchen',
      'addKitchenPhoto': 'Add Kitchen Photo',
      'kitchenName': 'FitKitchen',
      'kitchenTagline': 'Healthy meals, delivered fresh',
      'subscribers500': '500+ subscribers',
      'location': 'Location',
      'locationValue': 'Gandhipuram, Coimbatore',
      'since': 'Since',
      'sinceValue': '2023 • 3 years serving',
      'cuisines': 'Cuisines',
      'cuisinesValue': 'South Indian, North Indian, Continental',
      'speciality': 'Speciality',
      'specialityValue': 'High-protein, calorie-counted meals',
      'fssaiLicense': 'FSSAI License',
      'fssaiValue': '10020042001234 • Valid till Dec 2027',
      'headChef': 'Head Chef',
      'chefName': 'Chef Arjun',
      'chefBio': '12+ years experience • Le Cordon Bleu certified Specializes in nutritionally balanced Indian cuisine',
      'contactKitchen': 'Contact Kitchen',
      'call': 'Call',
      'chatWithUs': 'Chat with us',
      'emailKitchen': 'hello@fitkitch…',

      // Onboarding
      'skip': 'Skip',
      'next': 'Next',
      'getStarted': 'Get Started',
      'alreadyHaveAccount': 'Already have an account? ',
      'signIn': 'Sign in',
      'onb1Title': 'Fresh meals delivered to your door',
      'onb1Sub': 'Subscribe to daily healthy meals prepared by expert chefs with locally sourced ingredients',
      'onb2Title': 'Swap & skip anytime',
      'onb2Sub': 'Don\'t love tomorrow\'s meal? Swap it instantly. Going out? Skip without losing your credit.',
      'onb3Title': 'Track your nutrition',
      'onb3Sub': 'Every meal is calorie-counted with macros — see your progress in the diary.',

      // Splash
      'splashTagline': 'Fresh meals, delivered daily',

      // Login / OTP / SignUp
      'welcomeBack': 'Welcome back',
      'enterPhonePrompt': 'Enter your phone number to continue',
      'phoneNumber': 'Phone number',
      'getOtp': 'Get OTP',
      'orContinueWith': 'or continue with',
      'google': 'Google',
      'apple': 'Apple',
      'termsPrefix': 'By continuing, you agree to our Terms of Service\nand Privacy Policy',
      'verifyYourNumber': 'Verify your number',
      'enterCodeSentTo': 'Enter the 6-digit code sent to',
      'changeNumber': 'Change number',
      'verifyContinue': 'Verify & Continue',
      'didntReceiveCode': 'Didn\'t receive code? Check SMS or spam folder',
      'resendCodeIn': 'Resend code in 0:28',
      'setUpYourProfile': 'Set up your profile',
      'fullName': 'Full name',
      'emailOptional': 'Email (optional)',
      'emailHint': 'your@email.com',
      'dietaryPreference': 'Dietary preference',
      'nonVeg': 'Non-Veg',
      'veg': 'Veg',
      'vegan': 'Vegan',
      'jain': 'Jain',
      'allergens': 'Allergens (select if any)',
      'nuts': 'Nuts',
      'dairy': 'Dairy',
      'gluten': 'Gluten',
      'soy': 'Soy',
      'eggs': 'Eggs',
      'sesame': 'Sesame',
      'deliveryAddress': 'Delivery address',
      'searchAddressHint': 'Search for your address...',
      'orPickFromMap': 'Or pick from map →',
      'completeSetup': 'Complete Setup',
      'skipForNow': 'Skip for now — set up later in Profile',

      // Home
      'searchForHint': 'Search for "Protein Bowl"',
      'lunchInLabel': 'LUNCH · in 45 min',
      'tomorrow': 'TOMORROW',
      'viewSwap': 'View & swap →',
      'lunchOnTheWay': 'Lunch is on the way',
      'riderEta': 'Rider: Karthik · 2.3 km away',
      'track': 'Track →',
      'todaysMeals': 'Today\'s meals',
      'tomorrowsLineup': 'Tomorrow\'s lineup',
      'customize': 'Customize →',
      'yourKitchen': 'Your Kitchen',
      'aboutArrow': 'About →',
      'fssaiCertified': 'FSSAI Certified',
      'subscribers500Plus': '500+ subscribers',
      'kitchenAuthor': 'FitKitchen by Chef Arjun',
      'kitchenLocationSince': 'Coimbatore · Since 2023 · 4.8',
      'seeAll': 'See all →',
      'navHome': 'Home',
      'navMyPlan': 'My Plan',
      'navOrder': 'Order',
      'rate': 'Rate',
      'swap': 'Swap',
      'skipAction': 'Skip',
      'fitMealsBanner': 'DAILY MEALS',
      'fitMealsCount': '799 MEALS',

      // Search
      'recent': 'Recent',
      'clearAll': 'Clear all',
      'trendingNow': 'Trending now',
      'highProtein': 'High Protein',
      'ketoBowls': 'Keto Bowls',
      'lowCalorie': 'Low Calorie',
      'newArrivals': 'New Arrivals',
      'breakfastCombos': 'Breakfast Combos',
      'tryVoiceSearch': 'Try voice search — tap the mic on home',
      'typeToSearchHint': 'Type to search meals, bowls, and more...',

      // My Plan
      'myPlan': 'My Plan',
      'fitProActive': 'ACTIVE',
      'planRenewsApr28': '18/28 meals left · Renews Apr 28',
      'change': 'Change',
      'pause': 'Pause',
      'day': 'Day',
      'week': 'Week',
      'month': 'Month',
      'previous': '← Prev',
      'nextLabel': 'Next →',
      'monApr7': 'Monday, Apr 7 — Today',
      'caloriesTotal': '1,150 cal total',
      'mealsEaten': 'Meals eaten',
      'mealsSkipped': 'Meals skipped',
      'dayStreak': 'Day streak',
      'avgRating': 'Avg rating',
      'yourStats': 'Your Stats',
      'dietaryPreferencesShort': 'Dietary Preferences',
      'dietaryValues': 'Non-veg · No onion · High protein',
      'editArrow': 'Edit →',
      'upgradeBanner': 'Upgrade to Pro — get 3 meals/day + free add-ons for your 2 meals/day limit hit 6 times this week',
      'viewPlans': 'View Plans →',
      'save30': 'Save ₹30/meal',
      'upcoming': 'Upcoming',
      'complete': 'Complete →',
      'inKitchen': 'In Kitchen',

      // Subscription Detail
      'mySubscriptionTitle': 'My Subscription',
      'active': 'ACTIVE',
      'mealsPerWeekDay': '7 meals/week · 3 meals/day',
      'mealsConsumed': '18/28 meals consumed',
      'remainingDays': '10 remaining',
      'billingCycle': 'Billing Cycle',
      'startDate': 'Start date',
      'endDate': 'End date',
      'nextRenewal': 'Next renewal',
      'amount': 'Amount',
      'paymentMethod': 'Payment Method',
      'autoRenewLine': 'Auto-renew ON · Next charge ₹2,499 on Apr 28',
      'pausePlan': 'Pause Plan',
      'changePlan': 'Change Plan',
      'cancelSubscription': 'Cancel subscription',
      'amountValue': '₹2,499',
      'startDateValue': 'Apr 1, 2026',
      'endDateValue': 'Apr 28, 2026',
      'nextRenewalValue': 'Apr 28, 2026',

      // Meal Detail
      'chickenPowerBowl': 'Chicken Power Bowl',
      'mealDetailDesc': 'Grilled chicken breast with quinoa, roasted vegetables, avocado, and tahini dressing',
      'perServing': 'Per serving · 350g · 100% FSSAI compliant',
      'changeBefore': 'Change before 11:30 AM',
      'nutrition': 'Nutrition',
      'calories': 'Calories',
      'protein': 'Protein',
      'carbs': 'Carbs',
      'fat': 'Fat',
      'ingredients': 'Ingredients',
      'allergenInformation': 'Allergen Information',
      'glutenFree': 'Gluten Free ✓',
      'dairyFree': 'Dairy Free ✓',
      'nutFree': 'Nut Free ✓',
      'mayContainTraces': 'May contain traces of soy (shared kitchen)',
      'lowCarb': 'Low Carb',
      'chefsNote': 'Chef\'s Note',
      'chefNoteText': 'Marinated overnight in yogurt and spices, grilled on charcoal for that authentic smoky flavor. Paired with fluffy quinoa cooked in chicken stock.',
      'swapMeal': 'Swap Meal',
      'customizeAction': 'Customize',

      // Order Now
      'fitKitchenTitle': 'FitKitchen',
      'deliveryIn25Min': 'Delivery in 25–30 min',
      'vegBadge': 'Veg',
      'searchDishes': 'Search for dishes...',
      'bestsellers': 'Bestsellers',
      'meals': 'Meals',
      'bowls': 'Bowls',
      'snacks': 'Snacks',
      'drinks': 'Drinks',
      'under300': 'Under ₹300',
      'mostOrderedThisWeek': 'Most ordered this week',
      'add': 'ADD',
      'customizeArrow': 'Customize →',
      'popular': 'Popular',
      'lowCal': 'Low Cal',

      // Checkout
      'checkout': 'Checkout',
      'deliverTo': 'Deliver to',
      'asap': 'ASAP',
      'onDemandOnly': 'On-demand only',
      'deliveryTime': 'Delivery time',
      'deliveryInstructions': 'Delivery instructions',
      'instructionHint': 'Gate code, floor, landmark...',
      'payment': 'Payment',
      'orderSummary': 'Order summary',
      'orderSummaryLine': '2 items · Add delivery · ₹15.40 tax · ₹50 coupon',
      'total': 'Total',
      'placeOrder': 'Place Order',

      // Notifications screen
      'markAllRead': 'Mark all read',
      'lunchOnTheWayShort': 'Lunch is on the way!',
      'lunchOnTheWayDesc': 'Karthik picked up your Chicken Power Bowl',
      'rateBreakfast': 'Rate your breakfast',
      'rateBreakfastDesc': 'How was your Avocado Toast & Eggs?',
      'planRenewingSoon': 'Plan renewing soon',
      'planRenewingDesc': 'Your Fit Pro Plan renews on Apr 28 · ₹2,499',
      'earlier': 'Earlier',
      'mealDelivered': 'Meal delivered',
      'mealDeliveredDesc': 'Your dinner was delivered at 7:45 PM',
      'mealSwapped': 'Meal swapped',
      'mealSwappedDesc': 'Lunch changed to Paneer Tikka Bowl for Apr 6',
      'newMenuItems': 'New menu items!',
      'newMenuItemsDesc': '3 new bowls added this week — check them out',

      // Tracking
      'shareEta': 'Share ETA',
      'minAway': 'min away',
      'liveBadge': 'LIVE',
      'powerBowlOnMove': 'Your Power Bowl is on the move!',
      'caloriesProteinShort': 'Chicken Power Bowl · 520 cal · 42g protein',
      'preparedCookingPickedUp': 'Prepared',
      'cooking': 'Cooking',
      'pickedUp': 'Picked up',
      'onTheWay': 'On the way',
      'arrived': 'Arrived',
      'todaysDeliveries': 'Today\'s deliveries',
      'reportIssue': 'Report an issue',

      // Help & Support
      'helpSupport': 'Help & Support',
      'howCanWeHelp': 'How can we help you?',
      'searchHelpHint': 'Search help articles...',
      'quickContact': 'Quick Contact',
      'callSupport': 'Call Support',
      'chatWithUsShort': 'Chat with us',
      'emailUs': 'Email us',
      'faq': 'Frequently Asked Questions',
      'orders': 'ORDERS',
      'faq1': 'How do I swap a meal?',
      'faq2': 'How do I skip a delivery?',
      'faq3': 'What\'s the cancellation policy?',
      'faq4': 'How do I pause my plan?',
      'faq5': 'Can I upgrade mid-cycle?',
      'faq6': 'How does billing work?',
      'raiseTicket': 'Raise a Ticket',
      'requestCallback': 'Or request a callback →',
      'subscriptionCaps': 'SUBSCRIPTION',

      // Rider chat
      'kmAway': 'km away',
      'onTheWayShort': 'On the way',
      'quickReplies': 'Quick replies',
      'imAtTheGate': 'I\'m at the gate',
      'pleaseCallMe': 'Please call me',
      'leaveAtDoor': 'Leave at door',
      'fiveMoreMinutes': '5 more minutes',
      'typeMessage': 'Type a message...',

      // Bottom sheets
      'swapLunch': 'Swap Lunch',
      'swapLunchSub': 'Choose an alternative for tomorrow, Apr 7',
      'vegOnly': 'Veg Only',
      'under600cal': '< 600 cal',
      'select': 'Select',
      'pauseYourPlan': 'Pause your plan',
      'pauseDesc': 'You won\'t be charged during the pause period',
      'fourteenDayPauseLine': '14 days pause · You\'ll save ₹1,200',
      'pausesUsedLine': '2 of 3 pauses used this year',
      'rateMealTitle': 'Rate Avocado Toast & Eggs',
      'rateMealSub': 'How was your breakfast today?',
      'great': 'Great!',
      'taste': 'Taste',
      'portionSizeShort': 'Portion Size',
      'presentation': 'Presentation',
      'feedbackOptional': 'Any feedback? (optional)',
      'submitRating': 'Submit Rating',
      'photo': 'Photo',
      'customizeChickenBowl': 'Customize Chicken Power Bowl',
      'changesApplyLine': 'Changes apply to tomorrow\'s lunch',
      'small300': 'Small (300g)\n400 cal',
      'medium350': 'Medium (350g)\n520 cal',
      'large420': 'Large (420g)\n620 cal',
      'spiceLevel': 'Spice Level',
      'mild': 'Mild',
      'medium': 'Medium',
      'spicy': 'Spicy',
      'extra': 'Extra',
      'proteinSwap': 'Protein Swap',
      'chicken': 'Chicken',
      'paneer': 'Paneer',
      'tofu': 'Tofu',
      'eggsLabel': 'Eggs',
      'addOnsLabel': 'Add-ons',
      'extraProtein': 'Extra Protein (50g)',
      'sideSalad': 'Side Salad',
      'extraDressing': 'Extra Dressing',
      'brownRiceSwap': 'Brown Rice (swap)',
      'exclusions': 'Exclusions',
      'noOnion': 'No Onion',
      'noGarlic': 'No Garlic',
      'noDairy': 'No Dairy',
      'noSpice': 'No Spice',
      'saveCustomization': 'Save Customization',
      'addToCart': 'Add to Cart',
      'addToCartTitle': 'Add to cart?',
      'skipLunchTomorrow': 'Skip lunch tomorrow?',
      'skipDesc': 'You won\'t be charged for this meal.\nYour next delivery will be on Apr 9.',
      'keepIt': 'Keep it',
      'yesSkip': 'Yes, skip',
    },
    'ta': {
      'appTitle': 'கிட்சன் OS',
      'profileFitProPlanActive': 'ஃபிட் ப்ரோ • செயலில்',
      'edit': 'திருத்து',
      'logout': 'வெளியேறு',
      'appVersion': 'கிட்சன் OS v1.0.0',
      'sectionSubscription': 'சந்தா',
      'sectionPayments': 'கட்டணம்',
      'sectionAccount': 'கணக்கு',
      'sectionSupport': 'ஆதரவு',
      'mySubscription': 'என் சந்தா',
      'myOrders': 'என் ஆர்டர்கள்',
      'billingHistory': 'பில்லிங்',
      'paymentMethods': 'கட்டண முறை',
      'walletCredits': 'வாலட்',
      'addresses': 'முகவரி',
      'dietaryPreferences': 'உணவு விருப்பம்',
      'referralProgram': 'பரிந்துரை',
      'notifications': 'அறிவிப்பு',
      'helpCenter': 'உதவி',
      'aboutKitchen': 'பற்றி',
      'rateApp': 'மதிப்பிடு',
      'logoutTitle': 'வெளியேற?',
      'logoutMessage': 'மீண்டும் உள்நுழைய வேண்டும்.',
      'cancel': 'ரத்து',
      'confirm': 'வெளியேறு',
    },
  };

  String _t(String key) =>
      _strings[locale.languageCode]?[key] ?? _strings['en']![key] ?? key;

  // Dynamic getter via Symbol/key would be ideal, but use direct getters for type safety.
  String get appTitle => _t('appTitle');
  String get profileFitProPlanActive => _t('profileFitProPlanActive');
  String get edit => _t('edit');
  String get logout => _t('logout');
  String get appVersion => _t('appVersion');
  String get sectionSubscription => _t('sectionSubscription');
  String get sectionPayments => _t('sectionPayments');
  String get sectionAccount => _t('sectionAccount');
  String get sectionSupport => _t('sectionSupport');
  String get mySubscription => _t('mySubscription');
  String get myOrders => _t('myOrders');
  String get billingHistory => _t('billingHistory');
  String get paymentMethods => _t('paymentMethods');
  String get walletCredits => _t('walletCredits');
  String get addresses => _t('addresses');
  String get dietaryPreferences => _t('dietaryPreferences');
  String get referralProgram => _t('referralProgram');
  String get notifications => _t('notifications');
  String get helpCenter => _t('helpCenter');
  String get aboutKitchen => _t('aboutKitchen');
  String get rateApp => _t('rateApp');
  String get logoutTitle => _t('logoutTitle');
  String get logoutMessage => _t('logoutMessage');
  String get cancel => _t('cancel');
  String get confirm => _t('confirm');
  String get chooseYourPlan => _t('chooseYourPlan');
  String get currentPlanLabel => _t('currentPlanLabel');
  String get planLite => _t('planLite');
  String get planPro => _t('planPro');
  String get planElite => _t('planElite');
  String get mostPopular => _t('mostPopular');
  String get downgrade => _t('downgrade');
  String get current => _t('current');
  String get upgrade => _t('upgrade');
  String get compareAllFeatures => _t('compareAllFeatures');
  String get featureComparison => _t('featureComparison');
  String get featureColumn => _t('featureColumn');
  String get mealsPerDay => _t('mealsPerDay');
  String get mealTypes => _t('mealTypes');
  String get portionSize => _t('portionSize');
  String get addOns => _t('addOns');
  String get liteSubtitle => _t('liteSubtitle');
  String get liteDesc => _t('liteDesc');
  String get proSubtitle => _t('proSubtitle');
  String get proDesc => _t('proDesc');
  String get eliteSubtitle => _t('eliteSubtitle');
  String get eliteDesc => _t('eliteDesc');
  String get priceLite => _t('priceLite');
  String get pricePro => _t('pricePro');
  String get priceElite => _t('priceElite');
  String get perMonth => _t('perMonth');
  String get subscription => _t('subscription');
  String get onDemand => _t('onDemand');
  String get today => _t('today');
  String get yesterday => _t('yesterday');
  String get delivered => _t('delivered');
  String get preparing => _t('preparing');
  String get rateMeal => _t('rateMeal');
  String get myAddresses => _t('myAddresses');
  String get defaultLabel => _t('defaultLabel');
  String get home => _t('home');
  String get office => _t('office');
  String get gym => _t('gym');
  String get addNewAddress => _t('addNewAddress');
  String get upi => _t('upi');
  String get cards => _t('cards');
  String get wallet => _t('wallet');
  String get defaultText => _t('default_');
  String get setDefault => _t('setDefault');
  String get topUp => _t('topUp');
  String get addPaymentMethod => _t('addPaymentMethod');
  String get kitchenOsWallet => _t('kitchenOsWallet');
  String get walletBalance => _t('walletBalance');
  String get availableBalance => _t('availableBalance');
  String get creditsRewards => _t('creditsRewards');
  String get autoApplyWallet => _t('autoApplyWallet');
  String get autoApplyDesc => _t('autoApplyDesc');
  String get thisMonth => _t('thisMonth');
  String get nextChargeAutoRenew => _t('nextChargeAutoRenew');
  String get subscriptionInvoices => _t('subscriptionInvoices');
  String get onDemandOrders => _t('onDemandOrders');
  String get paid => _t('paid');
  String get pdf => _t('pdf');
  String get referEarn => _t('referEarn');
  String get giveGetTitle => _t('giveGetTitle');
  String get giveGetDesc => _t('giveGetDesc');
  String get unlimitedNoExpiry => _t('unlimitedNoExpiry');
  String get yourReferralCode => _t('yourReferralCode');
  String get copy => _t('copy');
  String get share => _t('share');
  String get shareVia => _t('shareVia');
  String get whatsapp => _t('whatsapp');
  String get sms => _t('sms');
  String get email => _t('email');
  String get more => _t('more');
  String get yourReferralStats => _t('yourReferralStats');
  String get invited => _t('invited');
  String get subscribed => _t('subscribed');
  String get earned => _t('earned');
  String get recentReferrals => _t('recentReferrals');
  String get pending => _t('pending');
  String get aboutTitle => _t('aboutTitle');
  String get addKitchenPhoto => _t('addKitchenPhoto');
  String get kitchenName => _t('kitchenName');
  String get kitchenTagline => _t('kitchenTagline');
  String get subscribers500 => _t('subscribers500');
  String get location => _t('location');
  String get locationValue => _t('locationValue');
  String get since => _t('since');
  String get sinceValue => _t('sinceValue');
  String get cuisines => _t('cuisines');
  String get cuisinesValue => _t('cuisinesValue');
  String get speciality => _t('speciality');
  String get specialityValue => _t('specialityValue');
  String get fssaiLicense => _t('fssaiLicense');
  String get fssaiValue => _t('fssaiValue');
  String get headChef => _t('headChef');
  String get chefName => _t('chefName');
  String get chefBio => _t('chefBio');
  String get contactKitchen => _t('contactKitchen');
  String get call => _t('call');
  String get chatWithUs => _t('chatWithUs');
  String get emailKitchen => _t('emailKitchen');

  String get skip => _t('skip');
  String get next => _t('next');
  String get getStarted => _t('getStarted');
  String get alreadyHaveAccount => _t('alreadyHaveAccount');
  String get signIn => _t('signIn');
  String get onb1Title => _t('onb1Title');
  String get onb1Sub => _t('onb1Sub');
  String get onb2Title => _t('onb2Title');
  String get onb2Sub => _t('onb2Sub');
  String get onb3Title => _t('onb3Title');
  String get onb3Sub => _t('onb3Sub');
  String get splashTagline => _t('splashTagline');
  String get welcomeBack => _t('welcomeBack');
  String get enterPhonePrompt => _t('enterPhonePrompt');
  String get phoneNumber => _t('phoneNumber');
  String get getOtp => _t('getOtp');
  String get orContinueWith => _t('orContinueWith');
  String get google => _t('google');
  String get apple => _t('apple');
  String get termsPrefix => _t('termsPrefix');
  String get verifyYourNumber => _t('verifyYourNumber');
  String get enterCodeSentTo => _t('enterCodeSentTo');
  String get changeNumber => _t('changeNumber');
  String get verifyContinue => _t('verifyContinue');
  String get didntReceiveCode => _t('didntReceiveCode');
  String get resendCodeIn => _t('resendCodeIn');
  String get setUpYourProfile => _t('setUpYourProfile');
  String get fullName => _t('fullName');
  String get emailOptional => _t('emailOptional');
  String get emailHint => _t('emailHint');
  String get dietaryPreference => _t('dietaryPreference');
  String get nonVeg => _t('nonVeg');
  String get veg => _t('veg');
  String get vegan => _t('vegan');
  String get jain => _t('jain');
  String get allergens => _t('allergens');
  String get nuts => _t('nuts');
  String get dairy => _t('dairy');
  String get gluten => _t('gluten');
  String get soy => _t('soy');
  String get eggs => _t('eggs');
  String get sesame => _t('sesame');
  String get deliveryAddress => _t('deliveryAddress');
  String get searchAddressHint => _t('searchAddressHint');
  String get orPickFromMap => _t('orPickFromMap');
  String get completeSetup => _t('completeSetup');
  String get skipForNow => _t('skipForNow');

  String get searchForHint => _t('searchForHint');
  String get lunchInLabel => _t('lunchInLabel');
  String get tomorrow => _t('tomorrow');
  String get viewSwap => _t('viewSwap');
  String get lunchOnTheWay => _t('lunchOnTheWay');
  String get riderEta => _t('riderEta');
  String get track => _t('track');
  String get todaysMeals => _t('todaysMeals');
  String get tomorrowsLineup => _t('tomorrowsLineup');
  String get customize => _t('customize');
  String get yourKitchen => _t('yourKitchen');
  String get aboutArrow => _t('aboutArrow');
  String get fssaiCertified => _t('fssaiCertified');
  String get subscribers500Plus => _t('subscribers500Plus');
  String get kitchenAuthor => _t('kitchenAuthor');
  String get kitchenLocationSince => _t('kitchenLocationSince');
  String get seeAll => _t('seeAll');
  String get navHome => _t('navHome');
  String get navMyPlan => _t('navMyPlan');
  String get navOrder => _t('navOrder');
  String get rate => _t('rate');
  String get swap => _t('swap');
  String get skipAction => _t('skipAction');
  String get fitMealsBanner => _t('fitMealsBanner');
  String get fitMealsCount => _t('fitMealsCount');

  String get recent => _t('recent');
  String get clearAll => _t('clearAll');
  String get trendingNow => _t('trendingNow');
  String get highProtein => _t('highProtein');
  String get ketoBowls => _t('ketoBowls');
  String get lowCalorie => _t('lowCalorie');
  String get newArrivals => _t('newArrivals');
  String get breakfastCombos => _t('breakfastCombos');
  String get tryVoiceSearch => _t('tryVoiceSearch');
  String get typeToSearchHint => _t('typeToSearchHint');

  String get myPlan => _t('myPlan');
  String get fitProActive => _t('fitProActive');
  String get planRenewsApr28 => _t('planRenewsApr28');
  String get change => _t('change');
  String get pause => _t('pause');
  String get day => _t('day');
  String get week => _t('week');
  String get month => _t('month');
  String get previous => _t('previous');
  String get nextLabel => _t('nextLabel');
  String get monApr7 => _t('monApr7');
  String get caloriesTotal => _t('caloriesTotal');
  String get mealsEaten => _t('mealsEaten');
  String get mealsSkipped => _t('mealsSkipped');
  String get dayStreak => _t('dayStreak');
  String get avgRating => _t('avgRating');
  String get yourStats => _t('yourStats');
  String get dietaryPreferencesShort => _t('dietaryPreferencesShort');
  String get dietaryValues => _t('dietaryValues');
  String get editArrow => _t('editArrow');
  String get upgradeBanner => _t('upgradeBanner');
  String get viewPlans => _t('viewPlans');
  String get save30 => _t('save30');
  String get upcoming => _t('upcoming');
  String get complete => _t('complete');
  String get inKitchen => _t('inKitchen');

  String get mySubscriptionTitle => _t('mySubscriptionTitle');
  String get active => _t('active');
  String get mealsPerWeekDay => _t('mealsPerWeekDay');
  String get mealsConsumed => _t('mealsConsumed');
  String get remainingDays => _t('remainingDays');
  String get billingCycle => _t('billingCycle');
  String get startDate => _t('startDate');
  String get endDate => _t('endDate');
  String get nextRenewal => _t('nextRenewal');
  String get amount => _t('amount');
  String get paymentMethod => _t('paymentMethod');
  String get autoRenewLine => _t('autoRenewLine');
  String get pausePlan => _t('pausePlan');
  String get changePlan => _t('changePlan');
  String get cancelSubscription => _t('cancelSubscription');
  String get amountValue => _t('amountValue');
  String get startDateValue => _t('startDateValue');
  String get endDateValue => _t('endDateValue');
  String get nextRenewalValue => _t('nextRenewalValue');

  String get chickenPowerBowl => _t('chickenPowerBowl');
  String get mealDetailDesc => _t('mealDetailDesc');
  String get perServing => _t('perServing');
  String get changeBefore => _t('changeBefore');
  String get nutrition => _t('nutrition');
  String get calories => _t('calories');
  String get protein => _t('protein');
  String get carbs => _t('carbs');
  String get fat => _t('fat');
  String get ingredients => _t('ingredients');
  String get allergenInformation => _t('allergenInformation');
  String get glutenFree => _t('glutenFree');
  String get dairyFree => _t('dairyFree');
  String get nutFree => _t('nutFree');
  String get mayContainTraces => _t('mayContainTraces');
  String get lowCarb => _t('lowCarb');
  String get chefsNote => _t('chefsNote');
  String get chefNoteText => _t('chefNoteText');
  String get swapMeal => _t('swapMeal');
  String get customizeAction => _t('customizeAction');

  String get fitKitchenTitle => _t('fitKitchenTitle');
  String get deliveryIn25Min => _t('deliveryIn25Min');
  String get vegBadge => _t('vegBadge');
  String get searchDishes => _t('searchDishes');
  String get bestsellers => _t('bestsellers');
  String get meals => _t('meals');
  String get bowls => _t('bowls');
  String get snacks => _t('snacks');
  String get drinks => _t('drinks');
  String get under300 => _t('under300');
  String get mostOrderedThisWeek => _t('mostOrderedThisWeek');
  String get add => _t('add');
  String get customizeArrow => _t('customizeArrow');
  String get popular => _t('popular');
  String get lowCal => _t('lowCal');

  String get checkout => _t('checkout');
  String get deliverTo => _t('deliverTo');
  String get asap => _t('asap');
  String get onDemandOnly => _t('onDemandOnly');
  String get deliveryTime => _t('deliveryTime');
  String get deliveryInstructions => _t('deliveryInstructions');
  String get instructionHint => _t('instructionHint');
  String get payment => _t('payment');
  String get orderSummary => _t('orderSummary');
  String get orderSummaryLine => _t('orderSummaryLine');
  String get total => _t('total');
  String get placeOrder => _t('placeOrder');

  String get markAllRead => _t('markAllRead');
  String get lunchOnTheWayShort => _t('lunchOnTheWayShort');
  String get lunchOnTheWayDesc => _t('lunchOnTheWayDesc');
  String get rateBreakfast => _t('rateBreakfast');
  String get rateBreakfastDesc => _t('rateBreakfastDesc');
  String get planRenewingSoon => _t('planRenewingSoon');
  String get planRenewingDesc => _t('planRenewingDesc');
  String get earlier => _t('earlier');
  String get mealDelivered => _t('mealDelivered');
  String get mealDeliveredDesc => _t('mealDeliveredDesc');
  String get mealSwapped => _t('mealSwapped');
  String get mealSwappedDesc => _t('mealSwappedDesc');
  String get newMenuItems => _t('newMenuItems');
  String get newMenuItemsDesc => _t('newMenuItemsDesc');

  String get shareEta => _t('shareEta');
  String get minAway => _t('minAway');
  String get liveBadge => _t('liveBadge');
  String get powerBowlOnMove => _t('powerBowlOnMove');
  String get caloriesProteinShort => _t('caloriesProteinShort');
  String get preparedCookingPickedUp => _t('preparedCookingPickedUp');
  String get cooking => _t('cooking');
  String get pickedUp => _t('pickedUp');
  String get onTheWay => _t('onTheWay');
  String get arrived => _t('arrived');
  String get todaysDeliveries => _t('todaysDeliveries');
  String get reportIssue => _t('reportIssue');

  String get helpSupport => _t('helpSupport');
  String get howCanWeHelp => _t('howCanWeHelp');
  String get searchHelpHint => _t('searchHelpHint');
  String get quickContact => _t('quickContact');
  String get callSupport => _t('callSupport');
  String get chatWithUsShort => _t('chatWithUsShort');
  String get emailUs => _t('emailUs');
  String get faq => _t('faq');
  String get orders => _t('orders');
  String get faq1 => _t('faq1');
  String get faq2 => _t('faq2');
  String get faq3 => _t('faq3');
  String get faq4 => _t('faq4');
  String get faq5 => _t('faq5');
  String get faq6 => _t('faq6');
  String get raiseTicket => _t('raiseTicket');
  String get requestCallback => _t('requestCallback');
  String get subscriptionCaps => _t('subscriptionCaps');

  String get kmAway => _t('kmAway');
  String get onTheWayShort => _t('onTheWayShort');
  String get quickReplies => _t('quickReplies');
  String get imAtTheGate => _t('imAtTheGate');
  String get pleaseCallMe => _t('pleaseCallMe');
  String get leaveAtDoor => _t('leaveAtDoor');
  String get fiveMoreMinutes => _t('fiveMoreMinutes');
  String get typeMessage => _t('typeMessage');

  String get swapLunch => _t('swapLunch');
  String get swapLunchSub => _t('swapLunchSub');
  String get vegOnly => _t('vegOnly');
  String get under600cal => _t('under600cal');
  String get select => _t('select');
  String get pauseYourPlan => _t('pauseYourPlan');
  String get pauseDesc => _t('pauseDesc');
  String get fourteenDayPauseLine => _t('fourteenDayPauseLine');
  String get pausesUsedLine => _t('pausesUsedLine');
  String get rateMealTitle => _t('rateMealTitle');
  String get rateMealSub => _t('rateMealSub');
  String get great => _t('great');
  String get taste => _t('taste');
  String get portionSizeShort => _t('portionSizeShort');
  String get presentation => _t('presentation');
  String get feedbackOptional => _t('feedbackOptional');
  String get submitRating => _t('submitRating');
  String get photo => _t('photo');
  String get customizeChickenBowl => _t('customizeChickenBowl');
  String get changesApplyLine => _t('changesApplyLine');
  String get small300 => _t('small300');
  String get medium350 => _t('medium350');
  String get large420 => _t('large420');
  String get spiceLevel => _t('spiceLevel');
  String get mild => _t('mild');
  String get medium => _t('medium');
  String get spicy => _t('spicy');
  String get extra => _t('extra');
  String get proteinSwap => _t('proteinSwap');
  String get chicken => _t('chicken');
  String get paneer => _t('paneer');
  String get tofu => _t('tofu');
  String get eggsLabel => _t('eggsLabel');
  String get addOnsLabel => _t('addOnsLabel');
  String get extraProtein => _t('extraProtein');
  String get sideSalad => _t('sideSalad');
  String get extraDressing => _t('extraDressing');
  String get brownRiceSwap => _t('brownRiceSwap');
  String get exclusions => _t('exclusions');
  String get noOnion => _t('noOnion');
  String get noGarlic => _t('noGarlic');
  String get noDairy => _t('noDairy');
  String get noSpice => _t('noSpice');
  String get saveCustomization => _t('saveCustomization');
  String get addToCart => _t('addToCart');
  String get addToCartTitle => _t('addToCartTitle');
  String get skipLunchTomorrow => _t('skipLunchTomorrow');
  String get skipDesc => _t('skipDesc');
  String get keepIt => _t('keepIt');
  String get yesSkip => _t('yesSkip');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ta'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async =>
      AppLocalizations(locale);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
