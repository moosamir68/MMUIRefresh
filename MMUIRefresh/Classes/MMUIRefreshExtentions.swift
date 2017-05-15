//
//  MMUIRefreshExtentions.swift
//  Pods
//
//  Created by Moosa Mir on 5/14/17.
//
//

let minimalHeight: CGFloat = 50.0
let maxWaveHeight: CGFloat = 100.0

import UIKit

// MARK: -
// MARK: (UIView) Extension

extension UIView {
    //MARK: -
    //MARK: Vars
    
    fileprivate struct dg_associatedKeys {
        static var shapeLayerKey = "shapeLayer";
        
        static var l3ControlPointViewkey = "l3ControlPointView";
        static var l2ControlPointViewkey = "l2ControlPointView";
        static var l1ControlPointViewkey = "l1ControlPointView";
        
        static var cControlPointViewkey = "cControlPointView";
        
        static var r1ControlPointViewkey = "r1ControlPointView";
        static var r2ControlPointViewkey = "r2ControlPointView";
        static var r3ControlPointViewkey = "r3ControlPointView";
        
        static var displayLinkKey = "displayLink";
        
        static var animatingKey = "animating";
    }
    
    fileprivate var shapeLayer: CAShapeLayer! {
        get {
            return objc_getAssociatedObject(self, &dg_associatedKeys.shapeLayerKey) as! CAShapeLayer
        }
        
        set {
            objc_setAssociatedObject(self, &dg_associatedKeys.shapeLayerKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var displayLink: CADisplayLink? {
        get {
            return objc_getAssociatedObject(self, &dg_associatedKeys.displayLinkKey) as? CADisplayLink
        }
        
        set {
            objc_setAssociatedObject(self, &dg_associatedKeys.displayLinkKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var l3ControlPointView: UIView? {
        get {
            return objc_getAssociatedObject(self, &dg_associatedKeys.l3ControlPointViewkey) as? UIView
        }
        
        set {
            objc_setAssociatedObject(self, &dg_associatedKeys.l3ControlPointViewkey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var l2ControlPointView: UIView? {
        get {
            return objc_getAssociatedObject(self, &dg_associatedKeys.l2ControlPointViewkey) as? UIView
        }
        
        set {
            objc_setAssociatedObject(self, &dg_associatedKeys.l2ControlPointViewkey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var l1ControlPointView: UIView? {
        get {
            return objc_getAssociatedObject(self, &dg_associatedKeys.l1ControlPointViewkey) as? UIView
        }
        
        set {
            objc_setAssociatedObject(self, &dg_associatedKeys.l1ControlPointViewkey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var cControlPointView: UIView? {
        get {
            return objc_getAssociatedObject(self, &dg_associatedKeys.cControlPointViewkey) as? UIView
        }
        
        set {
            objc_setAssociatedObject(self, &dg_associatedKeys.cControlPointViewkey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var r1ControlPointView: UIView? {
        get {
            return objc_getAssociatedObject(self, &dg_associatedKeys.r1ControlPointViewkey) as? UIView
        }
        
        set {
            objc_setAssociatedObject(self, &dg_associatedKeys.r1ControlPointViewkey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var r2ControlPointView: UIView? {
        get {
            return objc_getAssociatedObject(self, &dg_associatedKeys.r2ControlPointViewkey) as? UIView
        }
        
        set {
            objc_setAssociatedObject(self, &dg_associatedKeys.r2ControlPointViewkey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var r3ControlPointView: UIView? {
        get {
            return objc_getAssociatedObject(self, &dg_associatedKeys.r3ControlPointViewkey) as? UIView
        }
        
        set {
            objc_setAssociatedObject(self, &dg_associatedKeys.r3ControlPointViewkey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var animating: Bool! {
        get {
            return objc_getAssociatedObject(self, &dg_associatedKeys.animatingKey) as! Bool
        }
        
        set {
            objc_setAssociatedObject(self, &dg_associatedKeys.animatingKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.isUserInteractionEnabled = !animating
            if(self.displayLink != nil){
                self.displayLink!.isPaused = !animating;
            }else{
                
            }
        }
    }
    
    
    //MARK: -
    //MARK: Methods
    func initPullToRefresh(){
        shapeLayer = CAShapeLayer();
        animating = false;
        
        self.shapeLayer.frame = CGRect(x: 0.0, y: 0.0, width: self.bounds.width, height: minimalHeight)
        self.shapeLayer.fillColor = UIColor(red: 57/255.0, green: 67/255.0, blue: 89/255.0, alpha: 1.0).cgColor
        self.shapeLayer.actions = ["position" : NSNull(), "bounds" : NSNull(), "path" : NSNull()]
        self.layer.addSublayer(self.shapeLayer)
        
        self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panGestureDidMove(_:))))
        
        self.l3ControlPointView = UIView();
        self.l2ControlPointView = UIView();
        self.l1ControlPointView = UIView();
        self.cControlPointView = UIView();
        self.r1ControlPointView = UIView();
        self.r2ControlPointView = UIView();
        self.r3ControlPointView = UIView();
        
        self.addSubview(self.l3ControlPointView!)
        self.addSubview(self.l2ControlPointView!)
        self.addSubview(self.l1ControlPointView!)
        self.addSubview(self.cControlPointView!)
        self.addSubview(self.r1ControlPointView!)
        self.addSubview(self.r2ControlPointView!)
        self.addSubview(self.r3ControlPointView!)
        
        layoutControlPoints(baseHeight: minimalHeight, waveHeight: 0.0, locationX: self.bounds.width / 2.0)
        updateShapeLayer()
        
        self.displayLink = CADisplayLink(target: self, selector: #selector(updateShapeLayer))
        self.displayLink!.add(to: RunLoop.main, forMode: RunLoopMode.defaultRunLoopMode)
        self.displayLink!.isPaused = true
    }
    func dg_center(_ usePresentationLayerIfPossible: Bool) -> CGPoint {
        if usePresentationLayerIfPossible, let presentationLayer = layer.presentation() {
            return presentationLayer.position
        }
        return center
    }
    
    func panGestureDidMove(_ gesture: UIPanGestureRecognizer) {
        if gesture.state == .ended || gesture.state == .failed || gesture.state == .cancelled {
            let centerY = minimalHeight
            
            self.animating = true
            UIView.animate(withDuration: 0.9, delay: 0.0, usingSpringWithDamping: 0.57, initialSpringVelocity: 0.0, options: [], animations: { () -> Void in
                self.l3ControlPointView!.center.y = centerY
                self.l2ControlPointView!.center.y = centerY
                self.l1ControlPointView!.center.y = centerY
                self.cControlPointView!.center.y = centerY
                self.r1ControlPointView!.center.y = centerY
                self.r2ControlPointView!.center.y = centerY
                self.r3ControlPointView!.center.y = centerY
            }, completion: { _ in
                self.self.animating = false
            })
        } else {
            let additionalHeight = max(gesture.translation(in: self).y, 0)
            
            let waveHeight = min(additionalHeight * 0.6, maxWaveHeight)
            let baseHeight = minimalHeight + additionalHeight - waveHeight
            
            let locationX = gesture.location(in: gesture.view).x
            
            layoutControlPoints(baseHeight: baseHeight, waveHeight: waveHeight, locationX: locationX)
            updateShapeLayer()
        }
    }
    
    fileprivate func layoutControlPoints(baseHeight: CGFloat, waveHeight: CGFloat, locationX: CGFloat) {
        let width = self.bounds.width
        
        let minLeftX = min((locationX - width / 2.0) * 0.28, 0.0)
        let maxRightX = max(width + (locationX - width / 2.0) * 0.28, width)
        
        let leftPartWidth = locationX - minLeftX
        let rightPartWidth = maxRightX - locationX
        
        self.l3ControlPointView!.center = CGPoint(x: minLeftX, y: baseHeight)
        self.l2ControlPointView!.center = CGPoint(x: minLeftX + leftPartWidth * 0.44, y: baseHeight)
        self.l1ControlPointView!.center = CGPoint(x: minLeftX + leftPartWidth * 0.71, y: baseHeight + waveHeight * 0.64)
        self.cControlPointView!.center = CGPoint(x: locationX , y: baseHeight + waveHeight * 1.36)
        self.r1ControlPointView!.center = CGPoint(x: maxRightX - rightPartWidth * 0.71, y: baseHeight + waveHeight * 0.64)
        self.r2ControlPointView!.center = CGPoint(x: maxRightX - (rightPartWidth * 0.44), y: baseHeight)
        self.r3ControlPointView!.center = CGPoint(x: maxRightX, y: baseHeight)
    }
    
    func updateShapeLayer() {
        self.shapeLayer.path = currentPath()
    }
    
    fileprivate func currentPath() -> CGPath {
        let width = self.bounds.width
        
        let bezierPath = UIBezierPath()
        
        bezierPath.move(to: CGPoint(x: 0.0, y: 0.0))
        bezierPath.addLine(to: CGPoint(x: 0.0, y: self.l3ControlPointView!.dg_center(self.animating).y))
        bezierPath.addCurve(to: self.l1ControlPointView!.dg_center(self.animating), controlPoint1: self.l3ControlPointView!.dg_center(self.animating), controlPoint2: self.l2ControlPointView!.dg_center(self.animating))
        bezierPath.addCurve(to: self.r1ControlPointView!.dg_center(self.animating), controlPoint1: self.cControlPointView!.dg_center(self.animating), controlPoint2: self.r1ControlPointView!.dg_center(self.animating))
        bezierPath.addCurve(to: self.r3ControlPointView!.dg_center(self.animating), controlPoint1: self.r1ControlPointView!.dg_center(self.animating), controlPoint2: self.r2ControlPointView!.dg_center(self.animating))
        bezierPath.addLine(to: CGPoint(x: width, y: 0.0))
        
        bezierPath.close()
        
        return bezierPath.cgPath
    }
    
}
