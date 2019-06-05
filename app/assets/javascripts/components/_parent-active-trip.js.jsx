const Parent_active_trip = ({matchedtripactive, match_endpoint_coordinates, match_startpoint_coordinates}) => {

    console.log('parent_active trip hits.............', matchedtripactive)
    console.log('match_endpoint_coordinates trip hits.............', match_endpoint_coordinates)
    console.log('match_startpoint_coordinates trip hits.............', match_startpoint_coordinates)




    return(
        <div className="activetrip ">
    

                <div className="col-sm align-self-end">
                    <h2>Active Trip</h2>
                    <img className="activeimg" style={{width:"250px"}} src={'/images/active.jpg'}/>
                    <div><p><strong>Start:</strong> {matchedtripactive.start_point}</p></div>
                    <div><p><strong>End: </strong>{matchedtripactive.end_point}</p></div>
                    <div><p><strong>Date:</strong> {matchedtripactive.trip_date}</p></div>
                    <div><p><strong>Time: </strong>{matchedtripactive.time_slot}</p></div>
                    <div><p><strong>Spots:</strong> {matchedtripactive.spots_reserved}</p></div>

                </div>

        </div>
    )
}

