// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WASM_StackOverflow",
    platforms: [.macOS(.v11)],
    products: [
        .executable(name: "WASM_StackOverflow", targets: ["WASM_StackOverflow"]),
    ],
    dependencies: [
        .package(url: "https://github.com/STREGAsGate/GateEngine.git", revision: "cc84db0"),
    ],
    targets: [
        .executableTarget(name: "WASM_StackOverflow", dependencies: ["GateEngine"], path: "Sources"),
    ]
)
