//
//  InjectedValues.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 27/06/2025.
//

import Foundation

protocol InjectionKey {
    associatedtype Value
    
    static var currentValue: Self.Value { get set }
}

struct InjectedValues {
    nonisolated(unsafe) private static var current = InjectedValues()
    
    static subscript<K>(key: K.Type) -> K.Value where K : InjectionKey {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }
    
    static subscript<T>(_ keyPath: WritableKeyPath<InjectedValues, T>) -> T {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
}

@propertyWrapper
struct Injected<T> {
    private let keyPath: WritableKeyPath<InjectedValues, T>
    
    var wrappedValue: T {
        get { InjectedValues[keyPath] }
        set { InjectedValues[keyPath] = newValue }
    }
    
    init(_ keyPath: WritableKeyPath<InjectedValues, T>) {
        self.keyPath = keyPath
    }
}
