//
//  TransitionOptions.swift
//  XCoordinator
//
//  Created by Stefan Kofler on 30.04.18.
//  Copyright © 2018 Stefan Kofler. All rights reserved.
//

public struct TransitionOptions {

    // MARK: - Stored properties

    let animated: Bool

    // MARK: - Init

    public init(animated: Bool) {
        self.animated = animated
    }

    // MARK: - Static computed properties

    static var `default`: TransitionOptions {
        return TransitionOptions(animated: true)
    }
}
