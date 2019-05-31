const Parent_past_trip = ({matchedtrippast}) => {
    console.log('did matched trips past', matchedtrippast)
    return(
        <div>
            <h1>Past Trip</h1>
            {matchedtrippast.map(item => {
            return <p>{item.start_point}
                   {item.end_point}
                   {item.trip_date}
                   {item.time_slot}
                   {item.spots_reserved}</p>
          })}
        </div>
    )
}