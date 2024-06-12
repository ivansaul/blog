# Creating Shapes in SwiftUI

{% hint style="success" %}
[**Source Code**](../../../src/SwiftUICookbook/SwiftUICookbook/ShapesSwiftUI.swift) <img src="../../.gitbook/assets/github-logo-icon.svg" alt="" data-size="original">
{% endhint %}

SwiftUI provides a robust set of tools for creating and customizing shapes in your app. Shapes like `Circles`, `Ellipse`, `Rectangle`, `Capsule`, and `RoundedRectangle` can be easily added to your views, making it simple to create visually appealing designs. This guide will walk you through the basics of adding these shapes and customizing their appearance.

## Creating Basic Shapes

### Circle

The `Circle` shape is straightforward to create and use. Here's an example:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Circle()
            .frame(width: 200, height: 200)
    }
}
```

In this example, we create a `Circle` shape and set its frame to 200x200 points.

### Ellipse

The `Ellipse` shape can be created similarly, and it automatically adjusts its aspect ratio based on the frame provided:

```swift
struct ContentView: View {
    var body: some View {
        Ellipse()
            .frame(width: 300, height: 200)
    }
}
```

This code snippet creates an ellipse with a width of 300 points and a height of 200 points.

### Rectangle

Creating a rectangle is just as simple:

```swift
struct ContentView: View {
    var body: some View {
        Rectangle()
            .frame(width: 300, height: 200)
    }
}
```

Here, a `Rectangle` shape is created with specified dimensions.

### Rounded Rectangle

A `RoundedRectangle` shape allows you to set the corner radius for rounded corners:

```swift
struct ContentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
             .frame(width: 300, height: 200)
    }
}
```

This creates a rectangle with rounded corners, where the corner radius is set to 30 points.

## Customizing Shapes

Shapes in SwiftUI can be customized with various modifiers to change their appearance.

### Fill

You can fill a shape with a color or add a stroke (border):

```swift
struct ContentView: View {
    var body: some View {
        Circle()
            .fill(.blue)
            .frame(width: 300, height: 300)
    }
}
```

### Stroke

```swift
struct ShapesSwiftUI: View {
     var body: some View {
         Circle()
             .stroke(.red, lineWidth: 20)
             .frame(width: 300, height: 300)
     }
}
```

The first example fills the circle with red, and the second adds a red stroke to the rectangle.

### Opacity and Shadow

You can adjust the opacity and add a shadow to shapes:

```swift
struct ContentView: View {
    var body: some View {
        Ellipse()
            .fill(Color.green)
            .frame(width: 300, height: 200)
            .shadow(color: .blue, radius: 10, x: 0, y: 15))
    }
}
```

This example creates an ellipse with blue fill, and a shadow.

### Gradient Fills

SwiftUI also supports gradient fills for shapes:

```swift
struct ContentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.blue, .orange]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: 300, height: 200)
    }
}
```

Here, we apply a linear gradient to a rounded rectangle.