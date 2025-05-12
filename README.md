# Good Night App 🌙

This is a sleep tracking API built with Ruby on Rails. It supports sleep logs, follow/unfollow features, and viewing followings’ weekly sleep durations.

---

## 🔧 Features

- Track sleep records (clock in/out)
- Follow/unfollow other users
- View sleep data from followed users (past 7 days, sorted by duration)
- API documentation via Swagger (`rswag`)

---

## 🧱 Stack

- Ruby on Rails API
- PostgreSQL
- RSpec & Shoulda Matchers for testing
- Rswag for API documentation
- Nix for environment setup

---

## 🚀 Getting Started

### 1. Clone and Enter

```bash
git clone <your-repo-url>
cd good-night
````

### 2. Enter Dev Environment (with Nix)

```bash
nix develop
```

### 3. Install Rails (inside nix shell if not yet installed)

```bash
gem install bundler
bundle install
```

---

## 🗄️ Database Setup

```bash
rails db:create db:migrate db:seed
```

> Seeds will create users Alice, Bob, and Charlie with sample sleep records and follows.

---

## 🧪 Running Tests

```bash
bundle exec rspec
```

---

## 📘 API Docs

To generate Swagger docs:

```bash
rake rswag:specs:swaggerize
```

Then open the Swagger UI:

```bash
rails s
# Visit http://localhost:3000/api-docs
```

---

## 📂 Project Structure

* `app/models/` - Models for User, SleepRecord, Follow
* `app/controllers/` - RESTful controllers
* `db/migrate/` - Database migrations
* `spec/` - RSpec + Swagger tests
* `swagger/` - Auto-generated API docs

---

## 👨‍💻 Development Tips

* Use `rails console` to interact with data
* Use `rails routes` to see all available endpoints
* Use `curl` or Postman to test endpoints manually

---

## ✅ Next Improvements

* Add authentication (Devise or JWT)
* Add pagination for large sleep record lists
* Add caching for performance

