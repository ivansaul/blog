---
comments: true
icon: material/code-array
title: How to get a sublist from a list in Swift
description: Learn how to extract sublists from arrays in Swift using various methods, including slicing, prefix, suffix, drop, filter, and stride. Avoid common pitfalls and ensure safe sublist extraction.

date: 2025-03-11
image: assets/images/swift-how-to-get-a-sublist-from-a-list-in-swift-banner.avif
tags:
  - Swift
  - Array
---

Working with lists (or arrays) in Swift is something we do all the time. Sometimes, we just need a portion of an array (a sublist) without modifying the original data. In this post, we'll explore different ways to extract sublists in Swift, using simple and practical approaches.

## Using array slicing

The easiest way to get a sublist in Swift is to use the index and range operators. Let's consider the following array:

```swift
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

To get a sublist from index `2` to `5`, we can use the `range` operator:

```swift
let sublist = numbers[2...5]
print(sublist) // Output: [3, 4, 5, 6]
```

Here we take elements from index `2` to `5` including the endpoints. This doesn't copy the data; it just creates an `ArraySlice` object which is a lightweight view into the original array.

If we need a new array instead of a `ArraySlice`, we can use the `Array` initializer:

```swift
let newArray = Array(sublist)
print(newArray) // Output: [3, 4, 5, 6]
```

!!! danger "Array index is out of range"
    The `array slicing` is not safe, it can crash your app if you try to access an element that doesn't exist.

    ```swift
    print(numbers[2...20])
    Swift/Array.swift:418: Fatal error: Array index is out of range
    ```

!!! tip "Getting a Sublist Safely"
    If we're unsure about the indices, we can use `prefix(upTo:)`, `suffix(from:)`, or `indices.contains(_:)` to avoid crashes:

    ```swift
    if numbers.indices.contains(2) && numbers.indices.contains(5) {
        let sublist = numbers[2...5]
        print(sublist) // Output: [3, 4, 5, 6]
    }
    ```

## Using the `suffix` and `prefix` methods

Another way to get a sublist is to use the built-in `suffix` and `prefix` methods. These methods return a new array containing the last or first `n` elements of the original array, respectively.

```swift
let suffix = numbers.suffix(3)
print(suffix) // Output: [8, 9, 10]

let prefix = numbers.prefix(3)
print(prefix) // Output: [1, 2, 3]
```

## Using the `dropFirst` and `dropLast` methods

We can also use the `dropFirst` and `dropLast` methods to get a sublist. These methods remove the first or last `n` elements from the original array, respectively.

```swift
let sublist = numbers.dropFirst(3)
print(sublist) // Output: [4, 5, 6, 7, 8, 9, 10]

let sublist = numbers.dropLast(3)
print(sublist) // Output: [1, 2, 3, 4, 5, 6, 7]
```

!!! note
    If the number of elements to drop exceeds the number of elements in the collection, the result is an empty array.

    ```swift
    print(numbers.dropFirst(20)) // Output: []
    print(numbers.dropLast(20)) // Output: []
    ```

## Using the `drop(while:)` method

The `drop(while:)` method removes elements from the beginning of the array while a condition holds `true`. Once an element does not meet the condition, the rest of the array is returned.

```swift
let sublist = numbers.drop(while: { $0 < 5 })
print(sublist) // Output: [5, 6, 7, 8, 9, 10]
```

## Using the `filter` method

The `filter` method is another powerful tool for extracting sublists. It takes a closure as an argument, which is called for each element in the array. If the closure returns `true`, the element is included in the result; otherwise, it is skipped.

```swift
let sublist = numbers.filter { $0 % 2 == 0 }
print(sublist) // Output: [2, 4, 6, 8, 10]
```

## Using the `stride` method

If we want to extract elements at specific intervals (e.g., every second element), we can use the stride function:

The `stride(from:to:by:)` function allows us to create a sequence of numbers with a specific step. By mapping these indices to array elements, we can efficiently extract every nth element from the array. In this example, we extract every second element, producing a sublist of odd numbers.

```swift
let sublist = stride(from: 0, to: numbers.count, by: 2)
    .map { numbers[$0] }
print(sublist) // Output: [1, 3, 5, 7, 9]
```

Swift offers multiple ways to extract sublists efficiently. Whether we need a simple slice, filtered results, or elements at regular intervals, we have powerful built-in tools at our disposal.
