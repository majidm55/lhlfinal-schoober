const Parent_future_trip = ({matchedtripfuture}) => {
    return(
        <div>
            <h1>Future Trips</h1>
            {/* {matchedtripfuture.start_point}
            {matchedtripfuture.end_point}
            {matchedtripfuture.trip_date}
            {matchedtripfuture.time_slot}
            {matchedtripfuture.spots_reserved} */}
            {matchedtripfuture.map(item => {
            return <p>{item.start_point}
                   {item.end_point}
                   {item.trip_date}
                   {item.time_slot}
                   {item.spots_reserved}</p>
          })}
        </div>
    )
}