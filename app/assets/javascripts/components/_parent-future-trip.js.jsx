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
            return <div>
                        <div>Start: {item.start_point}</div>
                        <div>End: {item.end_point}</div>
                        <div>Date: {item.trip_date}</div>
                        <div>Time: {item.time_slot}</div>
                        <div>Spots: {item.spots_reserved}</div>
                   </div>
          })}
        </div>
    )
}