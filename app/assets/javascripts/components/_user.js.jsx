const User = ({user}) => {
    return(
        
<div className="userprofile">
    

        <div className="col-sm align-self-start ">

            <h2>{user.first_name}'s Profile</h2>
            <div><img src={user.user_pic} /></div>
            <div><p><strong>First Name: </strong> {user.first_name}</p></div>
            <div><p><strong>Last Name:</strong> {user.last_name}</p></div>
            <div><p><strong>Email:</strong> {user.email}</p></div>
            <div><p><strong>Phone:</strong> {user.phone}</p></div>

        </div>

</div>
    )
}
