# UsersExplorer

**UsersExplorer** is an iOS app built with **UIKit**, following **MVVM-C architecture** and **Repository pattern**, demonstrating fetching and displaying users from the **JSONPlaceholder API**. It is built programmatically, with **Combine** for reactive bindings and clean, testable code.

---

## Features

* Fetch and display users from JSONPlaceholder API
* Programmatic **UITableView** with reusable custom cells
* **MVVM-C architecture** for clean separation of concerns
* **Repository pattern** for network abstraction
* **Combine** used for reactive UI updates
* **NetworkManager** with robust error handling
* **Logger** utilities
* Unit tests for ViewModel and Repository
* Fully programmatic UI, no storyboards required (Main.storyboard placeholder included)

---

## Folder Structure

```
UsersExplorer/
│
├── App/
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
│
├── AppConfiguration/
│   ├── AppEnvironment.swift
│   ├── AppConfiguration.swift
│   └── APIEndpoints.swift
│
├── Coordinators/
│   ├── Coordinator.swift
│   ├── AppCoordinator.swift
│   └── UsersCoordinator.swift
│
├── Models/
│   ├── User.swift
│   ├── Address.swift
│   └── Company.swift
│
├── Network/
│   ├── HTTPMethod.swift
│   ├── NetworkError.swift
│   └── NetworkManager.swift
|   └── NetworkResult.swift
│
├── Utilities/
│   ├── Logger.swift
│
├── ViewModels/
│   └── UserListViewModel.swift
│
├── Views/
│   └── UserList/
│       ├── UserListViewController.swift
│       └── UserCell.swift
│
├── Resource/
│   ├── Main.storyboard
│   └── Assets.xcassets
│
├── Tests/
│   ├── UserListViewModelTests.swift
│   ├── UserRepositoryTests.swift
│   └── MockUserRepository.swift
│
└── README.md
```

---

## Architecture

* **MVVM-C**: Model → View → ViewModel → Coordinator
* **Repository pattern**: abstracts networking logic from ViewModel
* **NetworkManager**: centralized network layer with error handling
* **Combine**: @Published properties for reactive UI updates
* **Logger**: debug-friendly logging
* **ImageCache**: simple reusable in-memory cache for images

---

## Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/UsersExplorer.git
```

2. Open `UsersExplorer.xcodeproj` in Xcode (iOS 15+ recommended).
3. Build and run on **iPhone simulator** or **real device**.

---

## Usage

* The app automatically fetches users on launch.
* Users are displayed in a table view showing **name** and **company**.
* Pull-to-refresh is not implemented but can be added in the ViewController easily.

---

## Unit Tests

* **ViewModel** tested with **MockUserRepository** for success and failure.
* **Repository** tested against real network calls to JSONPlaceholder.

Run tests in Xcode: **Product → Test** or `Cmd + U`.

---

## Dependencies

* **UIKit** (no SwiftUI)
* **Combine**
* No third-party libraries; everything built with **native iOS frameworks**.

---

## Time Estimation

* Project setup: 30 minutes 
* Network + Repository layer: 1.0 hours
* ViewModel + Combine: 45 minutes
* Views and UITableView: 30 minutes
* Unit tests: 45 minutes
* Total estimated time: 0.5 + 1.0 + 0.75 + 0.5 + 0.75 = 3.5 hours hours
---
