import UIKit
import PlaygroundSupport

var greeting = "Hello, playground"


class CollageGridCell: UIView {
    
}
@objc class PSXCollageMainView: UIView, PSXSelectionViewDelegate {
    var backgroundView: UIView!
    var canvasView: UIView!
    var cell: UIView!
    var selectionView: PSXSelectionView!
    
    @objc func setup() {
        backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 375))
        self.addSubview(backgroundView)
        backgroundView.backgroundColor = .green
        backgroundView.clipsToBounds = true
        
        canvasView = UIView(frame: CGRect(x: 2, y: 2, width: 370, height: 370))
        canvasView.backgroundColor = .gray
        backgroundView.addSubview(canvasView)
        canvasView.clipsToBounds = true
        
        cell = CollageGridCell(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        cell.backgroundColor = .blue
        canvasView.addSubview(cell)
        addSelectioView(cell: cell)

    }
    
    func addSelectioView(cell: UIView) {
        selectionView = PSXSelectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        selectionView.setupGestures()
        selectionView.delegate = self
        selectionView.backgroundColor = .clear
        self.addSubview(selectionView)

        let cellCelnter = cell.center
        let pointInMainView = self.convert(cellCelnter, from: canvasView)
        selectionView.center = pointInMainView
    }
    
    func draggedView(view: PSXSelectionView) {
        print(view.center)
        let centerInCanvas = canvasView.convert(view.center, from: self)
        cell.center = centerInCanvas
    }
    
}

@objc protocol PSXCollageCellViewProtocol where Self: UIView {
    func handlePanGesture(_ gesture: UIPanGestureRecognizer)
    func handleRotationGesture(_ gesture: UIRotationGestureRecognizer)
    func handlePinchGesture(_ gesture: UIPinchGestureRecognizer)
    
}

protocol PSXViewDraggable: PSXCollageCellViewProtocol {
    func addDragGesture()
    func handlePanGestureInView(_ gesture: UIPanGestureRecognizer)
}

extension PSXViewDraggable {
    func addDragGesture() {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(PSXCollageCellViewProtocol.handlePanGesture(_:)))
        self.addGestureRecognizer(gesture)
    }
    
    func handlePanGestureInView(_ gesture: UIPanGestureRecognizer) {
        guard let superView = self.superview else {return}
        let translation = gesture.translation(in: superView)
        self.center = CGPoint(x: self.center.x + translation.x, y: self.center.y + translation.y)
        gesture.setTranslation(CGPoint.zero, in: superView)
    }
}

protocol PSXViewRotatable {
    func addRotationGesture()
}

extension PSXViewRotatable where Self: UIView {
    func addRotationGesture() {
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(PSXCollageCellViewProtocol.handleRotationGesture(_:)))
        self.addGestureRecognizer(rotationGesture)
    }
    
     func handleRotationGestureInView(_ gesture: UIRotationGestureRecognizer) {
        self.transform = self.transform.rotated(by: gesture.rotation)
        gesture.rotation = 0
    }
}


protocol PSXViewResizable {
    func addPinchGesture()
}

extension PSXViewResizable where Self: UIView {
    func addPinchGesture() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(PSXCollageCellViewProtocol.handlePinchGesture(_:)))
        self.addGestureRecognizer(pinchGesture)
    }
    
    func handlePinchGestureInView(_ gesture: UIPinchGestureRecognizer) {
        guard let superview = self.superview else { return }
        
        if gesture.state == .began || gesture.state == .changed {
            let currentScale = self.frame.size.width / self.bounds.size.width
            var newScale = currentScale * gesture.scale
            
            // Limit minimum scale to half of the initial size
            let minScale = self.bounds.size.width / (superview.bounds.size.width * 2)
            
            // Limit maximum scale to four times the initial size
            let maxScale = self.bounds.size.width / (superview.bounds.size.width / 4)
            
            newScale = max(min(newScale, maxScale), minScale)
            
            let transform = CGAffineTransform(scaleX: newScale, y: newScale)
            self.transform = transform
            gesture.scale = 1
        }
    }
}


protocol PSXSelectionViewDelegate {
    func draggedView(view: PSXSelectionView)
}

@objc class PSXSelectionView: UIView, PSXViewDraggable, PSXViewRotatable, PSXViewResizable {
    var delegate: PSXSelectionViewDelegate?
    
    func handlePinchGesture(_ gesture: UIPinchGestureRecognizer) {
        self.handlePinchGestureInView(gesture)
    }
    
    func handleRotationGesture(_ gesture: UIRotationGestureRecognizer) {
        self.handleRotationGestureInView(gesture)
    }
    
    func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        self.handlePanGestureInView(gesture)
        delegate?.draggedView(view: self)
    }
   
    override init(frame: CGRect) {
   
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        self.addBorder()
    }
    
    @objc func setupGestures() {
        self.addDragGesture()
        self.addPinchGesture()
        self.addRotationGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PSXSelectionView {
    func addBorder() {
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.red.cgColor
    }
}

let mainView = PSXCollageMainView(frame: CGRect(x: 0, y: 0, width: 375, height: 700))
mainView.backgroundColor = .white
PlaygroundPage.current.liveView = mainView
mainView.setup()
//let mainView = PSXCollageCanvasView(frame: CGRect(x: 0, y: 0, width: 375, height: 700))
//mainView.backgroundColor = .white
//mainView.setup()




