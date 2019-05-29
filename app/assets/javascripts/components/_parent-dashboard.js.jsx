const Parent_dashboard = ({ matchedtripactive, matchedtripfuture, matchedtrippast}) => {
    return(
        <div>
            <h1>Parent Dashboard</h1>
            < Parent_active_trip matchedtripactive={matchedtripactive} />
            < Parent_future_trip matchedtripfuture={matchedtripfuture}/>
            < Parent_past_trip matchedtrippast={matchedtrippast}/>
        </div>
    )
}