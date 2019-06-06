const Parent_future_trip = ({matchedtripfuture}) => {
    return(
        <div className=" futuretrip ">
            <div className="container">
                <h2>Future Trips</h2>
                <table className="table thead-dark table-hover" >
                    <thead>
                        <tr>
                        
                            <th style={{width:'24%'}}>Start Point</th>
                            <th style={{width:'21%'}}>End Point</th>
                            <th style={{width:'21%'}}>Trip Date</th>
                            <th style={{width:'21%'}}>Time Slot</th>
                            <th style={{width:'1%'}}>Spots</th>
                        </tr>
                    </thead>
                    {matchedtripfuture.map(item => {
                return <tbody>
                        <td> {item.start_point}</td>
                        <td> {item.end_point}</td>
                        <td> {item.trip_date}</td>
                        <td> {item.time_slot}</td>
                        <td> {item.spots_reserved}</td>

                       </tbody>
          })}
                </table>
            </div>

        </div>
    )
}



