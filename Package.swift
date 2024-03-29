// swift-tools-version: 5.7.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DevOpsTest",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DevOpsTest",
            targets: ["DevOpsTest"]            
            )
    ],
    dependencies: [
      .package(url: "https://github.com/realm/SwiftLint.git", from: "0.50.0")
    ],
    targets: [
        .target(
            name: "DevOpsTest",
            path: "DevOpsTest"
        ),
        .testTarget(
            name: "DevOpsTestTests", 
            dependencies: ["DevOpsTest"],
            path: "DevOpsTestTests"
          ),
    ]
)
