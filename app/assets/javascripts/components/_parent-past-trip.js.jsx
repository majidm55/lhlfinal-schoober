const Parent_past_trip = ({matchedtrippast}) => {
    console.log('did matched trips past', matchedtrippast)
    return(
        <div>
            <h1>Past Trip</h1>
            {matchedtrippast.map(item => {
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