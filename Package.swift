// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "MisakiSwift",
  platforms: [
    .iOS(.v18), .macOS(.v15)
  ],
  products: [
    .library(
      name: "MisakiSwift",
      type: .dynamic,
      targets: ["MisakiSwift"]
    ),
  ],
  dependencies: [
    // Bumped from exact 0.30.2 — see KokoroSwift fork's Package.swift
    // for the full mlx#3083 / mlx#3092 root-cause notes.
    .package(url: "https://github.com/ml-explore/mlx-swift", from: "0.31.0"),
    .package(url: "https://github.com/mlalma/MLXUtilsLibrary.git", exact: "0.0.6")
  ],
  targets: [
    .target(
      name: "MisakiSwift",
      dependencies: [
        .product(name: "MLX", package: "mlx-swift"),
        .product(name: "MLXNN", package: "mlx-swift"),
        .product(name: "MLXUtilsLibrary", package: "MLXUtilsLibrary")
     ],
     resources: [
      .process("Resources")
     ]
    ),
    .testTarget(
      name: "MisakiSwiftTests",
      dependencies: ["MisakiSwift"]
    ),
  ]
)
