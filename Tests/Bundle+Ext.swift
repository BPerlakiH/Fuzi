//
//  File.swift
//  
//
//  Created by Balazs Perlaki-Horvath on 13/07/2024.
//

import Foundation
extension Bundle {
    static let testResources: Bundle = {
        let bundle = Bundle(for: BundleFinder.self)
        if let moduleName = bundle.bundleIdentifier,
           let baseURL = bundle.resourceURL,
           let testBundlePath = ProcessInfo.processInfo.environment["XCTestBundlePath"] {
            if let resourceBundle = Bundle(path: baseURL.appending(path: "/\(moduleName)_\(moduleName).bundle").absoluteString) {
                return resourceBundle
            }
        }
        return Bundle.module
    }()

    private final class BundleFinder {}
}
