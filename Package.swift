// swift-tools-version:5.3
// Package.swift：AdProfSDK 的 Swift Package Manager 清单。
// 作用：以 binaryTarget 形式分发已打包的 Objective-C XCFramework，供业务工程通过 SPM 依赖。
import PackageDescription

let package = Package(
    name: "AdProfSDK",
    platforms: [
        // 最低支持的 iOS 版本；与现有 XCFramework 对外支持范围对齐
        .iOS(.v12)
    ],
    products: [
        // 对外暴露的库产品名，业务工程 import AdProfSDK 时对应此名称
        .library(
            name: "AdProfSDK",
            targets: ["AdProfSDK"]
        )
    ],
    targets: [
        // 二进制目标：指向仓库内的 AdProfSDK.xcframework
        // name 必须与 framework 的 module 名一致（module.modulemap 中为 AdProfSDK）
        .binaryTarget(
            name: "AdProfSDK",
            path: "AdProfSDK.xcframework"
        )
    ]
)
