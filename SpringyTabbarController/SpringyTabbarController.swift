//  SpringyTabbarController
//
//  Created by Alex Gibson on 3/31/17.
//  Copyright © 2017 AG. All rights reserved.
//

import UIKit

class SpringyTabbarController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    func animateTabBarView(view:UIView){
        //animate down
        UIView.animate(withDuration: 0.1, animations: { 
            view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: nil)
        
        //animate up
        UIView.animate(withDuration: 0.15, delay: 0.1, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: .curveEaseOut, animations: { 
            view.transform = .identity
        },completion:nil)
    
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let index = tabBarController.viewControllers?.index(of: viewController) else{return}
        let tappedItem = orderedTabBarItemViews(tabBar: self.tabBar)[index]
        animateTabBarView(view: tappedItem)
    }
    
    //this checks the subviews of the tabbar and orders them for us.
    func orderedTabBarItemViews(tabBar:UITabBar) -> [UIView] {
        let interactionViews = tabBar.subviews.filter({$0.isUserInteractionEnabled})
        return interactionViews.sorted(by: {$0.frame.minX < $1.frame.minX})
    }
}
