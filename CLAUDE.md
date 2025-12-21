# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**life_platter** is a life-support mobile application focusing on cooking self-care support and meal planning. The project consists of two main components:

1. **Flutter Mobile App** (`/life_platter`) - Cross-platform mobile client
2. **FastAPI Backend** (`/docker-projects/projects/life_platter-api`) - REST API server

## Flutter App Commands

### Development Setup
```bash
# Use Flutter Version Manager (FVM) - version 3.29.3 specified in .fvmrc
fvm flutter pub get

# Generate code for Riverpod, Freezed, json_serializable
fvm flutter pub run build_runner build

# Watch mode for continuous code generation during development
fvm flutter pub run build_runner watch --delete-conflicting-outputs
```

### Running the App
```bash
# Debug mode (default)
fvm flutter run

# Run on specific device
fvm flutter devices
fvm flutter run -d <device-id>
```

### Testing and Analysis
```bash
# Run tests
fvm flutter test

# Analyze code
fvm flutter analyze
```

## Backend API Commands

### Docker Environment
```bash
# Navigate to API directory
cd /Users/sota/development/personal/docker-projects/projects/life_platter-api

# Start all services (MySQL DB + FastAPI + Nginx)
docker-compose up -d

# View logs
docker-compose logs -f app

# Stop services
docker-compose down

# Rebuild after dependency changes
docker-compose up -d --build
```

### Database Connection Test
Access `http://localhost/db-check` after starting Docker services to verify MySQL connection.

### API Endpoints
- Root: `http://localhost/` - Health check
- Swagger UI: `http://localhost/docs` - API documentation
- Cooking API: `http://localhost/cooking/` - Cooking feature endpoints

## Architecture

### Flutter App (DDD 3-Layer Architecture)

```
lib/
├── main.dart                    # Entry point, initializes ja_JP locale
├── routing/
│   └── routing.dart            # GoRouter configuration with StatefulShellRoute
├── common/
│   ├── theme/
│   │   └── app_colors.dart     # Color scheme (#FFB74D, #FFF9C4)
│   └── ui_widgets/
│       ├── base_page.dart      # Root scaffold with bottom navigation
│       └── empty_page.dart     # Placeholders for unimplemented features
└── features/                   # Feature modules (DDD pattern)
    └── tab_cooking_calendar/
        ├── domain/             # Entities (Cooking model)
        ├── application/        # UseCases, Services (to be implemented)
        └── presentation/       # UI components (CookingCalendarPage)
```

**Key Patterns:**
- **State Management**: Riverpod with code generation (`riverpod_generator`)
- **Navigation**: GoRouter with 5 bottom tabs (Calendar, Menu Book, Add, Graph, Others)
  - Each tab has independent navigation stack via `GlobalKey<NavigatorState>`
- **Domain Models**: Use Freezed for immutable entities with copyWith
- **Localization**: Japanese (ja_JP) via `intl` package

### Backend API (Feature-Based Structure)

```
life_platter-api/
├── main.py                     # FastAPI app entry, router registration
├── app/
│   ├── core/
│   │   └── database.py         # SQLAlchemy setup, session management
│   └── features/
│       └── cooking/
│           └── router.py       # Cooking endpoints
├── docker-compose.yml          # Services: db (MySQL), app (FastAPI), nginx
├── Dockerfile                  # Python 3.11 container
└── requirements.txt            # Dependencies
```

**Database Configuration:**
- **Environment Variable**: `DATABASE_URL` set in docker-compose.yml
- **Connection String**: `mysql+pymysql://user:password@db/life_platter_db`
- **Host**: `db` (Docker service name, not `localhost`)
- **Features**: `pool_pre_ping=True` for connection health checks, `echo=True` for SQL logging

**Important**: Database connection uses Docker service networking. The hostname `db` resolves to the MySQL container within Docker's network.

## Development Guidelines

### Flutter Code Conventions
- **Class Naming**:
  - Screens: `〇〇Page`
  - Components: `〇〇Card`, `〇〇Tile`, `〇〇Form`, `〇〇Button`
- **Documentation**: Use `///` for Dart doc comments
- **State Management**: Always use Riverpod code generation (`@riverpod` annotation)
- **Async Handling**: Use `Future` and consider `Either<Failure, Success>` pattern
- **UI Components**: Prioritize reusable widgets, avoid external responsive packages

### Backend Code Conventions
- **Router Organization**: Group endpoints by feature in `app/features/`
- **Prefix Convention**: Use `app.include_router(router, prefix="/feature_name")`
- **Dependency Injection**: Use `get_db()` function for database sessions
- **SQL Logging**: Keep `echo=True` in development, disable in production

### Critical Rules
- Never hardcode API keys or secrets (use `.env` files)
- Avoid throwing exceptions in domain layer; return explicit Failures
- Do not skip hooks (`--no-verify`) or force push to main/master
- Database connection parameters must match docker-compose.yml environment variables

## Project-Specific Context

### Navigation Structure
The app uses indexed stack navigation with 5 tabs. Only the Calendar tab (`/calendar`) is fully implemented. Other tabs (`/menuBook`, `/add`, `/graph`, `/others`) show `EmptyPage` placeholders.

### Color Scheme
- AppBar: `#FFB74D` (fluorescent orange)
- Page Background: `#FFF9C4` (light yellow)

### Future Features (from README)
Planned integration with image recognition APIs (Clarifai Food Recognition or Google Cloud Vision) for ingredient detection from photos.

## Documentation References

- Architecture Guidelines: `docs/ai/architecture.md`
- Coding Guidelines: `docs/ai/coding_guidelines.md`
- UI/UX Guidelines: `docs/ai/ui_guidelines.md`
- GitHub Copilot Instructions: `.github/copilot-instructions.md`
