# Wallet Transactions App (iOS)

A sample iOS application demonstrating clean architecture, async programming, and transaction state handling using UIKit and Swift.

## 🚀 Overview

This app simulates a wallet system with:

* Balance fetching
* Transaction list
* Payment state handling (success / failed / pending)
* Retry mechanism for failed transactions

The goal is to showcase practical engineering patterns used in real-world apps, not just UI rendering.

---

## 🧱 Architecture

* MVVM (lightweight)
* Protocol-based networking
* Dependency Injection (manual, no frameworks)

```
ViewController → ViewModel → APIClient (Protocol) → Mock / Real
```

---

## ⚙️ Tech Stack

* Swift
* UIKit
* XIB-based UITableViewCell
* async/await
* URLSession
* No third-party libraries

---

## 🔄 Key Features

### 1. Wallet Balance

* Fetches balance from API layer
* Handles loading and error states

### 2. Transactions Flow

* Displays list of transactions
* Each transaction has a state:

  * pending
  * success
  * failed

### 3. Retry Logic

* Failed transactions can be retried
* Simulates async processing
* Updates UI based on result

---

## 🧠 Engineering Highlights

* Decoupled networking via `APIClientProtocol`
* Mock API layer for testability
* Manual UI binding (no Combine)
* Clear separation of concerns (View vs ViewModel)
* State-driven UI updates

---

## 📁 Project Structure

```
Core/
  APIClient
  MockAPIClient
  DIContainer

Features/
  Wallet/
    WalletViewController
    WalletViewModel

  Transactions/
    TransactionsViewController
    TransactionsViewModel
    TransactionCell (XIB)
    Transaction Model
```

---

## 🧪 Mocking Strategy

* Uses `MockAPIClient` to simulate API responses
* Enables predictable testing without backend dependency
* Easily switchable via DIContainer

---

## ⚠️ Limitations

* No pagination
* No persistent storage
* Full table reload instead of row-level updates
* No unit tests (can be added)

---

## 📌 Future Improvements

* Row-level UI updates (`reloadRows`)
* Add unit tests for ViewModels
* Introduce caching layer
* Better state modeling (processing vs pending)

---

## ▶️ How to Run

1. Clone the repo
2. Open `.xcodeproj`
3. Run on simulator

---

## 👤 Author

Hiren Mistry
iOS Developer

