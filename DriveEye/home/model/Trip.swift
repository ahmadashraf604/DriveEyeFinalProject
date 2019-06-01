
import Foundation
struct Trip {
    var id : Int?
    var startPoint,endPoint ,description : String
    var duration : Double
  init(startPoint: String,endPoint: String ,description: String,duration :Double) {
        self.startPoint=startPoint
        self.endPoint=endPoint
        self.description=description
        self.duration=duration
        id = nil
    }
    init() {
            self.startPoint=""
            self.endPoint=""
            self.description=""
            self.duration=0.0
            id = nil
    }
}
