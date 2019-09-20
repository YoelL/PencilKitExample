//
//  PencilKitViewController.swift
//  PencilKitExample
//
//  Created by Yoel Lev on 20/09/2019.
//  Copyright © 2019 Yoel Lev. All rights reserved.
//

import UIKit

class PencilKitViewController: UIViewController {

    var pencilKitCanvas =  PKCanvas()
    
    //MARK: - iOS Life Cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addPencilKit()
    }
    
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
          updateCanvasOrientation(with: view.bounds)
      }
    
    //MARK: - iOS override properties
    override var prefersHomeIndicatorAutoHidden: Bool {
          return true
      }
    
    override var prefersStatusBarHidden: Bool { 
        return true;
    }
    
    //MARK: -  Setup Functions

    private func addPencilKit() {
        view.backgroundColor = .clear
        
        pencilKitCanvas  = createPencilKitCanvas(frame: view.frame, delegate: self)
        view.addSubview(pencilKitCanvas)
      }

}

extension PencilKitViewController: PencilKitInterface { }

extension PencilKitViewController: PencilKitDelegate { }
