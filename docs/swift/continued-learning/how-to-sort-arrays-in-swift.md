---
comments: true
icon: material/sort-numeric-ascending
title: How to Sort Arrays in Swift
description: Learn how to efficiently sort arrays in Swift using built-in methods like sorted() and sort(), custom closures, and the Comparable protocol.

date: 2025-03-30
image: https://picsum.photos/200
tags:
  - Swift
  - Arrays
---

# How to Sort Arrays in Swift

Sorting is a fundamental operation in software development. Whether we're organizing user data, preparing information for display, or implementing search algorithms, efficient sorting is essential. Swift offers multiple approaches to sorting, each suited for different scenarios. Let's break them down with practical examples.

## `sorted()` Method

The `sorted()` method returns a new array with elements arranged in ascending order by default, leaving the original array unchanged.

```swift
// Sorting numbers
let numbers = [5, 2, 7, 1, 9]
let sortedNumbers = numbers.sorted()
// sortedNumbers: [1, 2, 5, 7, 9]
// numbers remains unchanged

// Sorting strings
let fruits = ["apple", "banana", "cherry", "date"]
let sortedFruits = fruits.sorted()
// sortedFruits: ["apple", "banana", "cherry", "date"]
```

## `sort()` Method

Unlike `sorted()`, the `sort()` method modifies the original array directly. This is more memory-efficient when we don’t need to keep the original order.

```swift
// Sorting in-place
var scores = [89, 72, 95, 63, 81]
scores.sort()
// scores: [63, 72, 81, 89, 95]

var countries = ["Spain", "Japan", "Brazil", "Canada"]
countries.sort()
// countries: ["Brazil", "Canada", "Japan", "Spain"]
```

!!! tip "Performance Considerations"
    `sort()` is more memory-efficient than `sorted()` when we don’t need to keep the original order. This is especially useful when working with large datasets.

## Custom Sorting with Closures

Swift allows us to define custom sorting logic using closures, which is especially useful for complex data types or non-standard sorting criteria.

### Using `sorted(by:)`

```swift
// Sorting in descending order
let ages = [25, 31, 19, 45, 28]
let descendingAges = ages.sorted(by: >)
// Result: [45, 31, 28, 25, 19]

// Alternative syntax with trailing closure
let descendingAges2 = ages.sorted { $0 > $1 }
```

### Using `sort(by:)`

```swift
var prices = [29.99, 15.50, 42.75, 8.25]
prices.sort(by: >)
// prices: [42.75, 29.99, 15.50, 8.25]
```

## Sorting Custom Objects

When working with custom types, we need to specify how they should be compared for sorting.

```swift
struct Product {
    let name: String
    let price: Double
}

let inventory = [
    Product(name: "Laptop", price: 1299.99),
    Product(name: "Phone", price: 799.99),
    Product(name: "Headphones", price: 159.99),
    Product(name: "Tablet", price: 499.99)
]

// Sorting by price (ascending)
let sortedByPrice = inventory.sorted { $0.price < $1.price }
// Result: Headphones, Tablet, Phone, Laptop

// Sorting by name (alphabetically)
let sortedByName = inventory.sorted { $0.name < $1.name }
// Result: Headphones, Laptop, Phone, Tablet
```

## Combining Multiple Sorting Criteria

Suppose we have an array of `User` objects, and we want to sort them based on complex rule that is not directly supported by simple closures.

```swift
struct User {
    let name: String
    let age: Int
}

let users = [
    User(name: "John", age: 25),
    User(name: "Alice", age: 30),
    User(name: "Jane", age: 40),
    User(name: "Bob", age: 30),
]

// Sorting by age (ascending) and then by name (alphabetically)
let sortedByAgeAndName = users.sorted {
    if $0.age == $1.age {
        return $0.name < $1.name
    }
    return $0.age < $1.age
}
// Result: John(25), Alice(30), Bob(30), Jane(40)
```

In this example, first sort users by age, and then if the ages are the same, sort them by name alphabetically.

## Making Custom Types Sortable

To simplify sorting, we can make our types conform to the `Comparable` protocol.

```swift
struct Task{
    let title: String
    let priority: Int
}

extension Task: Comparable {
    static func < (lhs: Task, rhs: Task) -> Bool {
        return lhs.priority > rhs.priority // Higher priority first
    }
}

let tasks = [
    Task(title: "Check emails", priority: 2),
    Task(title: "Update documentation", priority: 3),
    Task(title: "Fix bug", priority: 5),
    Task(title: "Schedule meeting", priority: 1)
]

// Sorting is now effortless
let sortedTasks = tasks.sorted()
// Result: ["Fix bug", "Update documentation", "Check emails", "Schedule meeting"]
```

## Conclusion

Swift provides a robust and flexible set of tools for sorting data efficiently. Whether sorting simple arrays or complex objects, choosing the right method depends on factors such as memory efficiency, performance, and the need for custom sorting logic. By understanding these sorting techniques, we can write cleaner, more optimized, and maintainable code.
