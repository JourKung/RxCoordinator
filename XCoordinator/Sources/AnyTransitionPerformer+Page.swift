//
//  AnyTransitionPerformer+Page.swift
//  XCoordinator
//
//  Created by Paul Kraft on 12.09.18.
//

extension AnyTransitionPerformer where TransitionType.RootViewController: UIPageViewController {
    func set(_ viewControllers: [UIViewController], direction: UIPageViewControllerNavigationDirection, with options: TransitionOptions, animation: Animation?, completion: PresentationHandler?) {
        rootViewController.transitioningDelegate = animation
        rootViewController.setViewControllers(viewControllers, direction: direction, animated: options.animated, completion: { _ in completion?() })
    }
}
