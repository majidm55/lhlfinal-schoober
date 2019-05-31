const Dashboard = ({ matchedtripactive,  matchedtripfuture, matchedtrippast, match_endpoint_coordinates, match_startpoint_coordinates, user}) => {
    console.log('props.active.............', matchedtripactive)
    console.log('props.future.............', matchedtripfuture)
    console.log('props.past.............', matchedtrippast)
    console.log('match_endpoint_coordinates................', match_endpoint_coordinates)
    console.log('match_startpoint_coordinates................', match_startpoint_coordinates)
    console.log('user........................................', user)

    return(
        <div>

            < Parent_dashboard matchedtripactive={matchedtripactive}  matchedtripfuture={matchedtripfuture} matchedtrippast={matchedtrippast} match_endpoint_coordinates={match_endpoint_coordinates} match_startpoint_coordinates={match_startpoint_coordinates} user={user}/>

        </div>
    )
}