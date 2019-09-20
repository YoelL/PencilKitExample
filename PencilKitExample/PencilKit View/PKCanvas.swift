//
//  PKCanvas.swift
//  PencilKitDemo
//
//  Created by Yoel Lev on 17/08/2019.
//  Copyright © 2019 Yoel Lev. All rights reserved.
//

import UIKit
import PencilKit

class PKCanvas: UIView {
    
    var canvasView: PKCanvasView!
    weak var pencilKitDelegate: PencilKitDelegate?
    
    //MARK: - iOS Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPencilKitCanvas()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCanvasOrientation(with frame: CGRect) {
        self.canvasView.frame = frame
        self.frame = frame
    }
    
    private func setupPencilKitCanvas() {
         canvasView = PKCanvasView(frame:self.bounds)
         canvasView.delegate = self
         canvasView.alwaysBounceVertical = false
         canvasView.allowsFingerDrawing = true
         canvasView.becomeFirstResponder()
         addSubview(canvasView)
           
         if let window = UIApplication.shared.windows.last, let toolPicker = PKToolPicker.shared(for: window) {
            toolPicker.setVisible(true, forFirstResponder: canvasView)
            toolPicker.addObserver(canvasView)
            toolPicker.addObserver(self)
            canvasView.becomeFirstResponder()
         }
    }
    
}


// MARK: Canvas View Delegate
extension PKCanvas: PKCanvasViewDelegate {
    
    /// Delegate method: Note that the drawing has changed.
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        print("canvasViewDrawingDidChange")
    }
}

extension PKCanvas: PKToolPickerObserver {
    
    func toolPickerSelectedToolDidChange(_ toolPicker: PKToolPicker) {
        print("toolPickerSelectedToolDidChange")
    }
    
    func toolPickerIsRulerActiveDidChange(_ toolPicker: PKToolPicker) {
        print("toolPickerIsRulerActiveDidChange")
    }
    
    func toolPickerVisibilityDidChange(_ toolPicker: PKToolPicker) {
        print("toolPickerVisibilityDidChange")
    }
    
    func toolPickerFramesObscuredDidChange(_ toolPicker: PKToolPicker) {
        print("toolPickerFramesObscuredDidChange")
    }
}

