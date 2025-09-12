# Currency Converter App

A comprehensive Flutter application for currency conversion and historical data analysis, built with modern architecture patterns and best practices.

## 📱 Features Implemented

### ✅ Completed Features

1. **Currency List with Country Flags**: Display supported currencies with their respective country flags
2. **Local Database Caching**: Store currency and country data locally using Drift database after first API request
3. **Historical Data Visualization**: Interactive charts and detailed analysis for the last 7 days of currency data
4. **Enhanced Loading States**: Beautiful skeleton loading animations that mirror actual content structure
5. **Responsive Design**: Adaptive UI that works across different screen sizes
6. **Error Handling**: Comprehensive error handling with user-friendly messages

### 🚧 Partially Implemented Features

- **Currency Converter**: API endpoint structure exists but UI for amount conversion is not yet implemented

## 🏗️ Architecture & Design Patterns

### Clean Architecture with Feature-First Structure

The app follows **Clean Architecture** principles combined with a **feature-first** folder structure:

```
lib/
├── core/                    # Shared utilities and configurations
│   ├── config/             # App configuration and environment setup
│   ├── database/           # Database configuration (Drift)
│   ├── dependency_injection/ # GetIt + Injectable setup
│   ├── networking/         # API clients, error handling, interceptors
│   ├── navigation/         # GoRouter configuration
│   └── resources/          # Themes, styles, constants
├── features/               # Feature modules
│   ├── home/              # Currency listing feature
│   └── historical_data/   # Historical data analysis feature
└── main.dart
```

#### Why Clean Architecture?

- **Separation of Concerns**: Each layer has a single responsibility
- **Testability**: Business logic is isolated from UI and external dependencies
- **Maintainability**: Changes in one layer don't affect others
- **Scalability**: Easy to add new features without affecting existing code

### State Management: BLoC Pattern

**Chosen Library**: `flutter_bloc` + `hydrated_bloc`

#### Justification:

- **Predictable State Management**: Clear separation between events and states
- **Testability**: Easy to unit test business logic
- **State Persistence**: HydratedBloc automatically persists state across app restarts
- **Scalability**: Excellent for complex apps with multiple state dependencies
- **Community Support**: Widely adopted with extensive documentation

### Dependency Injection: GetIt + Injectable

**Chosen Libraries**: `get_it` + `injectable`

#### Justification:

- **Compile-time Safety**: Injectable generates registration code at compile time
- **Performance**: No runtime reflection, faster app startup
- **Maintainability**: Automatic dependency graph generation
- **Flexibility**: Supports different registration scopes (singleton, factory, lazy)

## 🖼️ Image Loading Library

**Chosen Library**: `cached_network_image`

### Justification:

- **Caching**: Automatic disk and memory caching for better performance
- **Placeholder Support**: Built-in loading and error placeholders
- **Memory Management**: Efficient memory usage with automatic cache cleanup
- **Network Optimization**: Reduces bandwidth usage through intelligent caching
- **Flutter Integration**: Seamless integration with Flutter's widget tree

### Implementation:

```dart
CustomCachedImage(
  mediaUrl: country.flagUrl,
  width: AppSize.s36,
  height: AppSize.s36,
  fit: BoxFit.cover,
)
```

## 🗄️ Database Solution

**Chosen Library**: `Drift` (formerly Moor)

### Justification:

- **Type Safety**: Compile-time query validation and type-safe results
- **Performance**: Efficient SQLite operations with optimized queries
- **Code Generation**: Automatic model and DAO generation
- **Migration Support**: Built-in database migration system
- **Reactive Streams**: Stream-based data observation for real-time UI updates
- **Cross-platform**: Works consistently across iOS, Android, and other platforms

### Database Schema:

```dart
class CountriesDb extends Table {
  TextColumn get id => text().withLength(min: 1, max: 10).nullable()();
  TextColumn get alpha3 => text().withLength(min: 1, max: 10).nullable()();
  TextColumn get currencyId => text().withLength(min: 1, max: 10).nullable()();
  TextColumn get currencyName => text().withLength(min: 1, max: 100).nullable()();
  TextColumn get currencySymbol => text().withLength(min: 1, max: 20).nullable()();
  TextColumn get name => text().withLength(min: 1, max: 100).nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
```

