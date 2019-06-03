const Parent_active_trip = ({matchedtripactive, match_endpoint_coordinates, match_startpoint_coordinates}) => {

    console.log('parent_active trip hits.............', matchedtripactive)
    console.log('match_endpoint_coordinates trip hits.............', match_endpoint_coordinates)
    console.log('match_startpoint_coordinates trip hits.............', match_startpoint_coordinates)




    return(
        <div>
            <h1>Active Trip</h1>
            <div>Start: {matchedtripactive.start_point}</div>
            <div>End: {matchedtripactive.end_point}</div>
            <div>Date: {matchedtripactive.trip_date}</div>
            <div>Time: {matchedtripactive.time_slot}</div>
            <div>Spots: {matchedtripactive.spots_reserved}</div>
        </div>
    )
}