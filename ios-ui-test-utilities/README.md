# UITestUtilities

## Usage

### Import UITestHelper in app

In the main app target import the app version

```swift
import UITestUtilitiesApp
```

In the UI Test target import the test version

```swift
import UITestUtilities
```

### Write enum with all UI elements to identify using the protocol

```swift
enum MyDay: String, UIAccesibilityIdentification {
   case collectionView1 = "my_collectionView"
   case cell1 = "cell_01"

   var accessibilityIdentifier: String { self.rawValue }
   var elementType: ElementType {
      switch self {
         case .cell1:
              return .cell
         case .collectionView1:
              return .collectionView
      }
   }
}
```

### Identify the UIElements in the app using the enum

```swift
let myCollectionView = UICollectionView()
myCollectionView.accessibilityIdentifier = MyDay.collectionView1.accessibilityIdentifier
```

### Create an instance of NavigationHelper and build navigation flow

```swift
testSwipe() {
   let app = XCApplication()
   let navigationBuilder = NavigationBuilder(app: app)
   navigationBuilder
      .swipeTo(collectionView: MyDay.collectionView1)
      .cell(element: MyDay.cell1)
      .tap()
}
```
