import UIKit
import RealityKit
import ARKit
import MultipeerConnectivity

class ViewController: UIViewController, ARSessionDelegate {
    
    // MARK: - Properties
    var playerColor: UIColor = .blue
    var gridModeEntityX: ModelEntity?
    var gridModeEntityY: ModelEntity?
    var tileModeEntity: ModelEntity?
    
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
        gridModeEntityX = ModelEntity(
            mesh: .generateBox(size: SIMD3(x: 0.3, y: 0.01, z: 0.01)),
            materials: [SimpleMaterial(color: .white, isMetallic: false)]
        )
        
        // 2
        gridModeEntityY = ModelEntity(
            mesh: .generateBox(size: SIMD3(x: 0.01, y: 0.01, z: 0.3)),
            materials: [SimpleMaterial(color: .white, isMetallic: false)]
        )
        
        // 3
        tileModeEntity = ModelEntity(
            mesh: .generateBox(size: SIMD3(x: 0.07, y: 0.01, z: 0.07)),
            materials: [SimpleMaterial(color: .gray, isMetallic: true)]
        )
        
        // 4
        tileModeEntity?.generateCollisionShapes(recursive: false)
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
    
}

// MARK: - Gesture Functions

extension ViewController {
    
    // Add code here...
    
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



