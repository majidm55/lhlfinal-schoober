const Navbar = (props) => {
    return(
        <div >
            <ul class='navigation'>
               
            <li><a href="/">Schoober</a></li>
            <li><a href="/guidelines">Community Guidelines</a></li>
            <li><a href="/guidelines">Profile</a></li>

                <li>
                    <div className="dropdown">
                        <button className="dropbtn">Trip Planner</button>
                        <div className="dropdown-content">
                            <a href="/parenttrips/new">Parent Trip Planner</a>
                            <a href="/drivertrips/new">Driver Trip Planner</a>
                        </div>
                    </div> 
                </li>
                <li><a href="/user">Dashboard</a></li>
                <li>Logout</li>
            </ul>
        </div>
    )
}

