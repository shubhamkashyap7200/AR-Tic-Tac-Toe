import UIKit
import RealityKit
import ARKit
import MultipeerConnectivity

class ViewController: UIViewController, ARSessionDelegate {
    
    // MARK: - Properties
    var playerColor: UIColor = .blue
    var gridModelEntityX: ModelEntity?
    var gridModelEntityY: ModelEntity?
    var tileModelEntity: ModelEntity?
    
    // MARK: - IBOutlets & IBActions
    
    @IBOutlet var arView: ARView!
    @IBOutlet weak var message: UILabel!
    
    @IBAction func player1ButtonPressed(_ sender: Any) {
        playerColor = .blue
    }
    
    @IBAction func player2ButtonPressed(_ sender: Any) {
        playerColor = .red
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
    }
    
    // MARK: - AR View Functions
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        initModelEntities()
        initGestures()
    }
    
    func initARView() {
        arView.session.delegate = self
        arView.automaticallyConfigureSession = false
        
        let arConfiguration = ARWorldTrackingConfiguration()
        arConfiguration.planeDetection = [ .horizontal ]
        arConfiguration.environmentTexturing = .automatic
        arView.session.run(arConfiguration)
    }
    
    func initModelEntities() {
        // 1
        gridModelEntityX = ModelEntity(
            mesh: .generateBox(size: SIMD3(x: 0.3, y: 0.01, z: 0.01)),
            materials: [SimpleMaterial(color: .white, isMetallic: false)]
        )
        
        // 2
        gridModelEntityY = ModelEntity(
            mesh: .generateBox(size: SIMD3(x: 0.01, y: 0.01, z: 0.3)),
            materials: [SimpleMaterial(color: .white, isMetallic: false)]
        )
        
        // 3
        tileModelEntity = ModelEntity(
            mesh: .generateBox(size: SIMD3(x: 0.07, y: 0.01, z: 0.07)),
            materials: [SimpleMaterial(color: .gray, isMetallic: true)]
        )
        
        // 4
        tileModelEntity?.generateCollisionShapes(recursive: false)
    }
}

// MARK: - Model Entity Functions

extension ViewController {
    
    // Add code here...
    func cloneModelEntity(_ modelEntity: ModelEntity, position: SIMD3<Float>) -> ModelEntity {
        let newModelEntity = modelEntity.clone(recursive: false)
        newModelEntity.position = position
        return newModelEntity
    }
    
    func addGameBoardAnchor(transform: simd_float4x4) {
        // 1
        let arAnchor = ARAnchor(name: "XOXO Grid", transform: transform)
        
        // 2
        let anchorEntity = AnchorEntity(anchor: arAnchor)
        
        // 3 - Adding White bars
        if let entityX = gridModelEntityX, let entityY = gridModelEntityY {
            anchorEntity.addChild(cloneModelEntity(entityY, position: SIMD3(x: 0.05, y: 0, z: 0)))
            anchorEntity.addChild(cloneModelEntity(entityY, position: SIMD3(x: -0.05, y: 0, z: 0)))
            anchorEntity.addChild(cloneModelEntity(entityX, position: SIMD3(x: 0.0, y: 0, z: 0.05)))
            anchorEntity.addChild(cloneModelEntity(entityX, position: SIMD3(x: 0.0, y: 0, z: -0.05)))
        }
        
        
        // 4 - Adding Tiles
        if let tileEntity = tileModelEntity {
            anchorEntity.addChild(cloneModelEntity(tileEntity, position: SIMD3(x: -0.1, y: 0, z: -0.1)))
            anchorEntity.addChild(cloneModelEntity(tileEntity, position: SIMD3(x: 0, y: 0, z: -0.1)))
            anchorEntity.addChild(cloneModelEntity(tileEntity, position: SIMD3(x: 0.1, y: 0, z: -0.1)))
            anchorEntity.addChild(cloneModelEntity(tileEntity, position: SIMD3(x: -0.1, y: 0, z: 0.0)))
            anchorEntity.addChild(cloneModelEntity(tileEntity, position: SIMD3(x: 0.0, y: 0, z: 0.0)))
            anchorEntity.addChild(cloneModelEntity(tileEntity, position: SIMD3(x: 0.1, y: 0, z: 0.0)))
            anchorEntity.addChild(cloneModelEntity(tileEntity, position: SIMD3(x: -0.1, y: 0, z: 0.1)))
            anchorEntity.addChild(cloneModelEntity(tileEntity, position: SIMD3(x: 0.0, y: 0, z: 0.1)))
            anchorEntity.addChild(cloneModelEntity(tileEntity, position: SIMD3(x: 0.1, y: 0, z: 0.1)))
        }
        
        // 5
        anchorEntity.anchoring = AnchoringComponent(arAnchor)
        arView.scene.addAnchor(anchorEntity)
        arView.session.add(anchor: arAnchor)
    }
}

// MARK: - Gesture Functions

extension ViewController {
    
    // Add code here...
    func initGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.arView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Selectors
    @objc func handleTap() {
        print("DEBUG:: UI :: \(#function) is called")
    }
}


// MARK: - Multipeer Session Functions

extension ViewController {
    
    // Add code here...
    
}

// MARK: - Helper Functions

extension ViewController {
    
    // Add code here...
    func sendMessage(_ message: String) {
        DispatchQueue.main.async {
            self.message.text = message
        }
    }
}



