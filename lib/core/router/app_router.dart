import 'package:customer_app/core/constants/app_router_constants.dart';
import 'package:customer_app/features/about_kitchen/presentation/screens/about_kitchen_screen.dart';
import 'package:customer_app/features/addresses/presentation/screens/addresses_screen.dart';
import 'package:customer_app/features/auth/presentation/screens/login_screen.dart';
import 'package:customer_app/features/auth/presentation/screens/otp_screen.dart';
import 'package:customer_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:customer_app/features/billing_history/presentation/screens/billing_history_screen.dart';
import 'package:customer_app/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:customer_app/features/help_support/presentation/screens/help_support_screen.dart';
import 'package:customer_app/features/meal_detail/presentation/screens/meal_detail_screen.dart';
import 'package:customer_app/features/my_orders/presentation/screens/my_orders_screen.dart';
import 'package:customer_app/features/my_plan/presentation/screens/my_plan_screen.dart';
import 'package:customer_app/features/notifications_screen/presentation/screens/notifications_screen.dart';
import 'package:customer_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:customer_app/features/order_now/presentation/screens/order_now_screen.dart';
import 'package:customer_app/features/payment_methods/presentation/screens/payment_methods_screen.dart';
import 'package:customer_app/features/plans/presentation/screens/plans_screen.dart';
import 'package:customer_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:customer_app/features/referral/presentation/screens/referral_screen.dart';
import 'package:customer_app/features/shell/presentation/screens/main_shell.dart';
import 'package:customer_app/features/rider_chat/presentation/screens/rider_chat_screen.dart';
import 'package:customer_app/features/search/presentation/screens/search_screen.dart';
import 'package:customer_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:customer_app/features/subscription_detail/presentation/screens/subscription_detail_screen.dart';
import 'package:customer_app/features/tracking/presentation/screens/delivery_tracking_screen.dart';
import 'package:customer_app/features/wallet/presentation/screens/wallet_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/${AppRouterConstants.splash}',
    routes: [
      // Auth
      GoRoute(
        path: '/${AppRouterConstants.splash}',
        name: AppRouterConstants.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.onboarding}',
        name: AppRouterConstants.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.login}',
        name: AppRouterConstants.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.otp}',
        name: AppRouterConstants.otp,
        builder: (context, state) => const OtpScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.signUp}',
        name: AppRouterConstants.signUp,
        builder: (context, state) => const SignUpScreen(),
      ),

      // Main shell (Home + My Plan + Order tabs)
      GoRoute(
        path: '/${AppRouterConstants.home}',
        name: AppRouterConstants.home,
        builder: (context, state) {
          final extra = state.extra;
          final initial = extra is int ? extra : 0;
          return MainShell(initialIndex: initial);
        },
      ),
      GoRoute(
        path: '/${AppRouterConstants.search}',
        name: AppRouterConstants.search,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.myPlan}',
        name: AppRouterConstants.myPlan,
        builder: (context, state) => const MyPlanScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.orderNow}',
        name: AppRouterConstants.orderNow,
        builder: (context, state) => const OrderNowScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.mealDetail}',
        name: AppRouterConstants.mealDetail,
        builder: (context, state) => const MealDetailScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.checkout}',
        name: AppRouterConstants.checkout,
        builder: (context, state) => const CheckoutScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.notificationsScreen}',
        name: AppRouterConstants.notificationsScreen,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.deliveryTracking}',
        name: AppRouterConstants.deliveryTracking,
        builder: (context, state) => const DeliveryTrackingScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.helpSupport}',
        name: AppRouterConstants.helpSupport,
        builder: (context, state) => const HelpSupportScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.messageRider}',
        name: AppRouterConstants.messageRider,
        builder: (context, state) => const RiderChatScreen(),
      ),

      // Plans (compare/upgrade)
      GoRoute(
        path: '/${AppRouterConstants.plans}',
        name: AppRouterConstants.plans,
        builder: (context, state) => const PlansScreen(),
      ),

      // Profile + sub-pages
      GoRoute(
        path: '/${AppRouterConstants.profile}',
        name: AppRouterConstants.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.mySubscription}',
        name: AppRouterConstants.mySubscription,
        builder: (context, state) => const SubscriptionDetailScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.myOrders}',
        name: AppRouterConstants.myOrders,
        builder: (context, state) => const MyOrdersScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.billingHistory}',
        name: AppRouterConstants.billingHistory,
        builder: (context, state) => const BillingHistoryScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.paymentMethods}',
        name: AppRouterConstants.paymentMethods,
        builder: (context, state) => const PaymentMethodsScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.walletCredits}',
        name: AppRouterConstants.walletCredits,
        builder: (context, state) => const WalletScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.addresses}',
        name: AppRouterConstants.addresses,
        builder: (context, state) => const AddressesScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.referralProgram}',
        name: AppRouterConstants.referralProgram,
        builder: (context, state) => const ReferralScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.aboutKitchen}',
        name: AppRouterConstants.aboutKitchen,
        builder: (context, state) => const AboutKitchenScreen(),
      ),
      GoRoute(
        path: '/${AppRouterConstants.helpCenter}',
        name: AppRouterConstants.helpCenter,
        builder: (context, state) => const HelpSupportScreen(),
      ),
    ],
  );
}
