const Parent_active_trip = ({matchedtripactive, match_endpoint_coordinates, match_startpoint_coordinates}) => {

    console.log('parent_active trip hits.............', matchedtripactive)
    console.log('match_endpoint_coordinates trip hits.............', match_endpoint_coordinates)
    console.log('match_startpoint_coordinates trip hits.............', match_startpoint_coordinates)




return(
    <div className="activetrip ">
    

            <div className="card bg-light mb-3" style={{width:'30rem',borderRadius:'20px',marginLeft: '-14%'}}>

                <div className="card-header">
                    <h2>Active Trip</h2>
                </div>

                <img className="card-img-top activeimg" style={{width:"250px"}} src={'/images/active.jpg'} />

                <div className="card-body">

                    <ul className="list-group list-group-flush">
                        <li className="list-group-item" style={{borderRadius:'20px',marginBottom:'1%'}}>
                            <p><strong>Start Location: </strong> {matchedtripactive.start_point}</p></li>

                        <li className="list-group-item" style={{borderRadius:'20px',marginBottom:'1%'}}>
                            <p><strong>End Location:</strong> {matchedtripactive.end_point}</p></li>

                        <li className="list-group-item"style={{borderRadius:'20px',marginBottom:'1%'}}> 
                        <p><strong>Date:</strong> {matchedtripactive.trip_date}</p></li>

                        <li className="list-group-item"style={{borderRadius:'20px',marginBottom:'1%'}}>
                            <p><strong>Time:</strong> {matchedtripactive.time_slot}</p></li>

                        <li className="list-group-item"style={{borderRadius:'20px',marginBottom:'1%'}}>
                            <p><strong>Spots:</strong> {matchedtripactive.spots_reserved}</p></li>
                    </ul>
                </div>
            </div>
    </div>

    )
}

