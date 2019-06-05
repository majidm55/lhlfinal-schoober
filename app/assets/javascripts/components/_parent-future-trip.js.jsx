const Parent_future_trip = ({matchedtripfuture}) => {
    return(
        <div className=" futuretrip ">
            <div className="col-sm align-self-start ">
                <h2>Future Trips</h2>
            {matchedtripfuture.map(item => {
            return <div >
                        <div><p><strong>Start:</strong> {item.start_point}</p></div>
                        <div><p><strong>End:</strong>  {item.end_point}</p></div>
                        <div><p><strong>Date:</strong>  {item.trip_date}</p></div>
                        <div><p><strong>Time:</strong>  {item.time_slot}</p></div>
                        <div><p><strong>Spots:</strong>  {item.spots_reserved}</p></div>
                   </div>
          })}
            </div>

        </div>
    )
}


