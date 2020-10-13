// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-ruby",
    products: [
        .executable(
            name: "Example",
            targets: ["Example"]),
        .library(
            name: "RubyKit",
            targets: ["RubyKit"]),
        .library(
            name: "CRuby",
            targets: ["CRuby"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Example",
            dependencies: ["RubyKit"]),
        .target(
            name: "RubyKit",
            dependencies: ["CRuby"],
            linkerSettings:  [
                .unsafeFlags(["-L/usr/local/opt/ruby/lib"]) // Fix for `ld: library not found for -lruby.2.7`
            ]),
        .testTarget(
            name: "RubyKitTests",
            dependencies: ["RubyKit"]),
        .systemLibrary(
            name: "CRuby",
            pkgConfig: "ruby-2.7", // pkg-config ruby-2.7 --libs --cflags
            providers: [
                .brew(["ruby"]) // brew info ruby
            ]),
    ]
)
