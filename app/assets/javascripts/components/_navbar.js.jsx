const Navbar = ({profile_id}) => {
    console.log("profile id is appearing?",profile_id)
    return(
        <div >
            <ul class='navigation'>
               
                <li><a href="/">Schoober</a></li>
                <li><a href="/guidelines/index">Community Guidelines</a></li>
                 {profile_id ?  <li><a href={"/users/" + profile_id + "/profiles"}>Profile</a></li> : null }
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
                <li>Logout</li>
            </ul>
        </div>
    )
}





