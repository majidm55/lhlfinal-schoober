const Navbar = ({current_user}) => {
  if(!current_user){
    return(
      <nav className="navbar navbar-expand-lg navbar-dark  ">
        <a href="/" className="navbar-left"><img className="logo" style={{width:"150px"}} src={'/images/blacklogo.png'}/></a>
        <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
          <span className="navbar-toggler-icon"></span>
        </button>
        <div className="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
          <ul className="nav justify-content-end">
            <li className="nav-item">
              <a className="nav-link" href="/guidelines/index">How-It-Works</a>
            </li>
            <li className="nav-item">
              <a className="nav-link" href="/login">Login</a>
            </li>
            </ul>
      </div>
    </nav>    
    )
  }else{
    return(


      <nav className="navbar navbar-expand-lg navbar-dark  ">
      <a href="/" className="navbar-left"><img className="logo" style={{width:"150px"}} src={'/images/blacklogo.png'}/></a>
      <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span className="navbar-toggler-icon"></span>
      </button>
      <div className="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
        <ul className="nav justify-content-end">
          <li className="nav-item">
            <a className="nav-link" href="/guidelines/index">How-It-Works</a>
          </li>
          <li className="nav-item">
            <a className="nav-link" href="/drivers">Drivers</a>
          </li>
          <li className="nav-item dropdown">
            <a className="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Trip Planner
            </a>
            <div className="dropdown-menu" aria-labelledby="navbardropdownmenulink">
              <a className="dropdown-item" href="/parenttrips/new">Parent Trip Planner</a>
              <a className="dropdown-item" href="/drivertrips/new">Driver Trip Planner</a>
            </div>
          </li>
          <li className="nav-item">
            <a className="nav-link" href={`/users/${current_user.id}`}><em>{`${current_user.first_name}`}'s</em> &#160; Dashboard</a>
          </li>
 
          <li className="nav-item">
            <a className="nav-link logout" href="/logout">Logout</a>
          </li>
        </ul>
      </div>
      </nav>
    )
  }
  

}