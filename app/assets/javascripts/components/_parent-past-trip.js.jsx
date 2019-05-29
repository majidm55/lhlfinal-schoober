const Parent_past_trip = ({matchedtrippast}) => {
    console.log('did matched trips past', matchedtrippast)
    return(
        <div>
            <h1>Past Trip</h1>
            {matchedtrippast.start_point}
        </div>
    )
}

