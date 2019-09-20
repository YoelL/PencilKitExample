//
//  PencilKitInterface.swift
//  PencilKitDemo
//
//  Created by Yoel Lev on 27/08/2019.
//  Copyright © 2019 Yoel Lev. All rights reserved.
//

import UIKit

protocol PencilKitDelegate: class {
    func snapshot(from canvas: PKCanvas) -> UIImage
}

extension PencilKitDelegate {
    
    func snapshot(from canvas: PKCanvas) -> UIImage {
        //Take PencilKit Drawings snapshot
        return UIImage()
    }
}

protocol PencilKitInterface: NSObject {
    var pencilKitCanvas: PKCanvas { get set }
    func createPencilKitCanvas(frame: CGRect, delegate: PencilKitDelegate) -> PKCanvas
    func updateCanvasOrientation(with frame: CGRect)
}

extension PencilKitInterface {
    
    func createPencilKitCanvas(frame: CGRect, delegate: PencilKitDelegate) -> PKCanvas {
        pencilKitCanvas = PKCanvas(frame: frame)
        pencilKitCanvas.pencilKitDelegate = delegate
        return pencilKitCanvas
    }
    
    func updateCanvasOrientation(with frame: CGRect) {
        pencilKitCanvas.updateCanvasOrientation(with: frame)
    }
}
