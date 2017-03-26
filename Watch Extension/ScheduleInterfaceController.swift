//
//  ScheduleInterfaceController.swift
//  AirAber
//
//  Created by Akshay Iyer on 3/26/17.
//  Copyright © 2017 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class ScheduleInterfaceController: WKInterfaceController {

    @IBOutlet var flightTable: WKInterfaceTable!
    var flights = Flight.allFlights()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        flightTable.setNumberOfRows(flights.count, withRowType: "FlightRow")
        
        for index in 0..<flightTable.numberOfRows {
            if let controller = flightTable.rowController(at: index) as? FlightRowController {
                controller.flight = flights[index]
            }
        }
    
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let flight = flights[rowIndex]
        presentController(withName: "Flight", context: flight)
    }
    
}
