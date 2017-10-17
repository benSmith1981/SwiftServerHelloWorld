// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftServerHelloWorld",
    dependencies: [
    .package(url: "https://github.com/IBM-Swift/Kitura.git", from:"1.7.6"),
//    .package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.5.0"),
    .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", from: "1.7.0"),
    .package(url: "https://github.com/OpenKitten/MongoKitten.git", from: "3.0.0")
    ],
    targets: [
            // Targets are the basic building blocks of a package. A target can define a module or a test suite.
            // Targets can depend on other targets in this package, and on products in packages which this package depends on.
            .target(
                name: "SwiftServerHelloWorld",
//                dependencies: ["Kitura", "HeliumLogger","Alamofire"]),
            dependencies: ["Kitura", "HeliumLogger" , "MongoKitten"]),

    ]
    
)