### Caching Strategy:

- **First Load**: Fetch data from API and store in local database
- **Subsequent Loads**: Load from local database for instant access
- **Data Freshness**: Automatic refresh if data is older than 7 days
- **Offline Support**: App works offline with cached data

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.8.1)
- Dart SDK
- Android Studio / VS Code
- API key from currency conversion service

### Installation Steps

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd currencyapp
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Set up environment variables**

   **⚠️ Important**: You need to contact the developer for the API key.

   📧 **Contact**: `mohamedghaly.dev@gmail.com` to request API key access.

   Create a `.env.dev` file in the root directory:

   ```env
   API_KEY=your_api_key_here
   ```

4. **Generate code**

   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## 🛠️ Development Setup

### Code Generation

The app uses several code generation tools:

```bash
# Generate all files
flutter packages pub run build_runner build --delete-conflicting-outputs

# Watch for changes during development
flutter packages pub run build_runner watch --delete-conflicting-outputs
```

### Generated Files Include:

- **Drift**: Database models and DAOs (`*.g.dart`)
- **Freezed**: Immutable data classes (`*.freezed.dart`)
- **JSON Serializable**: JSON serialization (`*.g.dart`)
- **Injectable**: Dependency injection registration (`injection.config.dart`)
- **Retrofit**: API client implementations (`*.g.dart`)

## 📊 API Integration

### Base URL

The app integrates with a currency conversion API service.

### Endpoints Used:

- `GET /api/v8/countries` - Fetch countries with currency information
- `GET /api/v8/currencies` - Fetch available currencies
- `GET /api/v8/convert` - Currency conversion (prepared but not implemented in UI)

### Error Handling:

- Network connectivity checks
- API error response parsing
- User-friendly error messages
- Retry mechanisms

## 🎨 UI/UX Features

### Design System:

- **Material 3**: Modern Material Design components
- **Custom Typography**: Roboto font family with multiple weights
- **Consistent Spacing**: Standardized padding and margins
- **Color Scheme**: Professional blue-based color palette

### Loading States:

- **Skeleton Loading**: Mimics actual content structure
- **Shimmer Effects**: Engaging loading animations
- **Tab-aware Skeletons**: Different loading states for charts and lists

### Responsive Design:

- **Scaled App**: Adaptive scaling based on screen size
- **Flexible Layouts**: Works on phones and tablets
- **Portrait Orientation**: Optimized for mobile usage

## 🧪 Testing

### Test Structure:

```bash
test/
├── widget_test.dart        # Widget tests
└── unit/                   # Unit tests (to be implemented)
    ├── cubits/
    ├── repositories/
    └── usecases/
```

### Run Tests:

```bash
flutter test
```

## 📦 Key Dependencies

### Core Dependencies:

- **flutter_bloc**: State management
- **drift**: Local database
- **dio + retrofit**: HTTP client
- **get_it + injectable**: Dependency injection
- **go_router**: Navigation
- **cached_network_image**: Image loading
- **fl_chart**: Charts and graphs

### UI Dependencies:

- **skeletonizer**: Loading animations
- **toastification**: Toast messages
- **flutter_svg**: SVG support

### Development Dependencies:

- **build_runner**: Code generation
- **freezed**: Immutable classes
- **json_serializable**: JSON serialization

## 🔮 Future Enhancements

### Planned Features:

1. **Currency Converter UI**: Complete the amount conversion interface
2. **Favorites**: Save frequently used currency pairs
3. **Push Notifications**: Rate alerts and updates
4. **Dark Mode**: Theme switching support
5. **Multi-language**: Internationalization support
6. **Advanced Charts**: More chart types and time ranges
7. **Unit Tests**: Comprehensive test coverage
8. **Integration Tests**: End-to-end testing

### Technical Improvements:

- **Performance Optimization**: Lazy loading and pagination
- **Accessibility**: Screen reader support and keyboard navigation
- **Analytics**: User behavior tracking
- **CI/CD**: Automated testing and deployment

## 📞 Contact

For API key access or technical questions, please contact:

**Developer**: Mohamed Ghaly  
**Email**: `mohamedghaly.dev@gmail.com`

## 📄 License

This project is developed as part of a Flutter development challenge.

---

**Built with ❤️ using Flutter and Clean Architecture principles**
