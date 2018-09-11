//
//  AnyTransitionPerformer.swift
//  XCoordinator
//
//  Created by Paul Kraft on 12.09.18.
//

public class AnyTransitionPerformer<TransitionType: TransitionProtocol>: Presentable {

    // MARK: - Stored properties

    private var _viewController: () -> UIViewController?
    private var _rootViewController: () -> TransitionType.RootViewController?
    private var _presented: (Presentable?) -> Void
    private var _perform: (TransitionType, TransitionOptions, PresentationHandler?) -> Void

    // MARK: - Computed properties

    public var viewController: UIViewController! {
        return _viewController()
    }

    public var rootViewController: TransitionType.RootViewController! {
        return _rootViewController()
    }

    // MARK: - Methods

    public func presented(from presentable: Presentable?) {
        return _presented(presentable)
    }

    public func performTransition(_ transition: TransitionType, with options: TransitionOptions, completion: PresentationHandler? = nil) {
        _perform(transition, options, completion)
    }

    // MARK: - Init

    init<C: Coordinator>(_ coordinator: C) where TransitionType == C.TransitionType {
        self._viewController = { coordinator.viewController }
        self._presented = coordinator.presented
        self._rootViewController = { coordinator.rootViewController }
        self._perform = coordinator.performTransition
    }
}
