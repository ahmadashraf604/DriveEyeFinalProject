

import  Foundation
class HomePresenter: NSObject   {
    var delegate : HomeViewProtocol?
    var model : HomeModelIMP!

    init(model : HomeModelIMP) {
        self.model = model
    }
    func attachView( view :HomeViewProtocol){
        self.delegate = view 
    }
    func getStartLoation() {
    model.getStartLocation(compleion: {city in
        if let city  = city {
            self.delegate?.setStartPoint(city)
        }
    })
    }
 
    func getEndLoation() {
        model.getEndLocation(compleion: {city in
            if let city  = city {
                self.delegate?.setEndPoint(city)
            }
        })
    }
    func addTrip(trip : Trip) {
        model.addNewTrip(trip)
    }
    func getHomeInfo(id:Int){
        model.getHomeInfo(userId: id, responseHandel: {data in
            self.delegate?.initHome(data)
        }, errorHandel: {_ in
            
        })
    }
 
}

