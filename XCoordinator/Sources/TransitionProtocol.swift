//
//  TransitionProtocol.swift
//  XCoordinator
//
//  Created by Paul Kraft on 12.09.18.
//

public protocol TransitionProtocol {
    associatedtype RootViewController: UIViewController

    var presentable: Presentable? { get }
    func perform<C: Coordinator>(options: TransitionOptions, coordinator: C, completion: PresentationHandler?) where C.TransitionType == Self

    static func generateRootViewController() -> RootViewController

    // MARK: - Always accessible transitions

    static func present(_ presentable: Presentable, animation: Animation?) -> Self
    static func embed(_ presentable: Presentable, in container: Container) -> Self
    static func dismiss(animation: Animation?) -> Self
    static func none() -> Self
    static func multiple(_ transitions: [Self], completion: PresentationHandler?) -> Self
}

extension TransitionProtocol {
    public static func multiple(_ transitions: Self..., completion: PresentationHandler?) -> Self {
        return multiple(transitions, completion: completion)
    }
}
