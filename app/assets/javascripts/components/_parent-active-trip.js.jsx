const Parent_active_trip = ({matchedtripactive}) => {

    console.log('parent_active trip hits.............', matchedtripactive)


    return(
        <div>
            <h1>Active Trip</h1>
            {matchedtripactive.start_point}
            {matchedtripactive.end_point}
            {matchedtripactive.trip_date}
            {matchedtripactive.time_slot}
            {matchedtripactive.spots_reserved}
        </div>
    )
}