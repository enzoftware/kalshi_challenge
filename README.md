# Kalshi Challenge

Kalshi is a regulated exchange and prediction market where users can trade on the outcome of real-world events.

As part of our ongoing development, we are introducing a new **Financial Wellness** feature that helps users track their financial situation.

## Overview

The **Financial Wellness** feature allows users to input key financial details, such as:
- ✅ Annual Gross Income
- ✅ Average Monthly Costs

With this data, we determine a **Financial Wellness Score**, categorizing users into different financial health levels.

## 📁 Project Structure

The project follows a **modular architecture** to improve scalability, testability, and maintainability.

```
kalshi_challenge/
│── lib/
│   ├── common/                     # Shared utilities & components
│   ├── financial_wellness/          # Feature module
│   │   ├── bloc/                    # Business logic layer (BLoC)
│   │   ├── views/                   # UI screens
│   │   ├── widgets/                 # Reusable UI components
│   │   └── financial_wellness.dart  # Entry point for the feature
│   ├── l10n/                        # Localization files
│   ├── main.dart                    # App entry point
│
├── packages/
│   ├── finance_repository/          # Handles business logic and finance calculations
│   ├── kalshi_ui/                   # UI components & theming (Design System)
│
├── test/                            # Unit and Widget Tests
│   ├── financial_wellness/
│   │   ├── bloc/                    # BLoC unit tests
│   │   ├── views/                   # UI tests
│   ├── test_helper.dart             # Common test utilities
│
├── pubspec.yaml                     # Dependencies
```

## 📌 Key Features

- **Modular Architecture**: Separation of concerns for better maintainability.
- **BLoC State Management**: Manages the app’s business logic and state.
- **Design System**: `kalshi_ui` package for a consistent UI/UX experience.
- **Finance Repository**: Manages financial calculations & business logic.
- **Localization (l10n)**: Supports multiple languages for a global audience.

## 🚀 Demo


https://jmp.sh/s/FtwJ9hIQpUV1BrhnNUoW


## 📦 Dependencies

| Package             | Description                                |
|--------------------|--------------------------------------------|
| `flutter_bloc`    | State management with BLoC pattern        |
| `equatable`       | Simplifies state comparison               |
| `formz`           | Validates form inputs                     |
| `intl`            | Handles currency formatting               |
| `mocktail`        | Unit testing & mocking                    |

Install dependencies with:
```sh
flutter pub get
```


