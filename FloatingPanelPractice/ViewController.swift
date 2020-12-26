//
//  ViewController.swift
//  FloatingPanelPractice
//
//  Created by 田澤歩 on 2020/12/26.
//

import UIKit
import FloatingPanel

class ViewController: UIViewController, FloatingPanelControllerDelegate {
    
    
    
    var fpc = FloatingPanelController()
    override func viewDidLoad() {
        super.viewDidLoad()
        fpc.delegate = self
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "fpc") as? SecondViewController else { return }
        self.showSemiModal(vc: vc)
        fpc = FloatingPanelController(delegate: self)
        fpc.layout = MyFloatingPanelLayout()
        
        
        
    }
    
    func showSemiModal(vc:SecondViewController){
        
        
        self.fpc = FloatingPanelController()
        let appearance = SurfaceAppearance()
        
        let shadow = SurfaceAppearance.Shadow()
        shadow.color = UIColor.black
        shadow.offset = CGSize(width: 0, height: 16)
        shadow.radius = 16
        shadow.spread = 8
        appearance.shadows = [shadow]
        
        appearance.cornerRadius = 24.0
        //appearance.backgroundColor = .clear
        appearance.backgroundColor = UIColor.gray
        
        fpc.surfaceView.appearance = appearance
        
        fpc.delegate = self
        
        fpc.set(contentViewController: vc)
        
        fpc.addPanel(toParent: self)
    }
    
    
    func floatingPanel(_ vc: FloatingPanelController, layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout {
          return MyFloatingPanelLayout()
      }
    
    
       }

class MyFloatingPanelLayout: FloatingPanelLayout {
    let position: FloatingPanelPosition = .bottom
    let initialState: FloatingPanelState = .tip
    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        return [
            .full: FloatingPanelLayoutAnchor(absoluteInset: 16.0, edge: .top, referenceGuide: .safeArea),
            .half: FloatingPanelLayoutAnchor(fractionalInset: 0.5, edge: .bottom, referenceGuide: .safeArea),
            .tip: FloatingPanelLayoutAnchor(absoluteInset: 10.0, edge: .bottom, referenceGuide: .safeArea),
        ]
    }
}


