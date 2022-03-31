// swift-tools-version:5.5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AWS-Tools",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AWS-Tools",
            targets: ["AWS-Tools"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
         .package(url: "https://github.com/danielgindi/Charts", from: "4.0.0"),
         .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.0.0"),
         .package(url: "https://github.com/Swiftify-Corp/IHProgressHUD.git", from: "0.1.6"),
         .package(url: "https://github.com/techprimate/TPPDF.git", from: "2.3.5"),
         .package(name: "Backendless", url: "https://github.com/Backendless/Swift-SDK", branch: "master"),
         .package(name: "SocketIO", url: "https://github.com/socketio/socket.io-client-swift.git", branch: "master"),

        
       
      
       
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AWS-Tools",
            dependencies: ["Charts","SDWebImage","IHProgressHUD","TPPDF","Backendless","SocketIO"]),
        .testTarget(
            name: "AWS-ToolsTests",
            dependencies: ["AWS-Tools"]),
    ]
)
