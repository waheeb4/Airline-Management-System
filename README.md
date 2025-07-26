# ✈️ Airline Management System

A desktop-based airline management system built with **JavaFX**, **FXML**, and **MySQL**. This project allows administrators to manage passengers, crew, flights, and ticketing operations via a user-friendly interface.

---

## 📁 Project Structure

AirlineManagementSystem/
├── src/

│ ├── main/

│ │ ├── java/

│ │ │ └── com/airlinemanagementsystem/

│ │ │ ├── classes/ # Core data models

│ │ │ └── controllers/ # JavaFX controllers for each FXML view

│ │ └── resources/

│ │ ├── Images/ # UI assets

│ │ └── *.fxml # FXML files for JavaFX UI

├── target/ # Compiled files

└── airlinedatabase.sql # MySQL database schema

---

## 🧠 Key Features

- Login & New User creation
- Flight creation and management
- Ticket booking and listing
- Passenger info management
- Crew assignment (Attendant, Captain)
- Role-based UI (Attendant, Passenger, Admin, etc.)
- MySQL database connection

---

## 🧩 Java Class Overview

### 📦 `com.airlinemanagementsystem.classes`

| Class              | Description |
|-------------------|-------------|
| `Main.java`        | Launches the JavaFX application. |
| `Database.java`    | Manages MySQL connections using JDBC. |
| `Person.java`      | Base class for `Passenger`, `Attendant`, and `Pilot`. |
| `Passenger.java`   | Represents a passenger entity. |
| `Attendant.java`   | Represents a crew member of type attendant. |
| `Pilot.java`       | Represents a pilot entity. |
| `Crew.java`        | Abstract/general crew class. |
| `Passport.java`    | Represents passport details. |
| `Flight.java`      | Represents flight details (departure, arrival, etc). |
| `Tickets.java`     | Handles ticket info and associations. |
| `Info.java`        | Central info store and utility. |
| `ComboBoxFactory.java` | Factory class to populate dropdowns with custom values. |

---

### 🎮 Controllers: `com.airlinemanagementsystem.controllers`

| Controller                 | FXML View | Description |
|---------------------------|-----------|-------------|
| `LoginController.java`     | `Login.fxml` | Handles user authentication. |
| `MainController.java`      | `Main.fxml` | Main dashboard after login. |
| `NewUserController.java`   | `NewUser.fxml` | New user registration logic. |
| `FlightsController.java`   | `Flights.fxml` | Create or update flight details. |
| `PassengerController.java` | `Passenger.fxml` | View and manage passengers. |
| `TicketController.java`    | `Ticket.fxml` | View, issue, and cancel tickets. |
| `AttendantController.java` | `Attendant.fxml` | Crew assignment and management. |
| `CaptainController.java`   | `Captain.fxml` | Similar to Attendant but for Pilots. |
| `KeyController.java`       | `Key.fxml` | Miscellaneous or possibly shortcut bindings. |

---

## 🧬 FXML Files

UI Layouts are built using JavaFX FXML:

- `Login.fxml`
- `Main.fxml`
- `NewUser.fxml`
- `Flights.fxml`
- `Passenger.fxml`
- `Ticket.fxml`
- `Captain.fxml`
- `Attendant.fxml`
- `Key.fxml`

> These define the structure and style of the app's UI and are tied to their respective controllers.

---

## 🗃️ Database

### File: `airlinedatabase.sql`

- Schema for all entities: `users`, `flights`, `passengers`, `tickets`, `crew`, etc.
- Set up using **MySQL**
- Ensure you have MySQL running locally and import this file using:

🔌 Database Connector
Located in classes/Database.java, this class:

Loads the JDBC MySQL driver.
Provides getConnection() method for controller and model classes.
