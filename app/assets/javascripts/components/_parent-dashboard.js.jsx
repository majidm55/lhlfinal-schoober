const Parent_dashboard = ({ matchedtripactive, matchedtripfuture, matchedtrippast, match_startpoint_coordinates, match_endpoint_coordinates, user}) => {
    return(
        <div>
            <h1>Parent Dashboard</h1>
            {   user && < User user={user}/> }
            < Parent_active_trip matchedtripactive={matchedtripactive}  match_startpoint_coordinates={match_startpoint_coordinates} match_endpoint_coordinates={match_endpoint_coordinates} />
    {matchedtripfuture && < Parent_future_trip matchedtripfuture={matchedtripfuture}/> }
    {   matchedtrippast && < Parent_past_trip matchedtrippast={matchedtrippast}/> }
        </div>
    )
}