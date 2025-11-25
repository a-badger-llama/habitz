# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Habitz is a Rails 7.1 application built with Ruby 3.1.2, using PostgreSQL as the database. The application uses Hotwire (Turbo and Stimulus) for interactive frontend behavior and follows standard Rails conventions.

## Development Commands

### Setup
```bash
bundle install                    # Install dependencies
bin/rails db:create              # Create databases
bin/rails db:migrate             # Run migrations
bin/rails db:seed                # Seed the database
```

### Running the Application
```bash
bin/rails server                 # Start the server (default: localhost:3000)
bin/dev                          # Start development server with asset compilation
```

### Testing
```bash
bin/rails test                   # Run all tests
bin/rails test test/models       # Run model tests
bin/rails test test/controllers  # Run controller tests
bin/rails test test/system       # Run system tests
bin/rails test path/to/test.rb   # Run a specific test file
bin/rails test path/to/test.rb:10 # Run a specific test at line 10
```

Tests run in parallel by default using all available processors (configured in test/test_helper.rb).

### Database
```bash
bin/rails db:migrate             # Run pending migrations
bin/rails db:rollback            # Rollback last migration
bin/rails db:reset               # Drop, create, migrate, and seed
bin/rails db:schema:load         # Load schema without running migrations
```

Database names:
- Development: `habitz_development`
- Test: `habitz_test`
- Production: `habitz_production`

### Console and Debugging
```bash
bin/rails console               # Start Rails console
bin/rails dbconsole            # Start database console
```

## Architecture

### Technology Stack
- **Framework**: Rails 7.1.3+
- **Ruby**: 3.1.2
- **Database**: PostgreSQL
- **Frontend**: Hotwire (Turbo Rails + Stimulus)
- **Asset Pipeline**: Sprockets with importmap-rails
- **Testing**: Minitest with Capybara/Selenium for system tests

### Application Structure
Standard Rails MVC architecture:
- `app/models/` - ActiveRecord models, inherit from ApplicationRecord
- `app/controllers/` - Controllers, inherit from ApplicationController
- `app/views/` - View templates
- `app/helpers/` - View helpers
- `app/jobs/` - ActiveJob background jobs
- `app/mailers/` - ActionMailer mailers
- `app/channels/` - ActionCable channels for WebSocket connections
- `app/assets/` - Images, stylesheets, and JavaScript assets

### Configuration
Module name: `Habitz` (config/application.rb:9)

The application uses Rails 7.1 defaults and has autoloading configured to ignore `assets` and `tasks` subdirectories in the lib folder.

### Frontend
The application uses Hotwire stack:
- **Turbo Rails**: For SPA-like navigation without full page reloads
- **Stimulus**: For JavaScript behavior
- **importmap-rails**: For managing JavaScript dependencies without bundling

### Testing Framework
- Uses Minitest (Rails default)
- System tests use Capybara with Selenium WebDriver
- Tests are parallelized automatically
- Fixtures loaded from `test/fixtures/` for all tests
