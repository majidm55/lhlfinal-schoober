const Parent_active_trip = ({matchedtripactive, match_endpoint_coordinates, match_startpoint_coordinates}) => {

    console.log('parent_active trip hits.............', matchedtripactive)
    console.log('match_endpoint_coordinates trip hits.............', match_endpoint_coordinates)
    console.log('match_startpoint_coordinates trip hits.............', match_startpoint_coordinates)




    return(
        <div>
            <h1>Active Trip</h1>
            {matchedtripactive.start_point}
            {matchedtripactive.end_point}
            {matchedtripactive.trip_date}
            {matchedtripactive.time_slot}
            {matchedtripactive.spots_reserved}

            {match_startpoint_coordinates}
            {match_endpoint_coordinates}



        </div>
    )
}