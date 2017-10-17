import Kitura
import HeliumLogger
import Foundation
//import Alamofire

// Create a new router
let router = Router()

// Initialize HeliumLogger
HeliumLogger.use()

// Handle HTTP GET requests to /
router.get("/helloworld") {
    request, response, next in
    response.send("Hello, World!!")
    next()
}

// Resolve the port that we want the server to listen on.
let port: Int
let defaultPort = 8080
if let requestedPort = ProcessInfo.processInfo.environment["PORT"] {
    port = Int(requestedPort) ?? defaultPort
} else {
    port = defaultPort
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8080, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
