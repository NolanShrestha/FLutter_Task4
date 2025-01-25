# Flutter App: User Data Manager

This Flutter application fetches user data from the [JSONPlaceholder API](https://jsonplaceholder.typicode.com/), saves it to an SQLite database, and allows users to view individual posts for each user. It demonstrates efficient handling of asynchronous operations and data persistence using SQLite.

---

## Features

### 1. Fetch User Data
- Fetches user data from the `https://jsonplaceholder.typicode.com/users` endpoint.
- Displays a list of users in a `ListView`.
- Handles errors and displays appropriate messages if fetching fails.

### 2. Save User Data to SQLite
- Provides the ability to save user details to a local SQLite database (using memory not path).
- Shows a confirmation message when a user is successfully saved.

### 3. View Saved Users
- Displays a list of users saved in the SQLite database.
- Uses a custom `BottomNavBar` for navigation between pages.

### 4. View User Posts
- Allows navigation to a detailed posts page for each user.
- Fetches posts for a specific user from the `https://jsonplaceholder.typicode.com/users/userID/posts` endpoint.
- Displays posts in a scrollable list.

---

## Screens

### 1. Home Page (`Page1`)
- Fetches and displays a list of users from the JSONPlaceholder API.
- Provides an option to save each user to the SQLite database using a favourite button.
- Navigation to the posts page for each user.

### 2. Saved Users Page (`Page2`)
- Displays a list of users saved in the local SQLite database.
- Also save posts of each user to the database.

### 3. Posts Page (`Posts`)
- Displays posts for a specific user, fetched from the API.

---

## Key Components

### 1. **User Model**
A `User` class with methods to handle JSON and SQLite data:
- `fromJson(Map<String, dynamic> json)` to parse API data.
- `toMap()` to convert the user object into a SQLite-compatible map.
- `fromMap(Map<String, dynamic> map)` to parse data from SQLite.

### 2. **SQLite Integration**
- **`DatabaseHelper`**: A utility class to manage SQLite database operations:
  - `insertUser(User user)` to save a user.
  - `fetchUsers()` to retrieve saved users.

### 3. **Custom Widgets**
- **`UserListTile`**: Displays a user with details and an option to save to the database.
- **`BottomNavBar`**: A custom navigation bar for seamless navigation between screens.

---

## How to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/NolanShrestha/Flutter_Task4.git
   ```
2. Navigate to the project directory:
   ```bash
   cd <project_directory>
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

---

## Dependencies

- [http](https://pub.dev/packages/http): For API requests.
- [sqflite](https://pub.dev/packages/sqflite): For SQLite database management.

---

## Project Structure

```
lib/
├── main.dart                # Entry point of the app
├── models/
│   └── users.dart           # User model with JSON and SQLite handling
├── database/
│   └── DatabaseHelper.dart  # SQLite database helper class
├── screens/
│   ├── page1.dart           # Home screen
│   ├── page2.dart           # Saved users screen
│   └── posts.dart           # User posts screen
├── widgets/
│   ├── BottomNavBar.dart    # Custom bottom navigation bar
│   └── UserListTile.dart    # Custom list tile for user display
```

---

## API Endpoints Used

1. **Users Endpoint**: `https://jsonplaceholder.typicode.com/users`
   - Fetches a list of users.
2. **Posts Endpoint**: `https://jsonplaceholder.typicode.com/users/userID/posts`
   - Fetches posts for a specific user.

---

## Screenshots

- ![ss1.png](/assets/ss1.png)

- ![ss2.png](/assets/ss2.png)
    
- ![ss3.png](/assets/ss3.png)

- ![ss4.png](/assets/ss4.png)


