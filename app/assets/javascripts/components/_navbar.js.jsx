const Navbar = ({profile_id}) => {
    console.log(profile_id ? profile_id :  "loading"  )
    return(
        <div >
            <ul class='navigation'>
               
                <li><a href="/">Schoober</a></li>
                <li><a href="/guidelines/index">Community Guidelines</a></li>
                <li><a href={"/drivers"}>Drivers</a></li>
                <li>
                    <div className="dropdown">
                        <button className="dropbtn">Trip Planner</button>
                        <div className="dropdown-content">
                            <a href="/parenttrips/new">Parent Trip Planner</a>
                            <a href="/drivertrips/new">Driver Trip Planner</a>
                        </div>
                    </div> 
                </li>
                <li>Dashboard</li>
                <li><a href="/logout">Logout</a></li>
            </ul>
        </div>
    )
}





