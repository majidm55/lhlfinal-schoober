const Parent_dashboard = ({ matchedtripactive, matchedtripfuture, matchedtrippast, match_startpoint_coordinates, match_endpoint_coordinates, user}) => {

    return(
        <div>
          <div className="container useractive"> {   user && < User user={user}/> }
            < Parent_active_trip matchedtripactive={matchedtripactive}  match_startpoint_coordinates={match_startpoint_coordinates} match_endpoint_coordinates={match_endpoint_coordinates} />
     </div>
    <div className="container pastfuture">{matchedtripfuture && < Parent_future_trip matchedtripfuture={matchedtripfuture}/> }
    {   matchedtrippast && < Parent_past_trip matchedtrippast={matchedtrippast}/> }</div>
        </div>
    )
}