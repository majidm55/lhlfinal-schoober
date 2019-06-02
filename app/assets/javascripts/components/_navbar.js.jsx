const Navbar = ({profile_id}) => {
    console.log(profile_id ? profile_id :  "loading"  )
return(


<nav className="navbar navbar-expand-lg justify-content-between">
<a href="/" className="navbar-left"><img className="logo" style={{width:"140px", borderRadius: "5px"}} src={'/images/logo.png'}/></a>
<button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
  <span className="navbar-toggler-icon"></span>
</button>
<div className="collapse navbar-collapse" id="navbarNavDropdown">
  <ul className="navbar-nav">
    <li className="nav-item">
      <a className="nav-link" href="/guidelines/index">Community Guidelines</a>
    </li>
    <li className="nav-item">
      <a className="nav-link" href={"/users/" + profile_id + "/profiles"}>Profile</a>
    </li>
    <li className="nav-item dropdown">
      <a className="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Trip Planner
      </a>
      <div className="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
        <a className="dropdown-item" href="/parenttrips/new">Parent Trip Planner</a>
        <a className="dropdown-item" href="/drivertrips/new">Driver Trip Planner</a>
      </div>
    </li>
    <li className="nav-item">
      <a className="nav-link" href="/logout">Dashboard</a>
    </li>
    <li className="nav-item">
      <a className="nav-link logout" href="/logout">Logout</a>
    </li>
  </ul>
</div>
</nav>
    )
}