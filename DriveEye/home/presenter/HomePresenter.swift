

import  Foundation
class HomePresenter: NSObject   {
    var delegate : HomeViewProtocol?
    var model : HomeModelIMP!

     init(model : HomeModelIMP) {
        self.model = model
    }
    func attachView( view :HomeViewProtocol){
        self.delegate? = view 
    }
    func getStartLoation() {
    model.getCurrentLocation(compleion: {city,country in
        if let city  = city ,let country = country {
            self.delegate?.setStartPoint(city)
        }
    })
    }
 
    func getEndLoation() {
        model.getCurrentLocation(compleion: {city,country in
            if let city  = city ,let country = country {
                self.delegate?.setEndPoint(city)
            }
        })
    }
    func addTrip(trip : Trip) {
        model.addNewTrip(trip)
    }
 
}

