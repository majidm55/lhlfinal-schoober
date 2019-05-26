const Navbar = (props) => {
    return(
        <div >
            <ul class='navigation'>
               
                <li>Schoober</li>
                <li>Community Guidelines</li>
                <li>Profile</li>

                <li>
                    <div className="dropdown">
                        <button className="dropbtn">Trip Planner</button>
                        <div className="dropdown-content">
                            <a href="#">Parent Trip Planner</a>
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

