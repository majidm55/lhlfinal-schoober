const User = ({user}) => {
    return(
        <div>
            <h1>User Profile</h1>
            <div><img src={user.user_pic} /></div>
            <div>First Name: {user.first_name}</div>
            <div>Last Name: {user.last_name}</div>
            <div>Email: {user.email}</div>
            <div>Phone: {user.phone}</div>
        </div>
    )
}
