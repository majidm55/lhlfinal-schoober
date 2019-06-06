const User = ({user}) => {
    return(
        
<div className="userprofile">
    

            <div className="card bg-light mb-3 user" style={{width:'20rem' , borderRadius:'20px',marginLeft: '26%'}}>
            
            
                <div className="card-header"><h2>{user.first_name}'s Profile</h2></div>
        
                    <img className="card-img-top userimg" src={user.user_pic} />
                    <div className="card-body">
                        <ul className="list-group list-group-flush">
                            <li className="list-group-item" style={{borderRadius:'20px',marginBottom:'1%'}}><p><strong>First Name: </strong> {user.first_name}</p></li>
                            <li className="list-group-item" style={{borderRadius:'20px',marginBottom:'1%'}}><p><strong>Last Name:</strong> {user.last_name}</p></li>
                            <li className="list-group-item"style={{borderRadius:'20px',marginBottom:'1%'}}> <p><strong>Email:</strong> {user.email}</p></li>
                            <li className="list-group-item"style={{borderRadius:'20px',marginBottom:'1%'}}><p><strong>Phone:</strong> {user.phone}</p></li>
                        </ul>
                    </div>
                </div>
           
        </div>

    )
}









