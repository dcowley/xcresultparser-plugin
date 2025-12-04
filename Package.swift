// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "XCResultParserPlugin",
    platforms: [.macOS(.v11)],
    products: [
        .plugin(
            name: "XCResultParserPlugin",
            targets: ["XCResultParserPlugin"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/a7ex/xcresultparser.git", branch: "main")
    ],
    targets: [
        .plugin(
            name: "XCResultParserPlugin",
            capability: .command(intent: .custom(
                verb: "xcresultparser",
                description: "prints hello world"
            )),
            dependencies: [
                .product(name: "xcresultparser", package: "xcresultparser")
            ]
        ),
    ]
)
