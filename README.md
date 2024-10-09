# Flutter Blog App

A robust Flutter Blog App built with Clean Architecture principles for optimal scalability, testability, and separation of concerns. The app harnesses the power of Supabase, Bloc, Hive, Get_It, and FpDart.
![App Preview](https://i.ytimg.com/vi_webp/ELFORM9fmss/hqdefault.webp)

## Features

- **Clean Architecture**: Ensures a modular and maintainable codebase.
- **Supabase**: Utilized as the backend for real-time data handling.
- **Bloc**: Manages the state effectively for predictable state management.
- **Hive**: Provides lightweight and fast local storage solutions.
- **Get_It**: Handles dependency injection for better separation of concerns.
- **FpDart**: Adds functional programming patterns to enhance code quality.

## Installation

To get started with the app, follow these steps:

1. **Clone the repository**
    ```sh
    git clone https://github.com/AyaAbdElmoneim158/blog-app/
    ```

2. **Navigate to the project directory**
    ```sh
    cd flutter-blog-app
    ```

3. **Install dependencies**
    ```sh
    flutter pub get
    ```

4. **Run the app**
    ```sh
    flutter run
    ```

## Architecture

This project adheres to the principles of Clean Architecture to maintain clear separation between different parts of the app:

- **Domain Layer**: Contains the business logic.
- **Data Layer**: Manages data retrieval, whether from a remote source (Supabase) or local storage (Hive).
- **Presentation Layer**: Handles the UI and user interactions, managed by Bloc for state management.

## Directory Structure

```plaintext
lib/
│
├── core/
├── features/              
│   ├── auth/              
│   │   ├── data/          
│   │   ├── domain/        
│   │   ├── presentation/  
│   │
│   ├── blog/             
│       ├── data/          
│       ├── domain/        
│       ├── presentation/  
