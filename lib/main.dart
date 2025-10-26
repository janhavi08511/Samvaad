import 'package:flutter/material.dart';

import 'utils/app_colors.dart';
import 'utils/app_routes.dart'; // Import AppRoutes

// Import all screens used in the routes map
import 'screens/login_screen.dart';
import 'screens/main_wrapper.dart';
import 'screens/message_screen.dart';
import 'screens/ai_chat_conversation_screen.dart';
import 'screens/therapist_booking_screen.dart';
import 'screens/session_feedback_screen.dart';
import 'screens/post_detail_screen.dart';
import 'screens/ai_reflections_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/edit_profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/premium_screen.dart';
import 'screens/rorschach_test_screen.dart';
import 'screens/therapist_booking_screen.dart';
import 'pages/help_page.dart'; // For PlaceholderChatSessionScreen
import 'screens/placeholder_chat_session_screen.dart';
// --- Route Management Class (Defining the Map) ---
class AppRouter {
  static Map<String, WidgetBuilder> get routes {
    return {
      // Auth Flow
      AppRoutes.loginScreen: (context) => const LoginScreen(),
      
      // Main App Wrapper (Bottom Nav Host)
      AppRoutes.mainWrapper: (context) => const MainWrapper(),

      // Sub Screens
      AppRoutes.messagesScreen: (context) => const MessagesScreen(),
      AppRoutes.aiChatConversationScreen: (context) =>
          const AIChatConversationScreen(),
      AppRoutes.therapistBookingScreen: (context) =>
          const TherapistBookingScreen(),
      AppRoutes.sessionFeedbackScreen: (context) =>
          const SessionFeedbackScreen(),
      AppRoutes.postDetailScreen: (context) => const PostDetailScreen(),
      AppRoutes.aiReflectionsScreen: (context) => const AIReflectionsScreen(),
      AppRoutes.profileScreen: (context) => const ProfileScreen(),
      AppRoutes.editProfileScreen: (context) => const EditProfileScreen(),
      AppRoutes.settingsScreen: (context) => const SettingsScreen(),
      AppRoutes.premiumScreen: (context) => const PremiumScreen(),
      AppRoutes.rorschachTestScreen: (context) => const RorschachTestScreen(),
      AppRoutes.chatSessionPlaceholder: (context) => const PlaceholderChatSessionScreen(), 
      AppRoutes.helpPage: (context) => const HelpPage(),
    };
  }
}
// ----------------------------------------------------


void main() {
  runApp(const SamvaadApp());
}

class SamvaadApp extends StatelessWidget {
  const SamvaadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Samvaad',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Primary colors inferred from the design video (light mint/teal)
        primaryColor: AppColors.primary,
        hintColor: AppColors.accent,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Inter', // Assuming a modern font like Inter is used
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.darkText),
          titleTextStyle: TextStyle(
            color: AppColors.darkText,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.darkText),
          bodyMedium: TextStyle(color: AppColors.darkText),
        ),
        // Apply rounded corners globally
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0,
        ),
        // Button style for primary actions
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.primary,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // Input decoration for text fields
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 20.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
          labelStyle: const TextStyle(color: AppColors.greyText),
          hintStyle: const TextStyle(color: AppColors.greyText),
        ),
      ),
      initialRoute: AppRoutes.loginScreen,
      // Use the static getter from the AppRouter class
      routes: AppRouter.routes,
    );
  }
}
