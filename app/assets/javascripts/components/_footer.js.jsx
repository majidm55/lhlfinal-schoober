const Footer = ({profile_id}) => {
    console.log(profile_id ? profile_id :  "loading"  )
return(
    <footer className="page-footer font-small blue pt-2 py-0.5">
        <div className="container text-center">
            <div className="row"> 

            <div className="col-sm-3">
            <img className="logo" style={{width:"200px"}} src={'/images/blacklogo.png'}/>
            </div>

            <div className="col-sm-3">
                <h2> About </h2>
                <ul className="list-unstyled about">
                    <li>Projects</li>
                    <li>About Us</li>
                    <li>Blog</li>
                    <li>Outreach</li>
                    <a href="/techstack/index"><li>Tech Stack</li></a>

                </ul>

            </div>
            <div className="col-sm-3">
                <h2> Contact</h2>
                <ul className="list-unstyled">
          <li>
            <p>
              <i className="fas fa-home mr-3"></i> Toronto, ON, CA</p>
          </li>
          <li>
            <p>
              <i className="fas fa-envelope mr-3"></i> info@sinfo.com</p>
          </li>
          <li>
            <p>
              <i className="fas fa-phone mr-3"></i> + 01 234 567 88</p>
          </li>
          <li>
            <p>
              <i className="fas fa-print mr-3"></i> + 01 234 567 89</p>
          </li>
          </ul>
            </div>

            <div className="col-sm-3">

                <div className="social-networks follow">
                    <h2> Follow Us</h2>
                    
                    <ul className="list-unstyled">
                        <li><a href="#"><i className="fab fa-instagram" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i className="fab fa-twitter" aria-hidden="true"></i></a></li>
                        <li> <a href="#"><i className="fab fa-facebook" aria-hidden="true"></i></a></li>
                        <li> <a href="#"><i className="fab fa-pinterest-p"></i></a></li>
                    </ul>

                </div>
            </div>

             </div>
             
        </div>
        <div className="footer-copyright text-center py-1">
            <p>© 2019 Soo-Majid-Soumya</p>
        </div>
    </footer>
    )
}