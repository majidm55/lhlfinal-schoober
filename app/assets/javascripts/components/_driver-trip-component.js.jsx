const Driver_trip_planner = (props) => {
    return(
        <div>
            <h1>Driver Trip Planner</h1>
            <form>
                Start Location:
                <input type="text" name="start_point"></input><br/>
                End Location:
                <input type="text" name="end_point"></input><br/>
                Date:
                <input type="date" value="current-date" name="trip_date"></input><br/>
                Time Slot:
                <select name="time_slot">
                            <option>07:00 AM - 08:00 AM</option>
                            <option>03:00 PM - 04:00 PM</option>
                        </select>
                <br/>
                Spots Available:
                <input type="number" name="spots_available"></input><br/>
                
                <input type="submit" value="Submit" />

            </form>
        </div>
    )
}