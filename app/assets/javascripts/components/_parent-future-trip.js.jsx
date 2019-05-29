const Parent_future_trip = ({matchedtripfuture}) => {
    return(
        <div>
            <h1>Future Trips</h1>
            {matchedtripfuture.start_point}
            {matchedtripfuture.end_point}
            {matchedtripfuture.trip_date}
            {matchedtripfuture.time_slot}
            {matchedtripfuture.spots_reserved}
        </div>
    )
}

