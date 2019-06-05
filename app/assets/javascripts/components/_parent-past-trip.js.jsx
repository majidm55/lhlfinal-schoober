const Parent_past_trip = ({matchedtrippast}) => {
    console.log('did matched trips past', matchedtrippast)
    return(
        <div className="pasttrip ">
        <div className="col-sm align-self-end">
            <h2>Past Trips</h2>
        {matchedtrippast.map(item => {
        return <div >
                    <div><p><strong>Start:</strong> {item.start_point}</p></div>
                    <div><p><strong>End:</strong> {item.end_point}</p></div>
                    <div><p><strong>Date:</strong> {item.trip_date}</p></div>
                    <div><p><strong>Time:</strong> {item.time_slot}</p></div>
                    <div><p><strong>Spots:</strong> {item.spots_reserved}</p></div>
               </div>
      })}
        </div>

    </div>
    )
}


