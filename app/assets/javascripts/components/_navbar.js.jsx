const Navbar = (props) => {
    return(
        <div class='navigation'>
            <ul>
                <li>Schoober</li>
                <li>Community Guidelines</li>
                <li>Profile</li>
                <li><div class="dropdown">
                    <button class="dropbtn">Trip Planner</button>

                        <div class="dropdown-content">
                            <a href="#">Parent Trip Planner</a>
                            <a href="#">Driver Trip Planner</a>
    
                        </div>
                    </div> 
                    
                </li>
                <li>Dashboard</li>
                <li>Logout</li>
            



            </ul>
        </div>
    )
}

