
import Foundation

class CoachPresenter  : NSObject{
    var coachModel = CoachModelIMP()
    var delegate : CoachViewProtocol?
    func getAllCoach()  {
        coachModel.getUsers(complent: {(error,coaches) in
            guard let _ = error  else{
                self.delegate?.displayData(coaches: coaches)
                return}
            self.delegate?.displayEmptyTable()
            
        }
        )
    }
    
    init(coachModel:CoachModelIMP){
        self.coachModel = coachModel
    }
    
    func attachView(view:CoachViewProtocol){
        delegate = view
    }
    
}

protocol CoachViewProtocol: NSObjectProtocol {
    func displayData(coaches : [Coach])
    func displayEmptyTable()
}


