class Constants {
  static const appTitle = 'Blog App';
  static const List<String> topics = [
    'Technology',
    'Business',
    'Programming',
    'Entertainment',
  ];

  static const noConnectionErrorMessage = 'Not connected to a network!';
  static const failureErrorMessage = 'An unexpected error occurred,';
  static const signUp = 'Sign Up';
  static const name = 'Name';
  static const email = 'Email';
  static const password = 'Password';
  static const signIn = 'Sign In';
  static const alreadyHaveAnAccount = 'Already have an account? ';
  static const doNotHaveAnAccount = 'Don\'t have an account? ';

// Padding and margin sizes ----------------------------------------------------------------
  static double xs = 4.0;
  static double sm = 8.0;
  static double md = 16.0;
  static double lg = 24.0;
  static double xl = 32.0;

  /// Spacing  ----------------------------------------------------------------
  static double defaultSpace = 24.0;
  static double spaceBtwItems = 16.0;
  static double spaceBtwSections = 32.0;
  static double defaultPadding = 20.0;

  /// Border radius  ----------------------------------------------------------------
  static double borderRadiusSm = 4.0;
  static double borderRadiusMd = 8.0;
  static double borderRadiusLg = 12.0;
  static double borderRadiusXLg = 16.0;
}

class AppSupabase {
  static const supabaseUrl = 'https://ugayfwynrapzzjuhtqio.supabase.co';
  static const supabaseAnonKey = '';
}
