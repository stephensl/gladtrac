# GladTrac

## Introduction
GladTrac is a simple Rails application designed for high school students to visualize, track, and plan academic progress toward graduation. This tool is aimed at helping students understand their graduation requirements and effectively plan their coursework.

### Features
- **Visualize**: Intuitive data representation to help students understand their academic standing.
- **Track**: Monitor progress with real-time updates on credits earned and needed.
- **Plan**: Assistance in planning course sequences, understanding prerequisites, and aligning with graduation requirements.

#### Prerequisites
- **Ruby version**: 3.2.2
- **Rails version**: 7.1.3

#### System Dependencies

- Ruby
- PostgreSQL: Database (pg gem).
- Redis: Required for certain background jobs or caching mechanisms (redis gem).
- Node.js and Yarn: For managing JavaScript dependencies 
- Web server: Puma (puma gem).

#### Notable Gems and Their Dependencies

- Devise: For user authentication (devise gem).
- Bootstrap: For styling and front-end components (bootstrap gem).
- SassC-Rails: For compiling Sass/SCSS files (sassc-rails gem).
- Capybara: For feature testing (capybara gem).
- Selenium WebDriver: For browser-based testing (selenium-webdriver gem).
- Turbo-Rails: For Hotwire's Turbo Drive and Turbo Frames features (turbo-rails gem).
- Stimulus-Rails: For integrating StimulusJS (stimulus-rails gem).
- ActionCable, ActionMailer, ActiveStorage: Part of Rails for real-time features, emails, and file uploads, respectively.

#### Development Tools
- Web Console: For debugging (web-console gem).
- Debug: For debugging (debug gem).

#### Configuration
To configure the application environment, follow these steps:
1. Clone the repository to your local machine.
2. Navigate to the app directory.
3. Install the required gems using `bundle install`.
4. Set up your database credentials in `config/database.yml`.

#### Database Creation
To create and set up the database, run the following commands:
```bash
rails db:create
rails db:migrate
```

